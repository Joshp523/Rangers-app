// Bump V whenever you deploy a new version so phones refresh their cache.
const V='rr-v11',ASSETS=["./", "./app.js", "./apple-touch-icon.png", "./config.js", "./fonts.css", "./fonts/alegreya-sans-400.woff2", "./fonts/alegreya-sans-500.woff2", "./fonts/alegreya-sans-700.woff2", "./fonts/alegreya-sc-500.woff2", "./fonts/alegreya-sc-700.woff2", "./icon-192.png", "./icon-512.png", "./img/fabric.jpg", "./img/logo.webp", "./img/map-us.jpg", "./img/map-world.jpg", "./index.html", "./manifest.webmanifest", "./style.css", "./vendor/pdf.min.js", "./vendor/pdf.worker.min.js", "./vendor/supabase.min.js"];
self.addEventListener('install',e=>e.waitUntil(caches.open(V).then(c=>c.addAll(ASSETS)).then(()=>self.skipWaiting())));
self.addEventListener('activate',e=>e.waitUntil(caches.keys().then(ks=>Promise.all(ks.filter(k=>k!=V).map(k=>caches.delete(k)))).then(()=>self.clients.claim())));
self.addEventListener('fetch',e=>{const r=e.request;
 if(r.method!='GET'||new URL(r.url).origin!=location.origin)return;
 if(r.mode=='navigate'){e.respondWith(caches.match('./index.html').then(m=>{const n=fetch(r).then(x=>{if(x.ok)caches.open(V).then(c=>c.put('./index.html',x.clone()));return x}).catch(()=>m);return m||n}));return}
 e.respondWith(caches.match(r).then(m=>m||fetch(r).then(x=>{if(x.ok)caches.open(V).then(c=>c.put(r,x.clone()));return x})))});
