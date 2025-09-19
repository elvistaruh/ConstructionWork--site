# Gradjevina Site — v3 (sa stvarnim Unsplash fotografijama)

Ovaj paket sadrži kompletan sajt plus skripte za **automatsko preuzimanje** realnih fotografija sa Unsplash-a koje sam odabrao.

## Izabrane fotografije (Unsplash)
- **Hero (hero.jpg)** — Modern glass facade — https://unsplash.com/photos/cKjaZ68gSrc
- **Projektovanje (service-design.jpg)** — Beam design / blueprint on desk — https://unsplash.com/photos/m9qMoh-scfE
- **Nadzor (service-supervision.jpg)** — Engineer with blueprint on site — https://unsplash.com/photos/r5BOfNgTVxo
- **Izvođenje (service-construction.jpg)** — Construction site with crane — https://unsplash.com/photos/xeF8HHExwHU
- **Energetska efikasnost (service-green.jpg)** — Rooftop solar panels — https://unsplash.com/photos/73JOOymZQTQ
- **O nama pozadina (about-bg.jpg)** — Modern lobby interior — https://unsplash.com/photos/NxtKALyY6po
- **Lokacije pozadina (offices-bg.jpg)** — Modern spacious lobby — https://unsplash.com/photos/866LKn6Uc-o

Sve slike su sa Unsplash-a i besplatne za komercijalnu upotrebu (Unsplash License).

## Kako preuzeti slike automatski (preporučeno)
### macOS / Linux
U terminalu, uđite u folder projekta i pokrenite:
```bash
bash download_images.sh
```
### Windows (PowerShell)
Uđite u folder projekta, desni klik → “Open in Terminal”, pa:
```powershell
.\download_images.ps1
```

Skripte će preuzeti slike i **prepisati postojeće placeholder-e** u `assets/img/` istim imenima koje koristi sajt.

## Ručno preuzimanje (ako želite)
Otvorite gore navedene linkove i preuzmite sliku; sačuvajte pod tačnim imenom u `assets/img/`.

## Napomena
- HTML i CSS su već podešeni; nije potrebno ništa mijenjati.
- Ako želite druge fotografije, zamijenite URL-ove u skriptama i pokrenite ponovo.
