-- Riley Rangers: let visitors read the troop's book without signing in.
-- Run once in Supabase: SQL Editor -> New query -> paste -> Run.
-- Touches only the Rangers table and the Rangers file bucket; your other apps are unaffected.
-- Reading only: adding, changing and deleting still require you to be signed in.

drop policy if exists "rangers public read" on public.rangers_items;
create policy "rangers public read" on public.rangers_items
  for select to anon, authenticated using (true);

drop policy if exists "rangers files public read" on storage.objects;
create policy "rangers files public read" on storage.objects
  for select to anon, authenticated using (bucket_id = 'rangers-files');
