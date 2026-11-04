<p align="center"><img src="riley-raptor.webp" width="180" alt="The Riley Raptor"></p>

# Riley Rangers

Troop app: rangers with profile photos and badges, activities, meeting minutes, merit badges, songs (sheet music and recordings) and the handbook. Works offline as a PWA; optional sync through Supabase.

## Run

Static files, no build. Serve the folder (GitHub Pages, Netlify, or `python3 -m http.server`) and open it. On iPhone: Share → Add to Home Screen.

## Sync

`config.js` holds the Supabase URL and publishable key. Sync uses the `rangers_items` table and the `rangers-files` storage bucket.

Only the signed-in leader can edit. Everyone else gets a read-only copy, which needs the read policies in `supabase-public-read.sql` (run it once in the Supabase SQL Editor).

## Deploy updates

Bump `V` in `sw.js` (e.g. `rr-v12` → `rr-v13`) so installed phones fetch the new version.

## Files

| | |
|---|---|
| `index.html`, `app.js`, `style.css` | the app |
| `config.js` | Supabase settings |
| `sw.js`, `manifest.webmanifest`, `icon-*.png`, `apple-touch-icon.png` | offline and install |
| `riley-raptor.webp`, `fabric.jpg`, `map-*.jpg` | the Riley Raptor, fabric, maps |
| `fonts.css`, `alegreya-*.woff2` | Alegreya (SIL Open Font License) |
| `pdf.min.js`, `pdf.worker.min.js`, `supabase.min.js` | pdf.js (Apache 2.0), supabase-js (MIT) |

Everything sits in one folder, so a plain GitHub file upload works.
