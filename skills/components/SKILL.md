---
name: components
description: >-
  Designs buttons, inputs, navigation, lists, dialogs, and empty states as
  quiet, complete components with real interaction states. Use when creating
  or refactoring UI components, forms, menus, tables, design-system primitives,
  or when a control looks decorative, inconsistent, or unfinished. Use with
  design-taste, spacing, typography, and color.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Component design

A component has one job, a small set of variants, and every state a person can put it in. Taste at the component level is consistency and completeness, not novelty. A beautiful button that loses focus, traps a dialog, or collapses at 320px is unfinished.

Follow `design-taste` for hierarchy. Use `spacing`, `typography`, and `color` for the tokens. This skill decides how controls behave and which variants exist.

## When to use

- You are building or restyling a button, link, input, select, checkbox, menu, tab, dialog, toast, table, card, or empty state.
- A screen is a pile of one-off controls that do not look related.
- You are about to add a new variant ("ghost", "soft", "premium", "gradient").

## Inventory before you invent

Before adding a component, look at what the project already has. Extend it. A second button style that differs by 2px of radius is a bug.

Most products need this set and nothing more:

| Component | Variants | Notes |
| --- | --- | --- |
| Button | primary, secondary, ghost, danger | One primary per region. Danger is for destructive actions, not for "important". |
| Icon button | same emphasis scale | Always an accessible name. 40px hit area. |
| Text link | default, quiet | Underline in prose. Color alone is not the link cue. |
| Text field | with label, hint, error | Label always visible. Placeholder is an example, never the label. |
| Checkbox / radio / switch | checked, unchecked, mixed | Label is clickable. Group radios with a fieldset and legend. |
| Menu | — | Keyboard: arrows, Home/End, Escape, typeahead where it is a long list. |
| Tabs | — | Arrow keys move, panel is associated with `aria-controls`. Do not use tabs as page navigation. |
| Dialog | — | Focus moves in, stays in, and returns to the invoker. Escape closes. Title is a heading. |
| Toast | — | For confirmation of something already done. Not for errors that require action. Those belong inline. |
| Table or list | — | Repeated records. Row hover may reveal actions. The identifying column does not truncate into ambiguity. |

If you need a variant the table does not have, name the job it does that an existing variant cannot. "It looks cooler" is not a job.

## State matrix

Every interactive component specifies all of these. Style them on purpose. Do not leave the browser default on some and a custom style on others.

| State | Treatment |
| --- | --- |
| Default | The quiet appearance. |
| Hover | A step darker or a hairline change. No layout shift. |
| Focus-visible | A 2px ring, offset 2px, in `--text` or `--accent`, 3:1 against the page. |
| Active / pressed | Slightly darker, optional `transform: scale(0.98)` under 120ms. |
| Selected | A persistent difference from hover (weight, fill, or an icon), because hover goes away. |
| Disabled | Reduced contrast, no pointer, removed from tab order if it does nothing. Say why it is disabled if the reason is not obvious. |
| Loading | The control keeps its size. The label remains or becomes a specific verb ("Saving"). Ignore double activation. |
| Error | For fields: border in danger ink plus a sentence in danger ink under the field, associated with `aria-describedby`. |
| Empty | A component that holds a collection has an empty version that names the next action. |

## Buttons and links

- A button does something on the page. A link goes somewhere. Do not style a navigation link as a primary button except for the single main action in a hero.
- Primary: filled with `--accent` (often the ink itself), label in the contrast color. One per region.
- Secondary: transparent fill, 1px `--line-strong` border, text in `--text`.
- Ghost: no border, text in `--text`, hover fills with a faint mix of `--text` at about 6% opacity. For toolbars.
- Danger: danger ink as text and border, or a filled danger button only on the final confirm, never on the button that opens a confirm.
- Button labels are verbs: "Save invoice", "Request a firing". Not "OK", "Submit", or "Click here".
- Icon plus label beats icon alone, except for a familiar row action (close, overflow) with an accessible name.
- Do not put two primary buttons side by side. If two actions are equal, they are both secondary, or the screen is asking two questions and should be split.

## Fields

- Label above the field, 8px away, in the label or body role, `font-weight: 600`, not uppercase unless every label in the product is.
- Hint text under the field, in muted ink, one short sentence. Error replaces the hint in that slot. Do not show hint and error at once.
- The field is at least 40px tall, full width of its column, radius `--radius-control`, border `--line-strong`. On focus, the border becomes `--text` or the ring appears. Do not only change border color to a light blue that fails 3:1.
- Group related fields in a stack with 16px gaps. A two-column form is for short, parallel fields (city / postal code), not for a long form squeezed onto a laptop.
- Required is the default. Mark the optional fields, not every required one, when almost all are required. When few are required, mark those.

## Cards, only when they are objects

A card component is a repeated object: same structure, different data, and the user chooses or compares.

- The whole card is not a click target if it also contains buttons. Either the card is one link, or actions inside it are the only click targets. Nested links break.
- Padding comes from the scale (16 or 24). Shadow is unnecessary when the card sits on `--bg` with a hairline. Use a shadow only if cards overlap or drag.
- Do not put a card inside a card. Do not put one unique idea into a card "for consistency" with a grid that should not exist.

## Empty, loading, and error as components

- **Empty:** one sentence naming what will appear here, and one action to create the first one. No illustration required. If you use one, it is specific to the object (a kiln ticket, a drawing set), not a generic person shrugging.
- **Loading:** skeletons match the loaded layout's line lengths so the page does not jump. Spinners are for actions under 2 seconds inside a control, or for a region whose shape you cannot know.
- **Error:** say what failed and what to do, in the region's own place. A full-page error is for a failed route, not for a failed filter.

## Dos and don'ts

**Do**

- Use native elements (`button`, `a`, `input`, `dialog`, `table`) and add styling. Do not rebuild a button as a `div` with an `onClick`.
- Keep radii, heights, and label sizes identical across the set. Consistency is the polish.
- Truncate with a title attribute or a disclosure only when the full string is available somewhere.
- Give every form a submit affordance that stays visible. A submit button below the fold of a short form is a bug. On a long form, repeat the primary action or make the action bar sticky.

**Don't**

- Don't build a "card grid of features" component and reuse it as the product's personality.
- Don't add tooltips to labels that could just be visible text.
- Don't disable a primary button until the form is valid if you can instead submit and show the error next to the field. Disabling hides the reason.
- Don't use a select for fewer than four options. Use radios. Don't use a select for a boolean. Use a checkbox or switch.
- Don't invent an icon for every menu item. A menu of words scans faster than a menu of words plus unmatched pictograms.

## Before / after

**Before.** Three pill buttons in a row: gradient "Get Started", outline "Learn More", text "Contact". Inputs with placeholder-only labels ("Enter your email..."), gray border `#E5E7EB`, no error state, focus ring removed in a reset. Feature cards are `div`s with `cursor: pointer` and no keyboard handler.

**After.** One primary button, "Request a firing", radius 6px, ink fill. One secondary, "See current work", hairline border. The email field is labeled "Email" above, type `email`, autocomplete `email`, described by "We reply within two working days." An invalid submit writes "Enter a work email." under the field and moves focus there. The feature list is a list, not clickable cards. The dialog that opens traps focus and closes on Escape.

## While coding

1. Build primitives in one place. Pages compose them. A page file that contains its own button CSS has started a second system.
2. Style states with CSS, not with mouse-only JS:

```css
.btn {
  min-height: 40px;
  padding: 0 var(--space-4);
  border-radius: var(--radius-control);
  border: 1px solid transparent;
  font: 600 0.9375rem/1 var(--font-ui);
}
.btn:focus-visible {
  outline: 2px solid var(--text);
  outline-offset: 2px;
}
.btn-primary { background: var(--accent); color: var(--accent-contrast); }
.btn-primary:hover { background: var(--accent-hover, var(--text)); }
.btn-secondary { background: transparent; border-color: var(--line-strong); color: var(--text); }
```

3. If you use a component library, restyle its tokens to this product's tokens. Do not leave the library's default indigo theme in place and "customize later".
4. Test each component with the keyboard only: Tab, Shift-Tab, Enter, Space, Escape, arrows where relevant.
5. Test with 200% zoom and with a 320px viewport. Labels must remain visible. Buttons must not overflow.

## Finishing check

- [ ] Every control is a native element or has an explicit role and keyboard behavior.
- [ ] Primary, secondary, and danger are visually distinct and used for the right jobs.
- [ ] Focus-visible, hover, disabled, and loading are styled and do not move layout.
- [ ] Inputs have visible labels. Errors are sentences tied to the field.
- [ ] Empty states name the next action.
- [ ] No component exists that the page uses only once and that space could have replaced.
