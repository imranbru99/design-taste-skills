---
name: design-taste
description: >-
  Applies a decision framework for hierarchy, restraint, and product-specific
  interface design so generated UI does not look like generic AI output. Use
  when building, redesigning, or styling any page, screen, component, or visual
  language; when the user mentions design, UI, UX, taste, polish, aesthetics,
  layout, or "make it look good"; and before shipping frontend work.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Design taste

Taste is the set of choices that make a specific product obvious. It is not a font, a gradient, or a component kit. You are designing a surface a particular person will use for a particular job. Every visual decision either serves that job or dilutes it.

This skill is the flagship. Load a specialist (`typography`, `spacing`, `color`, `motion`, `components`, `landing-page`, `dashboard`, `theming`) only when that dimension is the work. Finish with `anti-slop` or `critique` when the result still feels generic.

The example palette and type pairing below are a method demo. Reusing them on an unrelated product is a new kind of template. Choose for the subject in front of you.

## When to use

- The task creates or changes anything a person sees: pages, components, emails, slides, empty states, charts, icons used as UI.
- The user asks for polish, taste, a redesign, or says the current UI looks generic, cheap, or "AI".
- You are about to pick colors, fonts, spacing, or layout from habit.

Skip it for backend logic, schemas, and scripts that do not change a visual surface.

## Before you write UI

Write this sentence, privately or in a one-line comment to the user, before styling:

> A [specific person] uses this to [concrete job] and should notice [one thing] first.

If the brief is too generic to write the sentence, ask at most three questions, then proceed:

1. Who is the primary user, and what are they trying to finish?
2. What should they see or do first?
3. Is there an existing visual language to extend?

When the user already answered, do not ask. State the assumption in one sentence and design.

Then decide, in order:

1. **Rank attention.** List the first, second, and third things the eye should hit. Give the first thing size, contrast, or position. Make the other two quieter.
2. **Subtract.** Remove any element that does not serve the sentence. Labels, icons, backgrounds, gradients, illustrations, and sections are all candidates.
3. **Commit to a material.** Pick one temperature (warm paper, cool ink, stark white, deep olive) and stay inside it. A second temperature is a second product.
4. **Set the quiet system.** Four type roles, one spacing scale, one radius, one accent. Write them down as tokens before composing screens.
5. **Refuse the reflex.** Run the slop list below. If your plan matches it, change the plan, not the adjectives.

## Rules

1. **One loud thing per view.** One element may be large, high-contrast, or saturated. If two things shout, neither is the point.
2. **Group by relationship, not by card.** Related items sit closer together than unrelated items. A border is not a group. Space is a group.
3. **Type sizes are roles.** Display, title, body, label. A dashboard may add a data role. Do not invent a new size for each section.
4. **Accent budget.** The accent color appears on the primary action and at most one other role (a single link treatment or a single status). It is not a section background, a heading gradient, an icon circle, and a button all at once.
5. **Numbers need a denominator.** "12,409" is decoration. "12,409 open · 86 past due · since Monday" is information.
6. **Alignment before ornament.** If a screen looks unfinished, fix the grid, the type ramp, and the spacing before adding a gradient, illustration, shadow, or background pattern.
7. **Density matches the visit.** Marketing pages get air and few decisions. Daily-use tools get a tight rhythm and more information per glance. Never give an app the padding of a hero.
8. **Images are specific or absent.** A stock photo of hands on a laptop makes the product more generic. Use the product, the object, the place, a diagram, or nothing.
9. **Copy is a material.** Replace "Unlock", "Elevate", "Seamless", "Next-gen", and "Powerful" with a concrete noun and verb from the domain.
10. **States are part of the design.** Empty, sparse, loading, error, and `:focus-visible` ship with the happy path. A screen that only shows full data is unfinished.
11. **The swap test.** If you replaced the product name with a competitor and nothing would look wrong, the design has no subject. Change structure, imagery, or copy until the swap fails.
12. **Do not install a new template.** If the last interface you built used this exact hero, card row, and palette, this one must not.

## Dos and don'ts

**Do**

- Extend the project's existing components and tokens before adding new ones.
- Put the primary action where the eye already is. Repeat it only if the page is long.
- Use a 1px border in a mixed neutral for grouping. Save shadows for things that actually float: menus, dialogs, dragged items.
- Pick one radius for controls (often 4–8px). Full pills are for compact tags and segmented toggles, not every button.
- Let body text sit at 16–18px, with a measure around 60–75 characters. Display type can be tight; body type cannot.
- Design the empty state as a sentence that tells the user what to do next.
- Check a narrow viewport. Stack by priority, not by squeezing the desktop row.

**Don't**

- Don't center everything. Center a short headline only when the subject is a single statement. Left-align prose, forms, and tools.
- Don't wrap every idea in a card. Cards are for repeated objects the user chooses between, or for items that truly float.
- Don't use a gradient as a substitute for a point of view. A flat field of a real color beats a purple wash.
- Don't use more than one display face and one text face. A third face is almost always noise.
- Don't animate every block on scroll. Motion explains a change of state or a spatial relationship. See the `motion` skill.
- Don't ship gray text on a tinted gray card on a gray background. Build a ramp with real steps. See `color`.
- Don't add icons that repeat the word next to them. Icons earn their place when they aid scanning or stand for a known action.

## Slop reflexes

These are the habitual outputs to reject on sight. The `anti-slop` skill has the full fix for each.

| Reflex | What to do instead |
| --- | --- |
| Indigo-to-fuchsia gradient, centered white type | Tinted neutral field, one real accent, aligned type |
| Three identical feature cards with icon circles | One structure that fits the content: a list, a split, a specimen, an index |
| Inter / Roboto / Arial as the entire design | A face chosen for the subject, or a neutral face with hierarchy from size, weight, and space |
| Glassmorphism, mesh blobs, gradient text | Flat materials, a photograph, or type |
| "Welcome to {App}" and "Get Started" | Domain language and a verb that names the outcome |
| Four gradient stat cards | A number with a comparison, a window, and the list that explains it |
| Shadow plus border plus radius on everything | One depth cue, used consistently |
| Emoji as UI icons | A small set of drawn icons, or no icons |

## Before / after

**Brief:** "Build a landing page for a small studio that fires custom tile for architects."

**Generic plan (reject):** centered hero, purple gradient, headline "Elevate Your Interiors", subhead "Seamless. Beautiful. Timeless.", two pills ("Get Started", "Learn More"), three cards (Fast, Sustainable, Premium) with pastel icon circles, logo cloud, testimonial carousel.

**Taste plan (build):**

- Sentence: *An architect specifying a lobby uses this to judge whether Maren's tile belongs in the room, and should notice the glaze and the lead time first.*
- Structure: split. Left column is the words. Right column is a specimen of four glazes, not an illustration of a smiling customer.
- Headline: "Tile fired in small batches for rooms that should still look right in twenty years."
- One action: "Request a firing." Secondary text link: "See current work."
- Material: warm paper `#F7F4EF`, ink `#1C1612`, oxide red used only on the action. Serif for the headline, a plain grotesque for everything else.
- Proof: "18-week lead time · 4 standard glazes · Portland kiln", not five anonymous stars.

The swap test: this page cannot be reskinned as a CRM without the words and the specimen becoming nonsense. That is the point.

## While coding

1. Look for an existing token source (CSS variables, Tailwind theme, design-system package). Extend it. Do not invent a parallel palette in a component file.
2. If none exist, define a small set once, then use only those names. Example of the *shape* of a system, not a palette to copy:

```css
:root {
  --bg: #f7f4ef;
  --surface: #fffcf8;
  --text: #1c1612;
  --muted: #6b625a;
  --line: #e6dfd6;
  --accent: #1c1612;
  --accent-contrast: #f7f4ef;
  --danger: #9c2b1a;

  --space-1: 4px;
  --space-2: 8px;
  --space-3: 12px;
  --space-4: 16px;
  --space-6: 24px;
  --space-8: 32px;
  --space-12: 48px;
  --space-16: 64px;
  --space-24: 96px;

  --font-display: "Newsreader", "Iowan Old Style", Georgia, serif;
  --font-ui: "Source Sans 3", "Segoe UI", sans-serif;
  --text-display: 500 4.25rem/1.02 var(--font-display);
  --text-title: 600 1.75rem/1.15 var(--font-display);
  --text-body: 400 1.0625rem/1.55 var(--font-ui);
  --text-label: 600 0.75rem/1.3 var(--font-ui);
  --tracking-label: 0.06em;

  --radius-control: 6px;
  --shadow-pop: 0 12px 32px rgb(28 22 18 / 12%);
}
```

The display size is for a marketing headline, not an app screen. Scale it down when the viewport is narrow. Map the same roles into Tailwind `theme.extend` or the project's token file if one already exists.

3. Build the quiet parts first: background, type roles, spacing, the primary control. Add emphasis last.
4. Use the stack the project already uses. Do not add a UI library, icon pack, or animation framework to satisfy this skill.
5. Implement empty, error, and focus states before you consider the screen done.
6. At the end, run the swap test and the one-loud-thing rule. Remove one element. If the screen gets better, keep going.

## Finishing check

- [ ] The 3-second sentence is true of the built screen.
- [ ] A person can name the first, second, and third things they see, in that order.
- [ ] Accent color appears in one role, maybe two.
- [ ] Spacing comes from the scale. Section gaps are larger than group gaps, which are larger than item gaps.
- [ ] Body text contrast is at least 4.5:1 against its background.
- [ ] Interactive elements have a visible `:focus-visible` state and a hit area of at least 40px.
- [ ] Nothing says "Welcome to", "Unlock", "Elevate", or "Seamless" unless the user wrote it on purpose.
- [ ] The screen does not match the slop table.

## Related skills

| Skill | Load it when |
| --- | --- |
| `typography` | Choosing faces, setting a scale, fixing flat or oversized type |
| `spacing` | Layout, rhythm, density, or a cramped or boxy screen |
| `color` | Palette, contrast, accents, gradients |
| `motion` | Any animation, transition, or scroll effect |
| `components` | Buttons, forms, menus, dialogs, empty states |
| `landing-page` | Homepages, marketing pages, launch pages |
| `dashboard` | Apps, admin tools, data-heavy screens |
| `theming` | Dark mode, tokens, theme toggle |
| `anti-slop` | A final pass, or the result still looks generic |
| `critique` | The user wants a review, or you are improving an existing design |
