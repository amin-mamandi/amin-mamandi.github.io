"""Create web copies from gallery/ originals (requires ImageMagick and ffmpeg)."""
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
import json
import subprocess

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'assets/photos'
OUTPUT.mkdir(parents=True, exist_ok=True)

def run(*args):
    subprocess.run(args, check=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)

def prepare(source):
    name = source.stem.lower()
    video = source.suffix.lower() == '.mov'
    full = OUTPUT / (name + ('.mp4' if video else '.webp'))
    thumb = OUTPUT / (name + '-thumb.webp')
    if video:
        if not full.exists():
            run('ffmpeg', '-y', '-i', str(source), '-vf', "scale='min(1920,iw)':-2", '-c:v', 'libx264', '-crf', '24', '-preset', 'fast', '-pix_fmt', 'yuv420p', '-c:a', 'aac', '-movflags', '+faststart', str(full))
        if not thumb.exists():
            run('ffmpeg', '-y', '-i', str(full), '-frames:v', '1', '-vf', 'scale=600:-1', str(thumb))
    else:
        if not full.exists():
            run('convert', str(source)+'[0]', '-auto-orient', '-resize', '2400x2400>', '-strip', '-quality', '85', str(full))
        if not thumb.exists():
            run('convert', str(full), '-resize', '600x600>', '-quality', '78', str(thumb))
    return {'name': name.replace('-', ' ').capitalize(), 'src': '/assets/photos/'+full.name, 'thumb': '/assets/photos/'+thumb.name, 'video': video}

sources = sorted(p for p in (ROOT/'gallery').iterdir() if p.suffix.lower() in {'.jpg', '.jpeg', '.heic', '.png', '.mov'})
with ThreadPoolExecutor(max_workers=3) as pool:
    items = list(pool.map(prepare, sources))
(ROOT/'_data/gallery.json').write_text(json.dumps(items, indent=2)+'\n')
print(f'Prepared {len(items)} gallery items.')
