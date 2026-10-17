-- Riley Rangers: run this whole file once in Supabase > SQL Editor.
create table if not exists public.items (
  id text primary key,
  kind text not null check (kind in ('badge','scout','act','doc','song','map')),
  data jsonb not null default '{}'::jsonb,
  deleted boolean not null default false,
  updated_at bigint not null default 0,
  synced_at timestamptz not null default now()
);
create index if not exists items_synced_idx on public.items (synced_at);
create or replace function public.touch_synced_at() returns trigger language plpgsql as $$
begin new.synced_at := now(); return new; end $$;
drop trigger if exists items_touch on public.items;
create trigger items_touch before insert or update on public.items for each row execute function public.touch_synced_at();
alter table public.items enable row level security;
drop policy if exists "leaders read" on public.items;
drop policy if exists "leaders add" on public.items;
drop policy if exists "leaders edit" on public.items;
create policy "leaders read" on public.items for select to authenticated using (true);
create policy "leaders add" on public.items for insert to authenticated with check (true);
create policy "leaders edit" on public.items for update to authenticated using (true) with check (true);
insert into storage.buckets (id, name, public) values ('files', 'files', false) on conflict (id) do nothing;
drop policy if exists "files read" on storage.objects;
drop policy if exists "files add" on storage.objects;
drop policy if exists "files edit" on storage.objects;
create policy "files read" on storage.objects for select to authenticated using (bucket_id = 'files');
create policy "files add" on storage.objects for insert to authenticated with check (bucket_id = 'files');
create policy "files edit" on storage.objects for update to authenticated using (bucket_id = 'files') with check (bucket_id = 'files');
