# Gym Grindz

Website for **Gym Grindz** — sports performance and adult fitness training with Coach DJ (Durron Newman) in Islip Terrace, NY.

**Live:** https://gym-grindz.vercel.app

The entire site is one self-contained `index.html`. No build step, no dependencies, no framework. Open the file in a browser and it runs.

---

## What's in it

A single-page site built around the four-pillar Gym Grindz system (Speed / Strength / Mobility / Mindset):

| Section | Purpose |
| --- | --- |
| Hero | Animated headline, three CTAs, live session clock |
| The System | Four performance pillars + why-train-here differentiators |
| Athletes | Sport-specific services, plus the Girls Flag Football program |
| Adult Fitness | Personal training, small group, weight loss, recovery |
| Packages | Individual sessions, monthly package, in-season/off-season blocks |
| Results | Transformation wall for real client before/afters |
| Instagram | Grid linking to [@gym_grindz_fit](https://instagram.com/gym_grindz_fit) |
| Contact | Both phone numbers, address, and a booking form |

The booking form has no backend. On submit it composes a pre-written SMS to Coach DJ's phone and opens the visitor's messaging app — so requests arrive as a normal text, with nothing stored and nothing to maintain.

Built with Anton (display), Space Grotesk (body), and JetBrains Mono (labels), loaded from Google Fonts. Animations include a weight-plate loading sequence, custom cursor, magnetic buttons, scroll reveals, parallax, and animated stat counters — all disabled automatically when the visitor has reduced motion enabled.

---

## Running it locally

Open `index.html` directly in a browser, or serve it over HTTP:

```bash
powershell -NoProfile -ExecutionPolicy Bypass -File serve.ps1
```

Then visit http://localhost:8412. The script is a small static file server that needs no Node or Python — it's for local preview only and is excluded from deployment.

---

## Deploying

Hosted on Vercel as a static site. From this folder:

```bash
npx vercel deploy --prod --yes
```

Any static host works just as well — GitHub Pages, Netlify, Cloudflare Pages — since there's nothing to build. Point the host at this folder and serve `index.html`.

---

## Placeholders to replace

The site is live and complete, but some content is intentionally standing in until real material is available. Each item below is a small, isolated edit in `index.html`.

**Prices** — the three package cards use placeholder rates ($75/session, $299/month, $650/block). The section is labeled as placeholder pricing on the page. Search for `class="price"`.

**Stat numbers** — the counters (500+ sessions, 12+ sports) are placeholders, labeled as such below the stats bar. Search for `data-count`.

**Photos** — twelve stock photographs from [Unsplash](https://unsplash.com) stand in for real Gym Grindz training shots: the hero background, two session frames, three transformation slots, and six Instagram tiles. Each is a single `src` swap on an `<img class="pf-img">`, `<img class="ig-img">`, or the `.hero-bg` image. Replace the URL with a real photo and update the `alt` text to describe it. The captions currently say "stand-in shot" — remove that wording once real photos are in.

**Logo** — the hexagon badge is a hand-built SVG recreation of the real Gym Grindz logo, defined once as `<symbol id="gg-badge">` near the top of the file and reused in the nav, loader, and footer. Replacing the symbol's contents updates all three at once. Swapping in the original logo file is worthwhile whenever it's available.

---

## Brand

Colors are defined as CSS custom properties in `:root` at the top of the stylesheet — change them there and they update everywhere.

| Token | Value | Used for |
| --- | --- | --- |
| `--volt` | `#72E63E` | CTAs, accents, active states |
| `--kelly` | `#2F9E44` | Logo badge lettering |
| `--gold` | `#EDC15C` | Prices, phone numbers, program tags |
| `--black` | `#0A0A0B` | Page background |
| `--coal` / `--coal-2` | `#131315` / `#1A1B1E` | Section and card backgrounds |
| `--steel` | `#8B9099` | Secondary text |
| `--chalk` | `#F1F2ED` | Primary text |

Taglines used on the page come from Gym Grindz's own materials: *"Grind now. Shine on game day."*, *"Train with purpose. Perform with confidence."* (athletes), and *"Train with purpose. Move with power. Live strong."* (adults).

---

## Contact

**Coach DJ — Durron Newman**
Text or call: (646) 229-8391 · (631) 904-0173
The Lab — 42 Lowell Ave, Islip Terrace, NY 11752
Instagram: [@gym_grindz_fit](https://instagram.com/gym_grindz_fit)

---

Stock photography from Unsplash, used under the [Unsplash License](https://unsplash.com/license). Fonts from Google Fonts under the SIL Open Font License. All Gym Grindz branding, copy, and business information are property of Gym Grindz.
