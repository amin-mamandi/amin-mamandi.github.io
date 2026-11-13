(() => {
  const photos = [...document.querySelectorAll('.photo')];
  const viewer = document.querySelector('.viewer');
  const stage = viewer.querySelector('.stage');
  const reduceMotion = matchMedia('(prefers-reduced-motion: reduce)');
  let current = 0;
  let busy = false;
  let touchStart;
  let opener;
  const animate = async (element, frames, duration = 280) => {
    if (reduceMotion.matches) return;
    await element.animate(frames, { duration, easing: 'cubic-bezier(.2,.7,.2,1)', fill: 'none' }).finished.catch(() => {});
  };
  function render() {
    stage.querySelector('video')?.pause();
    const photo = photos[current];
    const media = document.createElement(photo.dataset.video === 'true' ? 'video' : 'img');
    if (media.tagName === 'VIDEO') {
      media.controls = true;
      media.playsInline = true;
      media.poster = photo.querySelector('img').src;
    } else {
      media.alt = photo.dataset.name;
      // Use the thumbnail immediately while the full image loads.
      media.src = photo.querySelector('img').src;
      const full = new Image();
      full.onload = () => { if (stage.firstElementChild === media) media.src = full.src; };
      full.src = photo.href;
    }
    if (media.tagName === 'VIDEO') media.src = photo.href;
    stage.replaceChildren(media);
    document.querySelector('#photo-name').textContent = photo.dataset.name;
    document.querySelector('#photo-position').textContent = `${current + 1} / ${photos.length}`;
    return media;
  }
  function thumbnailTransform(media, photo) {
    const from = photo.getBoundingClientRect();
    const to = media.getBoundingClientRect();
    if (!to.width || !to.height) return 'scale(.9)';
    return `translate(${from.x + from.width / 2 - to.x - to.width / 2}px, ${from.y + from.height / 2 - to.y - to.height / 2}px) scale(${from.width / to.width}, ${from.height / to.height})`;
  }
  async function open(index) {
    if (busy) return;
    busy = true;
    current = index;
    opener = photos[index];
    const media = render();
    viewer.showModal();
    document.body.style.overflow = 'hidden';
    viewer.querySelector('.close').focus();
    if (media.tagName === 'IMG') await media.decode().catch(() => {});
    await animate(media, [{ transform: thumbnailTransform(media, opener), opacity: .4 }, { transform: 'none', opacity: 1 }]);
    busy = false;
  }
  async function close() {
    if (busy || !viewer.open) return;
    busy = true;
    const media = stage.firstElementChild;
    stage.querySelector('video')?.pause();
    await animate(media, [{ transform: 'none', opacity: 1 }, { transform: thumbnailTransform(media, photos[current]), opacity: 0 }], 220);
    viewer.close();
    document.body.style.overflow = '';
    opener?.focus({ preventScroll: true });
    busy = false;
  }
  async function navigate(direction) {
    if (busy) return;
    busy = true;
    current = (current + direction + photos.length) % photos.length;
    const media = render();
    await animate(media, [{ opacity: 0, transform: `translateX(${direction * 35}px)` }, { opacity: 1, transform: 'none' }], 200);
    busy = false;
  }
  photos.forEach((photo, index) => photo.addEventListener('click', event => {
    if (event.metaKey || event.ctrlKey || event.shiftKey || event.altKey) return;
    event.preventDefault();
    open(index);
  }));
  viewer.querySelector('.close').addEventListener('click', close);
  viewer.querySelector('.previous').addEventListener('click', () => navigate(-1));
  viewer.querySelector('.next').addEventListener('click', () => navigate(1));
  viewer.addEventListener('cancel', event => { event.preventDefault(); close(); });
  viewer.addEventListener('keydown', event => {
    if (event.target.tagName === 'VIDEO') return;
    if (event.key === 'ArrowLeft' || event.key === 'ArrowRight') {
      event.preventDefault(); navigate(event.key === 'ArrowLeft' ? -1 : 1);
    }
  });
  stage.addEventListener('click', event => { if (event.target === stage) close(); });
  stage.addEventListener('touchstart', event => {
    touchStart = event.touches.length === 1 && event.target.tagName !== 'VIDEO' ? { x: event.touches[0].clientX, y: event.touches[0].clientY } : null;
  }, { passive: true });
  stage.addEventListener('touchend', event => {
    if (!touchStart) return;
    const dx = event.changedTouches[0].clientX - touchStart.x;
    const dy = event.changedTouches[0].clientY - touchStart.y;
    if (Math.abs(dx) > 50 && Math.abs(dx) > Math.abs(dy) * 1.5) navigate(dx < 0 ? 1 : -1);
    touchStart = null;
  }, { passive: true });
})();
