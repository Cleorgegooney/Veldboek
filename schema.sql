-- Plak dit in Supabase: Dashboard -> SQL Editor -> New query -> Run

create table places (
  id uuid primary key default gen_random_uuid(),
  naam text not null,
  type text not null default 'beide',
  subcategorie text default '',
  prijsklasse text default '',
  stad text default '',
  provincie text default '',
  land text default '',
  lat double precision,
  lng double precision,
  status text not null default 'wil gaan',
  terras boolean not null default false,
  notitie text default '',
  bron text default '',
  created_at timestamptz not null default now()
);

-- Row Level Security aanzetten. Zonder policy is de tabel dan standaard
-- ontoegankelijk; onderstaande policy staat lezen/schrijven toe voor
-- iedereen die de anon key heeft (die key zit straks zichtbaar in je
-- frontend-code, zoals gebruikelijk bij Supabase). Voor persoonlijk
-- gebruik met niet-gevoelige data (eetadresjes) is dat een aanvaardbaar
-- risico. Wil je het afsluiten voor de buitenwereld, dan heb je een
-- login-laag nodig (Supabase Auth) - kan ik later toevoegen.
alter table places enable row level security;

create policy "allow all for anon"
on places
for all
to anon
using (true)
with check (true);

-- Index voor snellere filtering
create index places_type_idx on places (type);
create index places_status_idx on places (status);
