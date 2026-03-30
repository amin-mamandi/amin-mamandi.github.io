---
layout: default
---

<style>
/* Navigation Tabs Styling */
.nav-tabs {
  display: flex;
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #f8f8f8;
  border-bottom: 1px solid #ddd;
}

.nav-tabs li {
  float: left;
}

.nav-tabs li a {
  display: block;
  color: #333;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  transition: 0.3s;
}

.nav-tabs li a:hover {
  background-color: #ddd;
}

.nav-tabs li a.active {
  background-color: #fff;
  border-bottom: 3px solid #4285f4;
  font-weight: bold;
}

/* Tab Content Styling */
.tab-content {
  display: none;
  padding: 20px;
  background-color: #fff;
}

.tab-content.active {
  display: block;
}

/* Publications formatting */
.publications-list {
  list-style-type: none;
  padding-left: 0;
}

.publications-list li {
  margin-bottom: 15px;
  position: relative;
  padding-left: 15px;
}

.publications-list li:before {
  content: "•";
  position: absolute;
  left: 0;
}

/* Show More Button */
#news-list li:nth-child(n+6) {
  display: none;
}
#show-more {
  cursor: pointer;
  color: inherit;
  text-decoration: underline;
}
</style>

<ul class="nav-tabs">
  <li><a href="#home" class="tab-link active" data-tab="home">Home</a></li>
  <li><a href="#publications" class="tab-link" data-tab="publications">Publications</a></li>
  <li><a href="{{ '/blog/' | relative_url }}">Blog</a></li>
  <li><a href="{{ '/photos/' | relative_url }}">Photos</a></li>
  <li><a href="#about" class="tab-link" data-tab="about">About</a></li>
</ul>

<div id="home" class="tab-content active">
<!--   <h1>Amin MamandiPoor</h1> -->

  <p>I am a Ph.D. candidate in Electrical Engineering and Computer Science at the <a href="https://ku.edu/">University of Kansas</a>, advised by Prof. <a href="https://www.ittc.ku.edu/~heechul/">Heechul Yun</a>.</p>

  <p>Before coming to KU, I received my bachelor's and master's degrees in Computer Engineering from the University of Tabriz.</p>

  <p>You can find more details in my <a href="Amin-cv.pdf">CV</a>.</p>

  <h1>News</h1>

  <ul id="news-list">
    <li><strong>June. 2024</strong> IndySCC Selected Participant, SC24 Student Cluster Competition <a href="https://sc24.supercomputing.org/students/indyscc/">IndySCC</a>!</li>
    <li><strong>May. 2024</strong> Presented our latest project at the <a href="https://calendars.illinois.edu/detail/7507?eventId=33484844">ACE Spring Meeting</a>, Chicago, Illinois!</li>
    <li><strong>Apr. 2024</strong> <a href="https://www.gem5.org/events/bootcamp-2024">gem5 bootcamp 2024</a> travel grant awarded!</li>
    <li><strong>Jan. 2024</strong> First Place in <a href="https://i2s-research.ku.edu/isrs">I2S Student Research Symposium</a> at University of Kansas!</li>
    <li><strong>Dec. 2023</strong> Accepted the GTA offer for the Spring 2024 semester (<a href="https://alian-eecs.ku.edu/courses/eecs645/">EECS 645 - Computer Architecture</a>)!</li>
    <li><strong>Oct. 2023</strong> Presented a poster at ACE Annual Meeting, Champaign, Illinois!</li>
    <li><strong>Jun. 2023</strong> Attended <a href="https://iscaconf.org/isca2023/">ISCA 2023</a>, Orlando, Florida!</li>
    <li><strong>May 2023</strong> Passed qualifying exam!</li>
    <li><strong>Apr. 2023</strong> Attended <a href="https://ispass.org/ispass2023/">ISPASS 2023</a>, Raleigh, North Carolina!</li>
    <li><strong>Apr. 2023</strong> <a href="https://ispass.org/ispass2023/">ISPASS 2023</a> student travel grant awarded!</li>
    <li><strong>Feb. 2023</strong> I will be working as a research scholar at <a href="https://acecenter.grainger.illinois.edu/">ACE Center for Evolvable Computing</a>, one of the seven centers in JUMP 2.0, led by the Semiconductor Research Corporation and sponsored by DARPA!</li>
    <li><strong>Oct. 2022</strong> Attended <a href="https://microarch.org/micro55/index.php">MICRO 2022</a>, Chicago, Illinois!</li>
    <li><strong>Oct. 2022</strong> <a href="https://microarch.org/micro55/index.php">MICRO 2022</a> student travel grant awarded!</li>
    <li><strong>Aug. 2022</strong> Got the second place in <a href="https://semiconductor.samsung.com/newsroom/event/open-innovation-contest/">Open Innovation Contest for AXDIMM</a> Technology!</li>
    <li><strong>Jan. 2022</strong> Started my PhD at <a href="https://ku.edu/">KU</a>!</li>
  </ul>

  <p id="show-more">Show More</p>
</div>

<div id="publications" class="tab-content">
  <h1><a href="https://scholar.google.com/citations?user=yyNzGe8AAAAJ&hl=en">[Scholar]</a> <a href="https://dblp.org/pid/350/2135.html">[DBLP]</a></h1>

  <ul class="publications-list">
    <li>Connor Sullivan, <strong>Amin Mamandipoor</strong>, Cole Strickler, Heechul Yun, "<strong>Per-Bank Memory Bandwidth Regulation for Predictable and Performant Real-Time Systems</strong>", RTAS 2026 <a href="https://arxiv.org/abs/2603.26054">[paper]</a></li>
    
    <li><strong>Amin Mamandipoor</strong>, Huy Tran, and Mohammad Alian, "<strong>SDT: Cutting Datacenter Tax Through Simultaneous Data-Delivery Threads</strong>", CAL 2025 <a href="https://kansas-my.sharepoint.com/:b:/g/personal/a972m888_home_ku_edu/EcwRJPqPDqBCgqyrYGtIGiQBjapzeqVoSYxJBXeUotjZAg?e=FAKgxW">[paper]</a></li>
    
    <li>Neel Patel, <strong>Amin Mamandipoor</strong>, Mohammad Nouri, Mohammad Alian, "<strong>SmartDIMM: In-Memory Acceleration of Upper Layer I/O Protocols</strong>", HPCA 2024 <a href="https://ieeexplore.ieee.org/abstract/document/10476416">[paper]</a></li>
    
    <li>Shu-Ting Wang, Hanyang Xu, <strong>Amin Mamandipoor</strong>, Rohan Mahapatra, Byung Hoon Ahn, Soroush Ghodrati, Krishnan Kailas, Mohammad Alian, Hadi Esmaeilzadeh, "<strong>Data Motion Acceleration for Heterogeneous Cross-Domain Accelerator Chaining</strong>", HPCA 2024 <a href="https://ieeexplore.ieee.org/abstract/document/10476422">[paper]</a></li>
    
    <li>Neel Patel, <strong>Amin Mamandipoor</strong>, Derrick Quinn, Mohammad Alian, "<strong>XFM: Accelerated Software-Defined Far Memory</strong>", MICRO 2023 <a href="https://dl.acm.org/doi/abs/10.1145/3613424.3623776">[paper]</a></li>
    
    <li>Johnson Umeike, Neel Patel, Alex Manley, <strong>Amin Mamandipoor</strong>, Heechul Yun, Mohammad Alian, "<strong>Profiling gem5 Simulator</strong>", ISPASS 2023 <a href="https://ieeexplore.ieee.org/abstract/document/10158201">[paper]</a></li>
  </ul>
</div>

<div id="blog" class="tab-content">
  <h1>Blog Posts</h1>

  <p><a href="{{ '/blog/' | relative_url }}">Open the full blog page</a></p>

  <div class="post-list">
    {% for post in site.posts limit: 5 %}
    <div class="post-preview">
      <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
      <p class="post-date">{{ post.date | date: "%B %-d, %Y" }}</p>
      <div class="post-excerpt">
        {{ post.excerpt }}
      </div>
      <a href="{{ post.url | relative_url }}" class="read-more">Read more →</a>
    </div>
    {% endfor %}
  </div>
</div>


<div id="photos" class="tab-content">
  <h1>Photo Gallery</h1>
  
  <p>Coming soon!</p>
  <p><a href="{{ '/photos/' | relative_url }}">Open the photos page</a></p>
  
  <div class="photos-placeholder">
    <h2>Photo categories to look forward to:</h2>
    <ul>
      <li>Conference Presentations</li>
      <li>Research Lab Activities</li>
      <li>University of Kansas Campus</li>
      <li>Hiking Adventures</li>
    </ul>
  </div>
</div>

<div id="about" class="tab-content">
  <h1>About Me!</h1>

  <p>In my free time, I'm a big fan of science fiction movies (e.g., Harry Potter, Alita: Battle Angel, ...). Also, when the weather's good, I enjoy hiking and exploring the outdoors.</p>
  
  <p>I am also a passionate cook who loves preparing Persian dishes (e.g., Ghorme Sabzi, Fesenjoon, ...).</p>
  
  <h2>Contact Information</h2>
  <p>LinkedIn: <a href="https://www.linkedin.com/in/mamandi/" target="_blank">linkedin.com/in/mamandi</a></p>
  <p>GitHub: <a href="https://github.com/amin-mamandi" target="_blank">github.com/amin-mamandi</a></p>
</div>

<script>
// Function to show/hide news items
document.getElementById('show-more').onclick = function() {
  var items = document.querySelectorAll('#news-list li');
  for (var i = 5; i < items.length; i++) {
    items[i].style.display = 'list-item';
  }
  this.style.display = 'none';
};

function setActiveTab(tabName) {
  var tabcontent = document.getElementsByClassName("tab-content");
  for (var i = 0; i < tabcontent.length; i++) {
    tabcontent[i].classList.remove("active");
  }

  var tablinks = document.getElementsByClassName("tab-link");
  for (var i = 0; i < tablinks.length; i++) {
    tablinks[i].classList.remove("active");
  }

  var tab = document.getElementById(tabName) || document.getElementById("home");
  var activeName = tab ? tab.id : "home";
  tab.classList.add("active");

  var activeLink = document.querySelector('.tab-link[data-tab="' + activeName + '"]');
  if (activeLink) {
    activeLink.classList.add("active");
  }
}

document.addEventListener('DOMContentLoaded', function() {
  var links = document.querySelectorAll('.tab-link');
  for (var i = 0; i < links.length; i++) {
    links[i].addEventListener('click', function() {
      setActiveTab(this.dataset.tab);
    });
  }

  var initialTab = window.location.hash ? window.location.hash.substring(1) : 'home';
  setActiveTab(initialTab);
});

window.addEventListener('hashchange', function() {
  var nextTab = window.location.hash ? window.location.hash.substring(1) : 'home';
  setActiveTab(nextTab);
});
</script>

<link rel="stylesheet" href="blog-styles.css">
