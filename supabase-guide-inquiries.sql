-- Studio Miraie 解説ページ（/guide/）問い合わせフォーム用テーブル
-- 2026-11-22: FormSubmit から Supabase 方式へ切替
create table if not exists public.guide_inquiries (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  name text not null,
  shop_name text,
  industry text,
  email text not null,
  instagram text,
  plan text,
  message text
);

alter table public.guide_inquiries enable row level security;

-- 匿名（anon）には INSERT のみ許可。SELECT/UPDATE/DELETE のポリシーは作らない
drop policy if exists "anon can insert guide inquiries" on public.guide_inquiries;
create policy "anon can insert guide inquiries"
  on public.guide_inquiries
  for insert
  to anon
  with check (true);
