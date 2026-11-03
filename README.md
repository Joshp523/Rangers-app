<p align="center"><img src="img/logo.webp" width="180" alt="Riley Rangers eagle"></p>

# Riley Rangers

Troop app: rangers with profile photos and badges, activities, meeting minutes, merit badges, songs (sheet music and recordings) and the handbook. Works offline as a PWA; optional sync through Supabase.

## Run

Static files, no build. Serve the folder (GitHub Pages, Netlify, or `python3 -m http.server`) and open it. On iPhone: Share → Add to Home Screen.

## Sync

`config.js` holds the Supabase URL and publishable key. Sync uses the `rangers_items` table and the `rangers-files` storage bucket.

## Deploy updates

Bump `V` in `sw.js` (e.g. `rr-v11` → `rr-v12`) so installed phones fetch the new version.

## Files

| | |
|---|---|
| `index.html`, `app.js`, `style.css` | the app |
| `config.js` | Supabase settings |
| `sw.js`, `manifest.webmanifest`, `icon-*.png`, `apple-touch-icon.png` | offline and install |
| `img/` | eagle logo, fabric tile, maps |
| `fonts/`, `fonts.css` | Alegreya (SIL Open Font License) |
| `vendor/` | pdf.js (Apache 2.0), supabase-js (MIT) |
