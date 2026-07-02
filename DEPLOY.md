# Veldboek — deployen

Drie stappen: database, code op GitHub, hosting. Duurt in totaal een minuut of tien.

## 1. Supabase (database)

1. Ga naar supabase.com, log in of maak een gratis account.
2. New Project — naam maakt niet uit, kies een regio dicht bij je (Frankfurt/West-Europa).
3. Zodra het project klaar is: ga naar **SQL Editor** → **New query**, plak de inhoud van `schema.sql`, klik **Run**.
4. Ga naar **Project Settings → API**. Kopieer:
   - **Project URL** → plak in `config.js` als `SUPABASE_URL`
   - **anon public key** → plak in `config.js` als `SUPABASE_ANON_KEY`

## 2. Code op GitHub

Vanaf deze map (`veldboek-app`):

```bash
git init
git add .
git commit -m "Veldboek v1"
git branch -M main
git remote add origin https://github.com/<jouw-gebruikersnaam>/veldboek.git
git push -u origin main
```

Maak de repo `veldboek` eerst aan op github.com (leeg, geen README aanvinken) voor je pusht.

## 3. Hosting (Vercel)

1. Ga naar vercel.com, log in met je GitHub-account.
2. **Add New → Project**, kies je `veldboek`-repo.
3. Geen build-instellingen nodig — het is statische HTML. Gewoon **Deploy**.
4. Je krijgt een URL zoals `veldboek.vercel.app`. Werkt meteen op je telefoon.

Elke keer dat je `git push` doet naar `main`, deployt Vercel automatisch de nieuwe versie. Zo verloopt elke volgende aanpassing.

## Data migreren vanuit de vorige versie

Je vorige data zat in het artifact hier in de chat en is weg (lokaal geopend bestand had geen toegang tot die opslag). Gebruik `veldboek-import.csv` (eerder gegenereerd uit je Google Takeout-export) opnieuw via de importknop in de nieuwe site — werkt identiek, alleen slaat het nu op in Supabase in plaats van in de chat.

## Iets aanpassen aan de site later

Elke wijziging: pas `index.html` aan, commit, push. Vercel doet de rest. Geen Claude-gesprek meer nodig — dit staat nu volledig op zichzelf.
