/* Smooth scroll unutar .snap kontejnera (kompenzuje fiksni header) */
const HEADER = document.querySelector('.site-header');
const SNAP = document.querySelector('.snap') || document.scrollingElement;
const HEADER_H = HEADER ? HEADER.offsetHeight : 64;

function scrollToHashInsideContainer(hash){
  const target = document.querySelector(hash);
  if(!target) return;
  const rT = target.getBoundingClientRect();
  const rC = SNAP.getBoundingClientRect();
  const top = SNAP.scrollTop + (rT.top - rC.top) - HEADER_H;
  SNAP.scrollTo({ top, behavior: 'smooth' });
  history.pushState(null, "", hash);
}
document.querySelectorAll('.site-header .nav a[href^="#"]').forEach(a=>{
  a.addEventListener('click', e=>{
    e.preventDefault();
    scrollToHashInsideContainer(a.getAttribute('href'));
  });
});

/* Fokus (hover/click) animacija kartica – FLIP pristup */
const grid = document.getElementById('servicesGrid');
const overlay = document.getElementById('cardFocus');

function centerRect(w,h){ return {left:(window.innerWidth-w)/2, top:(window.innerHeight-h)/2}; }
function openCard(card){
  if(!grid || !overlay) return;
  grid.classList.add('dim');

  const r = card.getBoundingClientRect();
  const clone = card.cloneNode(true);
  clone.classList.add('focus-card');

  const moreText = card.getAttribute('data-more') || '';
  const more = document.createElement('div');
  more.className = 'card-more';
  more.innerHTML = `<p>${moreText}</p>`;
  clone.appendChild(more);

  // start (pozicija originala)
  clone.style.left = `${r.left}px`; clone.style.top = `${r.top}px`;
  clone.style.width = `${r.width}px`; clone.style.height = `${r.height}px`;

  overlay.innerHTML = ''; overlay.appendChild(clone);
  overlay.classList.add('active');

  // meta (centar ekrana)
  const W = Math.min(900, window.innerWidth * 0.92);
  const H = Math.min(600, window.innerHeight * 0.86);
  const {left, top} = centerRect(W, H);
  requestAnimationFrame(()=>{
    clone.style.left = `${left}px`;
    clone.style.top = `${top}px`;
    clone.style.width = `${W}px`;
    clone.style.height = `${H}px`;
  });

  const closeIfOut = () => { if(!clone.matches(':hover')) closeCard(); };
  clone.addEventListener('mouseleave', closeIfOut);
  overlay.addEventListener('click', (e)=>{ if(e.target === overlay) closeCard(); });
  window.addEventListener('keydown', escHandler);
}
function escHandler(e){ if(e.key === 'Escape') closeCard(); }
function closeCard(){
  overlay.classList.remove('active');
  overlay.innerHTML = '';
  grid?.classList.remove('dim');
  window.removeEventListener('keydown', escHandler);
}
if(grid && overlay){
  grid.querySelectorAll('.card').forEach(card=>{
    card.addEventListener('mouseenter', ()=>openCard(card));
    card.addEventListener('click', ()=>openCard(card));
  });
}
