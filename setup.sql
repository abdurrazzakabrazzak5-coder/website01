-- Run once in Supabase > SQL Editor
create table products (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text,
  price numeric not null,
  old_price numeric,
  sizes text,
  description text,
  images text[] default '{}',
  in_stock boolean default true,
  created_at timestamptz default now()
);
alter table products enable row level security;
create policy "public read" on products for select using (true);
create policy "admin write" on products for all to authenticated using (true) with check (true);

insert into storage.buckets (id, name, public) values ('products','products',true);
create policy "img read" on storage.objects for select using (bucket_id='products');
create policy "img write" on storage.objects for all to authenticated
  using (bucket_id='products') with check (bucket_id='products');
