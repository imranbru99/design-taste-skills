---
name: color
description: >-
  Chooses restrained palettes, tinted neutrals, a single accent, and accessible
  contrast. Use when picking colors, fixing gray-on-white UI, reviewing a
  palette, or when the user mentions color, contrast, brand color, gradients,
  or dark backgrounds. Use with design-taste; use theming to implement a
  paired dark theme and tokens.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Color and contrast

Color is a material and a signal. Neutrals do almost all of the work. One accent marks the action. Status colors speak only when the state is the message. A palette with five saturated hues is a palette that has not decided.

Follow `design-taste` for accent budget and the swap test. Use `theming` when you implement tokens, dark mode, or a toggle. This skill decides the colors themselves.

## When to use

- You are choosing a background, text color, border, accent, or status color.
- Contrast is weak, or every element is a different bright color.
- You are about to add a gradient, a glow, or a colored card.

## Build a neutral ramp first

Pick a temperature and mix every neutral from it. Pure `#fff`, `#000`, and `#808080` look unfinished next to a tinted ramp because they do not belong to the same material.

**Warm paper** (hospitality, print, craft, food, places):

| Token | Hex | Role |
| --- | --- | --- |
| `--bg` | `#F7F4EF` | Page |
| `--surface` | `#FFFCF8` | Raised sheets, inputs |
| `--text` | `#1C1612` | Primary text, and often the accent |
| `--muted` | `#5E564E` | Secondary text. Not `#9CA3AF`. |
| `--line` | `#E4DCD2` | Decorative hairlines only |
| `--line-strong` | `#8A7B6E` | Input borders, focus rings. Clears 3:1 on `--bg` and `--surface`. |

**Cool ink** (software tools, data, infrastructure):

| Token | Hex | Role |
| --- | --- | --- |
| `--bg` | `#F4F6F8` | Page |
| `--surface` | `#FBFCFD` | Sheets |
| `--text` | `#12161C` | Primary text |
| `--muted` | `#566170` | Secondary text |
| `--line` | `#E1E5EA` | Decorative hairlines only |
| `--line-strong` | `#7E8B99` | Input borders. Clears 3:1 on `--bg` and `--surface`. |

These are starting points. Shift the hue toward the brand if there is one. Keep the chroma of neutrals low (a tint, not a pastel). Steps between bg, surface, and line must be visible: if you squint and the card disappears, the steps are too close.

**Monochrome accent.** The strongest taste move is often no chromatic accent at all. Ink on paper, with the primary button filled in `--text` and labeled in `--bg`. Do this for editorial, luxury, architecture, and any product whose specimens are already colorful (tiles, clothes, food, photography). Adding a bright blue steals from the specimen.

## The accent

If you need a chromatic accent, pick one hue and two values:

- `--accent`: the fill for primary actions on `--bg`. Must hold its label at 4.5:1.
- `--accent-hover`: one step darker (light theme) for hover and active.

That is the whole accent palette. Links may use `--accent` with an underline. Icons do not each get their own color.

| Accent used for | Allowed |
| --- | --- |
| Primary button fill | Yes |
| Text link, with underline | Yes |
| Focus ring, if it stays visible on every surface | Yes |
| A single active nav item | Yes, one of the above, not all of them |
| Section background | No |
| Heading text gradient | No |
| A colored circle behind every feature icon | No |
| Borders on every card | No |

Bright accents (vivid blue, lime, orange) often fail as button fills with white text. Darken the fill until the label clears 4.5:1, or use dark text on a lighter fill. Do not keep the bright color and drop the contrast.

## Status color

Success, warning, and danger are messages, not decoration.

- Use them on the status word, a dot, or a banner. Do not recolor an entire card green because one field succeeded.
- Pair the hue with an icon or a word. Color is never the only signal.
- Build each status as a dark ink for text and a pale tint for a banner background, from the same hue. Text of `#16A34A` on white often fails contrast. Use a deeper ink (`#166534` or darker) for the word, and the bright hue only for a dot or an icon if the shape is readable.
- Error text sits next to the field it describes, in the danger ink, at body size. A red border alone is not an error message.

## Contrast

Check against the actual background, including muted text on surface cards and accent labels on accent fills.

| Pair | Minimum |
| --- | --- |
| Body text, labels that convey meaning | 4.5:1 |
| Display text at 24px+ regular or 19px+ bold | 3:1 |
| Input borders, icons that convey state, focus rings | 3:1 |
| Disabled controls | May be lower, and must not be the only state cue. Keep them out of the tab order if they do nothing. |
| Placeholder text | Do not use placeholder as the label. If placeholder remains, it still needs 4.5:1 or it should not carry information. |

Decorative hairlines may sit under 3:1. An input border may not. Never convey state by color alone: add a word, icon, or change in weight.

## Gradients, photos, and patterns

A gradient is justified when it depicts a real light condition in a photograph's overlay, or a continuous data scale (a heatmap). It is not justified as a page background, a button fill, a headline, or a card.

- One flat brand color as a full-bleed field can be beautiful when it is the brand and the type on it clears contrast. A two-stop glow from indigo to pink is not a brand. It is the default.
- Photographs carry their own palette. Sample neutrals from the photo's shadows rather than fighting it with a blue UI.
- Patterns (grids, dots, noise) stay near-invisible: under 8% contrast against the background. If you notice the pattern before the content, it is too loud.

## Dos and don'ts

**Do**

- Write the hex values down and count them. A typical product needs the ramp, one accent pair, and three status inks. If you have more, delete some.
- Test the palette in grayscale. Hierarchy should survive.
- Put the busiest color in the smallest area.
- Recolor chart series from the same hue family plus the accent, not from a rainbow. See `dashboard`.

**Don't**

- Don't use `#9CA3AF` (`gray-400`) for text. It is about 2.5:1 on white. `#6B7280` (`gray-500`) clears 4.5:1 on pure white and fails on tinted paper (about 4.4:1 on `#F7F4EF`). Check the real pair. `#5E564E` is a safe warm muted ink.
- Don't put saturated color on both the background and the foreground.
- Don't introduce a second accent for "visual interest".
- Don't color-code categories that a label already distinguishes, unless the user must scan dozens of rows. Even then, cap the colors and put the word first.
- Don't use pure red `#FF0000` or pure green `#00FF00` for status.

## Before / after

**Before.** White page, `gray-500` subtitles, indigo buttons, a violet "Pro" badge, a green "New" badge, pastel circles behind six icons (blue, purple, pink, orange, teal, amber), and a gradient headline.

**After.** Warm paper ramp. Text is `#1C1612`. Secondary text is `#5E564E` (passes on `#F7F4EF`). One accent: the same ink, used as the button fill. "Pro" is a word in the label role with a hairline border, not a violet pill. Status appears only next to a failed invoice, in danger ink, with the word "Failed". The headline is the text color. The grayscale test still shows the button as the loudest small thing.

## While coding

1. Put colors in custom properties or the theme. Components reference tokens, never raw hex, after the theme file.
2. Define semantic tokens (`--text`, `--muted`, `--line`, `--accent`) rather than numbered grays (`--gray-700`) that invite one-off picks. A numbered scale is fine *behind* the semantic tokens.
3. Check contrast with the browser's color picker contrast overlay or a known formula. Do not guess because a pair "looks fine" on a calibrated monitor you do not have.
4. For Tailwind, extend `colors` with the semantic names and use `bg-bg text-text border-line`. Avoid `bg-indigo-500`, `text-gray-400`, and `from-purple-500` in feature code.
5. If a brand guideline conflicts with contrast, keep the brand hue and adjust lightness until it passes. Record the adjustment.

## Finishing check

- [ ] Neutrals share one temperature. You can name it.
- [ ] Accent count is zero or one, used in one role.
- [ ] Body and muted text both clear 4.5:1 on the surfaces they sit on.
- [ ] Status colors appear with a word or icon, only where state is the message.
- [ ] The page still has a clear hierarchy in grayscale.
- [ ] No gradient fills on type, buttons, or page backgrounds unless the brief is explicitly that material.
