---
name: spacing
description: >-
  Builds layout with a spacing scale, proximity, alignment, and section rhythm
  instead of even padding and card grids. Use when composing pages, setting
  gaps, choosing max-widths, fixing density, or when a layout feels cramped,
  loose, uniformly boxed, or "off". Use with design-taste for any visual layout.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Spacing and layout

Space is the hierarchy tool you should reach for first. If two elements are related, move them closer. If they are not, move them apart. Borders, cards, and background tints are what you add after space has done its job and something is still ambiguous.

Follow `design-taste` for what the screen is trying to say. This skill decides how the parts sit.

## When to use

- You are placing more than one element.
- The screen feels cramped, floaty, evenly gray, or like a wall of cards.
- You are choosing a page width, a grid, or a responsive reflow.

## The scale

Use a 4px base. Every gap, padding, and stack distance is a step on this scale. Eyeball is how spacing drifts into noise.

| Token | px | Use |
| --- | --- | --- |
| 1 | 4 | Icon-to-label, tight stacks inside a control |
| 2 | 8 | Related pairs (label above an input, meta under a title) |
| 3 | 12 | Default gap inside a compact component |
| 4 | 16 | Component padding, form field stacks in tools |
| 6 | 24 | Group padding, paragraph separation |
| 8 | 32 | Between groups inside a section |
| 12 | 48 | Between related sections |
| 16 | 64 | Between unrelated sections on a marketing page |
| 24 | 96 | Major chapter breaks, hero breathing room |

Rules for the scale:

- Intra-component padding is smaller than the gap between components.
- The gap between components is smaller than the gap between groups.
- The gap between groups is smaller than the gap between sections.
- If you need 13px or 22px, you do not. Pick the nearest step. Exception: optical alignment of an icon inside a button, by 1px, is allowed and should be commented.

Do not mix a 4px scale with Tailwind's default scale *and* arbitrary values in the same feature. Pick the project's scale and stay on it.

## Proximity

Group by meaning.

```
Billing                      ← title

PAYMENT METHOD               ← label, 32px below the title
Visa ···4242                 ← 8px below its label
Expires 09 / 27

INVOICES                     ← next group, 32px below the previous group
Mar 1    Paid      $480
```

That structure needs no cards. A border under the title or a single hairline between groups is enough if the sections are long.

**The card reflex.** A card is justified when the user compares or selects repeated objects (a plan, a file, a glaze), or when the surface truly floats above the page (a dialog, a popover). A card is not justified as a way to "organize" a unique section. Three unique ideas do not become clearer by sitting in three identical boxes.

## Alignment and width

- Pick one vertical axis and stick to it. Most pages: a left edge. Center only a short statement.
- Indent nested content off that axis deliberately (a disclosure, a quoted specimen), not accidentally.
- Marketing content width: 1120–1200px for the page, 65ch for prose inside it.
- App content width: fluid inside a shell, with a max around 1440px so lines in tables do not become journeys. Form columns inside the app stay near 480–640px.
- Do not stretch a text column to the full width of a monitor. Do not shrink a data table to a blog measure.
- Baseline grids are optional. Consistent vertical steps from the scale are not.

A 12-column grid is a tool for a section that has competing regions (a split hero, a dashboard with a side panel). It is not a religion. A single column with a strong left edge is the right layout for most reading screens.

## Density

| Visit | Padding inside controls | Section gap | How it should feel |
| --- | --- | --- | --- |
| Marketing, first look | 12–16px | 64–96px | A few decisions, room to read |
| Documentation | 8–12px | 32–48px | Continuous reading, clear headings |
| Daily tool | 6–10px vertical control padding | 16–24px | Many facts, still aligned, never double-spaced |

If a dashboard uses 64px gaps and 24px card padding, the user is scrolling past air to do their job. Tighten it. If a landing page uses 8px between sections, the user cannot tell where one idea ends.

## Page regions

- **Hero / first screen.** One cluster for the words, one for the evidence. The gap between them is a group gap (24–48px on small screens, a column gutter on large), not a section gap. The first screen does not need to fill the viewport with empty gradient.
- **Stacks.** Use a vertical stack with a single gap token. Change the token when the relationship changes, not the margin on individual children.
- **Clusters in a row.** Wrap. Do not let a row of buttons or chips overflow. Gap 8px for chips, 12–16px for buttons.
- **Sticky chrome.** A top bar is short (56–64px), uses the surface color, and separates from content with a hairline, not a heavy shadow. Content does not hide under it.

## Dos and don'ts

**Do**

- Define section spacing as padding-top on the section, so the last section does not invent a special case.
- Let the first item in a section align with the first item in the next section. Ragged left edges read as unfinished.
- Use `gap` on flex and grid parents instead of margins on children. Margins double up and fight.
- Give touch targets 40px minimum, with 8px between them, even when the visible control is shorter. Expand the hit area with padding.
- At a breakpoint, stack regions in attention order: the thing they should notice first comes first. Do not preserve a decorative side column above the point.

**Don't**

- Don't put a 1px border, a shadow, a radius, and 24px of padding on a region that space already separated.
- Don't nest cards. If a card contains cards, the grouping logic is wrong.
- Don't center a multi-line form. Labels, inputs, and help text share one left edge.
- Don't use `margin: auto` hero layouts as a default. A left-aligned cluster with a specimen beside it is calmer and more specific.
- Don't fill a row with equal columns when the content is unequal. A 7/5 or 8/4 split matches "words plus thing" better than 6/6 of identical weight.
- Don't add a spacer div. Change the parent's gap.

## Before / after

**Before.** A "features" section: three cards in a row, each `p-6 rounded-2xl shadow-lg`, with an icon, a bold title, and two lines. The gap between cards equals the padding inside them. On a laptop the row looks like a single gray brick. On a phone the three cards become three screens of the same shape.

**After.** The section has a title and a one-sentence claim, then a list of three rows. Each row is a name, a one-line consequence, and nothing else. Rows are separated by 16px and a hairline. The section padding above is 64px. No shadows. If one feature is the product, it becomes the section and the other two move to a short list under it. The layout says which idea matters.

## While coding

1. Put the scale in tokens before layout. In Tailwind, prefer `p-4`, `gap-6`, `mt-8` mapped to that scale, or set `spacing` in the theme to the steps above.
2. Structure a page as sections of stacks:

```css
.section { padding-block: var(--space-16); }
.stack-lg { display: flex; flex-direction: column; gap: var(--space-8); }
.stack { display: flex; flex-direction: column; gap: var(--space-4); }
.cluster { display: flex; flex-wrap: wrap; gap: var(--space-2); align-items: center; }
.page { width: min(100% - var(--space-8), 72rem); margin-inline: auto; }
.prose { max-width: 65ch; }
```

3. Responsive rule: change the stack gap and the section padding at breakpoints, not every child's margin. A section that is 96px on a desktop is 48px on a phone.
4. Debug spacing visually: temporarily set `outline: 1px solid` on sections and groups. Misaligned edges and doubled gaps show up immediately. Remove the outlines before shipping.
5. When a layout feels wrong, move space before you add a box.

## Finishing check

- [ ] Every gap is a token on the scale.
- [ ] Related items are closer than unrelated items, and you can point to the gap that proves it.
- [ ] One left edge runs through the page, with intentional exceptions only.
- [ ] Prose has a measure. The page has a max width. Data layouts may be wider than prose.
- [ ] Cards, if any, are repeated objects or floating surfaces, and they are not nested.
- [ ] At 375px the order is the attention order, with no horizontal scroll.
