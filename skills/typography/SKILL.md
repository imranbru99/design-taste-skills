---
name: typography
description: >-
  Sets type hierarchy, font choice, measure, leading, and weight so interfaces
  read with intent. Use when choosing fonts, writing headings, setting body
  copy, pairing typefaces, styling labels or numerals, or fixing type that
  feels flat, oversized, or generic. Use with design-taste for any UI that
  contains real text.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Typography

Type does the hierarchy work that color and shadow are usually asked to fake. Choose faces for the subject, then stop. Most screens need four roles and one or two families.

Follow `design-taste` for the 3-second sentence and the one-loud-thing rule. This skill only decides how the words look.

## When to use

- You are choosing or loading fonts.
- Headlines, body, labels, captions, tables, or numbers need a scale.
- Type looks generic, uniformly medium, too light, or like a poster pasted on a form.

## Choose a face for the job

Pick from the subject, not from a trending pairing.

| Subject | A sound approach | Avoid |
| --- | --- | --- |
| A tool used all day | One well-hinted grotesque or the platform UI font. Hierarchy comes from size, weight, and space. | Display serifs, tight tracking, huge heroes inside the app |
| Editorial, culture, place, food, print | A text serif or a distinctive display face for headlines only. A plain grotesque for UI chrome. | The same serif for buttons, inputs, and tables |
| Code, data, terminals | A mono for code and aligned numerals only. Prose stays in a text face. | Mono as the brand voice of a non-code product |
| An existing brand | The brand face, subset and loaded once. Invent nothing. | A second "more interesting" display face on top |

**Defaults that are not a design:** Inter, Roboto, Arial, and system-ui used with no other decision. You may still use them for a tool if size, weight, and measure are deliberate. "We used Inter" is not a typographic choice.

**A method demo, not a house style:** Newsreader for display and Source Sans 3 for UI. If you reach for this pair on a logistics dashboard, you are templating. Name the reason for the face in one clause before loading it.

Load the weights you use. Two weights (400 and 600) cover most products. A third (500) is justified for UI chrome that should not look heavy. Do not load a variable font and then use seven weights.

## Roles

Use these roles. Do not add a size because a section feels important. Make it important with the role you already have, plus space.

| Role | Use | Size | Line-height | Weight | Notes |
| --- | --- | --- | --- | --- | --- |
| Display | One headline per view, marketing or empty-state drama | `clamp(2.5rem, 6vw, 4.5rem)` | 1.0–1.08 | 500–600 | Tighten tracking a hair (`-0.02em`) only above ~40px. No bold-black. |
| Title | Section and dialog titles | 1.5–2rem | 1.15–1.25 | 550–650 | One step down from display. Not a second hero. |
| Body | Paragraphs, list items, input text | 1–1.125rem (16–18px) | 1.5–1.65 | 400 | Never below 16px for prose. |
| Label | Meta, eyebrows, table headers, buttons | 0.75–0.875rem | 1.3 | 600 | Positive tracking (`0.04–0.08em`) only if the label is uppercase. |
| Data | Figures in tables and tools | 0.875–1rem | 1.3 | 450–550 | `font-variant-numeric: tabular-nums;` |

If the stack cannot express 550, use 500 or 600. Do not invent a fifth marketing size called "subtitle" that is 1.125rem medium gray. That is body text with weak contrast. Say it in body, or don't say it.

## Measure, case, and alignment

- Prose measure: 60–75 characters. Set `max-width: 65ch` on paragraphs, not on the page.
- Headlines may run wider than prose. They still need a limit, or a long sentence becomes a stripe.
- Left-align paragraphs, forms, tables, and navigation. Center only a short statement of one or two lines.
- Do not justify text on the web. The rivers are worse than a ragged edge.
- Uppercase is for short labels, never for sentences. If you uppercase, add tracking and keep the line short.
- Use real punctuation: curly quotes if the stack supports them, apostrophes, and an en dash for ranges (Mon–Fri, 12–18 wk). Ellipses are one character, not three periods with spaces.
- Truncate with intent. A table cell may truncate; a person's name in a billing screen should not.

## Hierarchy without more sizes

When everything is a heading, nothing is. Before adding a size:

1. Put the important sentence first.
2. Give it the display or title role. Everything under it is body or label.
3. Increase space *above* a heading more than below it, so the heading belongs to what follows.
4. Use weight on UI labels, not on paragraphs. Bold prose is shouting.
5. Mute supporting text with the muted ink token, and check 4.5:1. If it fails, the text is not secondary. It is invisible. Cut the copy or lighten the surface.

## Dos and don'ts

**Do**

- Set `line-height` per role. A single `line-height: 1.5` on `body` makes display type look double-spaced.
- Use `text-wrap: balance` on headlines of two or three lines, and `text-wrap: pretty` on paragraphs where support exists.
- Keep button labels in the label or body role. A button does not get display type.
- Match the figure style to the job: tabular nums in columns, oldstyle nums only in running prose when the face supports them well.
- Subset languages you do not need. A display face that lacks the user's script is a broken face. Fall back to a system face that covers it rather than showing tofu.

**Don't**

- Don't pair two display faces, two monos, or two geometrics.
- Don't letterspace body copy. Tracking is for short uppercase labels and for optical correction of very large type.
- Don't set long text in a light weight (300) on a bright ground. It looks elegant in a screenshot and fails in a window.
- Don't use gradient text, outline text, or text-shadow to make a headline "pop".
- Don't scale type by viewport alone (`10vw` headlines). Use `clamp` with a real minimum and maximum, and check a 320px width.
- Don't communicate rank with color alone. A muted red heading and a muted green heading are still two headings.

## Before / after

**Before.** A settings page where every block title is `text-2xl font-bold`, the helper text is `text-sm text-gray-400`, and the form labels are placeholders inside the fields. The page has six equal "headlines" and no body reading order.

**After.** One title role for "Billing". Section labels ("Payment method", "Invoices") are the label role, uppercase, tracked, in muted ink that still clears 4.5:1. Field labels sit above inputs in body weight 600. Helper text is body size at the muted color, reserved for one sentence under the field that needs it. Invoice amounts use the data role with tabular nums, right-aligned. Nothing on the page is larger than the title.

## While coding

1. Declare the roles as tokens or utility classes once. Components consume roles. They do not set raw `font-size`.
2. Put `font-family` on `body` for UI text. Scope the display face to the elements that use the display and title roles.
3. Set this base, then only override roles:

```css
body {
  font-family: var(--font-ui);
  font-size: 1.0625rem;
  line-height: 1.5;
  color: var(--text);
  font-optical-sizing: auto;
}

.display {
  font-family: var(--font-display);
  font-size: clamp(2.5rem, 6vw, 4.5rem);
  font-weight: 500;
  line-height: 1.02;
  letter-spacing: -0.02em;
  text-wrap: balance;
}

.label {
  font-size: 0.75rem;
  font-weight: 600;
  line-height: 1.3;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  color: var(--muted);
}
```

4. Check a paragraph at the real width. If a line breaks after one word, shorten the measure or rewrite the sentence. Do not shrink the font to fix a wrap.
5. Check 200% zoom. Roles should still stack in the same order, and no text should overlap.

## Finishing check

- [ ] One display face or none. One text face. Mono only where the characters are the content.
- [ ] Four roles, used consistently. No orphan sizes.
- [ ] Body is at least 16px with line-height at least 1.5 and a measure near 65ch.
- [ ] Headings sit closer to the content they introduce than to the block above.
- [ ] Muted text meets contrast against the surface it sits on.
- [ ] Columns of numbers use tabular figures and a consistent alignment.
