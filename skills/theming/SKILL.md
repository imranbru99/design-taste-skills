---
name: theming
description: >-
  Defines semantic color tokens and a dark theme as a designed surface,
  including accent adjustment, elevation, borders, and a persistent theme
  toggle that respects system preference. Use when implementing dark mode,
  light mode, design tokens, theme switching, or when a dark theme looks like
  an inverted light theme. Use with design-taste and color.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Dark mode and theming

A theme is a set of semantic tokens, not a coat of paint and not `filter: invert()`. Dark mode is a separate material: backgrounds lift in steps, borders do more work than shadows, and the accent usually has to be lighter than its light-mode pair to clear contrast.

Decide the palette in `color`. This skill turns that palette into tokens and a second theme that feels designed.

## When to use

- You are adding dark mode, a theme toggle, or CSS variables for color.
- A "dark theme" exists but is the light theme with inverted hex values, pure black, or unreadable muted text.
- You are about to hardcode a hex in a component.

Skip token machinery for a one-section prototype that will be thrown away. Use the tokens as soon as a second screen exists.

## Token set

Name tokens by job, not by appearance. `--text` works in both themes. `--gray-900` does not, because in a dark theme the text is light.

Minimum set:

| Token | Job |
| --- | --- |
| `--bg` | The page. The lowest layer. |
| `--surface` | A sheet that sits on the page: a panel, an input, a menu. |
| `--surface-2` | A sheet on a sheet: a selected row, a code block, a nested well. Rare. |
| `--text` | Primary text and icons that must read as primary. |
| `--muted` | Secondary text. Still at least 4.5:1 on `--bg` and on `--surface`. |
| `--line` | Hairline borders. |
| `--line-strong` | Input borders, stronger dividers. |
| `--accent` | Primary action fill. |
| `--accent-contrast` | Label on the accent fill. 4.5:1 against `--accent`. |
| `--accent-hover` | Accent fill on hover. |
| `--danger`, `--danger-ink` | Danger fill and danger text, if they differ. |
| `--shadow-pop` | Only for floating layers. |

Add `--warning` and `--success` only when the product has those states. Map status the same way in both themes: a deep or light ink for text, never a bright hue used as text on a close background.

Do not expose the raw ramp to feature code. Feature code uses semantic tokens. The ramp can live under them if a designer needs steps.

## A paired theme

Design both columns together. This warm pair is a worked example, not a default brand. Build your own from the product's temperature.

| Token | Light | Dark |
| --- | --- | --- |
| `--bg` | `#F7F4EF` | `#141210` |
| `--surface` | `#FFFCF8` | `#1E1A17` |
| `--surface-2` | `#F1EBE4` | `#28231F` |
| `--text` | `#1C1612` | `#F3EEE7` |
| `--muted` | `#5E564E` | `#B7ADA3` |
| `--line` | `#E4DCD2` | `#3A332C` |
| `--line-strong` | `#8A7B6E` | `#8C7E72` |
| `--accent` | `#1C1612` | `#F3EEE7` |
| `--accent-contrast` | `#F7F4EF` | `#141210` |
| `--danger` | `#9C2B1A` | `#F0A89A` |

Notes on the dark column:

- The page is a tinted near-black, not `#000`. Pure black makes every shadow invisible and makes OLED smearing more obvious on large fields. It also makes the light theme's warm tint look unrelated.
- Surfaces get *lighter* as they rise. Elevation is a lighter fill plus a slightly stronger border. Shadows are secondary. A dark theme that relies on `box-shadow` to separate panels looks muddy.
- `--muted` is much lighter than a naive invert of the light muted color. `#6B625A` on `#141210` fails contrast. Check it.
- The accent flips to the light ink so the primary button still feels like the loudest small object. If the product has a chromatic accent, lighten it for dark backgrounds (a 500-level blue that worked as a fill on white often needs a 300-level tint as text, or a deeper fill with light text). Do not reuse one hex for "the brand" on both themes without checking both contrasts.
- Danger as text on a dark surface should be a light tint (`#F0A89A`), not the dark-mode fill. If you need a filled danger button, use a deeper red and light text, and define it as its own token.

## Elevation

| Layer | Light | Dark |
| --- | --- | --- |
| Page | `--bg` | `--bg` |
| Panel, input | `--surface`, border `--line` | `--surface`, border `--line` |
| Menu, dialog | `--surface`, `--shadow-pop`, border `--line` | `--surface-2` or a lightened `--surface`, border `--line-strong`, a softer and wider shadow |

```css
:root { --shadow-pop: 0 12px 32px rgb(28 22 18 / 12%); }
:root[data-theme="dark"] { --shadow-pop: 0 16px 40px rgb(0 0 0 / 45%); }
```

Borders carry the edge in dark mode. If you remove them because the shadow "should be enough", panels melt into the page.

## What else changes

- **Images.** A screenshot with a white browser frame glares on a dark page. Give it a `--line` border and a radius, or dim the frame. Do not put a white card behind every image by reflex. Photographs can sit on `--bg`.
- **Charts.** Recolor series against `--bg`. Gridlines use `--line`. A chart exported as a light-mode PNG will look pasted on. Theme the chart or provide a dark asset.
- **Syntax and code.** A code theme is a separate palette. Pick one that matches the temperature (a warm ink, not a default purple VS Code theme dropped into a warm product) and check comments against the code background.
- **Native controls.** Set `color-scheme: light` or `color-scheme: dark` on `:root` so scrollbars, form controls, and date pickers match. Style the ones you can. Do not leave a white date picker in a dark page if the platform can match it.
- **Selection and caret.** `::selection` uses a mix that is visible in both themes. The caret inherits `color` if you set it on inputs.

## The toggle

- Provide a control that sets light, dark, or system. Persist the choice in `localStorage` under a name scoped to the product.
- Apply the theme before first paint if you can, with a tiny inline script in the document head, so the page does not flash the wrong background. Do not wait for a framework to hydrate.
- The control is a button or a small radio group with a visible label ("Theme") and the current value. An icon-only moon is acceptable in a dense shell if it has an accessible name that includes the next state ("Switch to light theme").
- Respect `prefers-color-scheme` when the saved choice is system or absent.
- Do not animate the whole page's colors over 400ms. A short fade on `--bg` is already a lot. Instant is fine.

```html
<script>
(function () {
  try {
    var saved = localStorage.getItem("theme");
    var theme = saved || (matchMedia("(prefers-color-scheme: dark)").matches ? "dark" : "light");
    document.documentElement.dataset.theme = theme;
    document.documentElement.style.colorScheme = theme;
  } catch (e) {}
})();
</script>
```

```css
:root { color-scheme: light; /* light tokens here */ }
:root[data-theme="dark"] { color-scheme: dark; /* dark tokens here */ }
```

Keep the inline script in the head, not in a module. When the user changes the toggle, set `dataset.theme`, `style.colorScheme`, and `localStorage` together.

## Dos and don'ts

**Do**

- Test both themes on the same screen, side by side if you can, before shipping.
- Check muted text, placeholder rejection, input borders, and the accent label in both themes. Those are the pairs that fail.
- Use the same spacing, type, and radius in both themes. Theme is color and elevation, not a second layout.
- Leave a seam of the page background around dialogs so the layer is obvious.

**Don't**

- Don't invert. Don't use `filter: invert(1) hue-rotate(180deg)` on the app.
- Don't use pure black for large surfaces or pure white for body text in dark mode. Slightly soften `--text` (`#F3EEE7`, not `#FFFFFF`) so long reading does not glare. Display type may be brighter.
- Don't add a colored glow behind cards in dark mode to "make it premium".
- Don't switch theme based on the time of day. Use the system preference and an explicit choice.
- Don't store the theme only in React state. A reload should not forget it, and the pre-paint script should not depend on the bundle.

## Before / after

**Before.** Dark mode is `#000` with `#EEE` text, the light-mode indigo button unchanged, `gray-400` labels at about 3:1, white cards with heavy black shadows, and a flash of the light theme on refresh. The toggle is a moon icon with no accessible name, and the choice resets on reload.

**After.** The warm pair from the table. Panels are `#1E1A17` with a `#3A332C` border and no glow. Muted text is `#B7ADA3`, checked against both `--bg` and `--surface`. The primary button is light ink on the dark page. `color-scheme: dark` is set. An inline head script reads `localStorage` and the system preference before paint. The control reads "Theme: Dark" and offers Light, Dark, and System.

## While coding

1. Define light tokens on `:root` and overrides on `:root[data-theme="dark"]`. Do not sprinkle `.dark .card` overrides through components. If a component needs a value, it needs a token.
2. Replace raw colors in feature code with tokens. Search for `#`, `rgb(`, `gray-`, `slate-`, `zinc-`, `neutral-` in UI files.
3. Set `color-scheme` with the theme so native UI matches.
4. Check contrast in both themes with the same pairs: text/bg, muted/bg, muted/surface, accent-contrast/accent, line-strong/surface, danger text/surface.
5. If you use Tailwind, drive colors from CSS variables so one class works in both themes (`bg-[var(--bg)]` or a theme color that points at the variable). Do not maintain two full class strings (`bg-stone-100 dark:bg-stone-900`) on every element. Those drift.
6. Verify the no-flash path with a hard reload and with the system theme opposite to the last saved choice.

## Finishing check

- [ ] Feature code uses semantic tokens, not raw palette steps.
- [ ] Dark surfaces step lighter as they rise, with borders doing real work.
- [ ] Muted text and accent labels pass contrast in both themes.
- [ ] `color-scheme` matches the active theme.
- [ ] The theme applies before paint and persists.
- [ ] The toggle has a visible or accessible name and offers system, light, and dark.
