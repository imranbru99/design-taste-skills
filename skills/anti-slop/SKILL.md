---
name: anti-slop
description: >-
  Detects generic AI interface patterns — purple gradients, identical card
  grids, Inter-on-gray, glassmorphism, fake metrics, gradient text — and
  replaces each with a specific fix. Use when reviewing generated UI, when
  output looks templated or "AI", when polishing a first pass, or when the
  user mentions slop, generic design, or making something less AI-looking.
  Use with design-taste. Use critique when the user wants a written review.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Anti-slop

Slop is the look models converge on when they have not made a decision: a purple gradient, a centered headline, three cards, a gray subtitle, a pill button. It photographs as "modern" and communicates nothing about the product.

This skill is a detection pass. Run it after a first draft, or when the user says the UI looks generic. For each hit, apply the fix. Do not "fix" a purple gradient by swapping it for a blue gradient. That is the same decision.

`critique` writes the review and ranks revisions. This skill names the patterns and the replacement.

## When to use

- You just generated a page, a component, or a style and have not compared it to this list.
- The user says it looks AI, generic, cheap, samey, or "off".
- You are about to add a gradient, a glass panel, a feature grid, or a stat card from habit.

## How to scan

1. Look at the screenshot or the page from two meters away (or squint). If you see a purple cloud, a row of equal boxes, or a centered stack and nothing else, you have a hit.
2. Walk the list below. A page can have several hits. Fix the earliest ones first. They cause the rest.
3. After fixes, run the swap test from `design-taste`: if a competitor's name fits the same layout, keep going.
4. Stop when the page is specific and quiet. Do not replace slop with ornament.

## Pattern catalog

### 1. The purple wash

**Looks like:** a full-bleed gradient from indigo to fuchsia, white centered type, sometimes a glow or a grid of dots.
**Why it happens:** a gradient reads as "designed" without a subject.
**Fix:** a flat field in a tinted neutral, or one flat brand color the type can sit on at 4.5:1. Put color in the accent, or in the specimen. If the product truly has a luminous material, show a photograph of it.

### 2. The three feature cards

**Looks like:** a row of equal cards, each a pastel circle, a bold title, and two lines of gray text. Titles like Fast, Secure, Scalable, Reliable, Seamless.
**Fix:** if the ideas are not the same kind of object, they are not cards. Use a list, a split with one idea enlarged, or an argument section. If they are real repeated objects (plans, glazes, files), cards are fine, and the titles should be the object's name, not an adjective.

### 3. Inter on gray

**Looks like:** Inter, Roboto, or system-ui as the whole design; body in near-black; secondary lines in `#9CA3AF` (about 2.5:1 on white) or an unchecked `gray-500` on tinted paper; no size jumps.
**Fix:** choose a face for the subject, or commit to a neutral and build hierarchy with the four type roles. Set muted text to a checked ink such as `#5E564E` on warm paper. See `typography` and `color`.

### 4. Glass, mesh, and gradient text

**Looks like:** `backdrop-filter: blur` panels over a busy gradient, mesh blobs in the corners, a headline filled with `background-clip: text`.
**Fix:** delete the effect. Use a solid surface and a solid text color. Translucency is for a layer that genuinely floats over varying content (a bar over a map or a photo), at an opacity high enough to read.

### 5. The pill row

**Looks like:** fully rounded buttons, often two of them, labeled "Get Started" and "Learn More", sometimes with a play icon.
**Fix:** one primary action named for the outcome ("Request a firing", "Create the route"). Radius 4–8px unless the product's controls are already pills. The secondary action is a real destination, or it is gone.

### 6. Fake proof

**Looks like:** a logo cloud of anonymous rounded rectangles, five yellow stars, a quote from "Alex R., CEO" with a generated portrait, "Trusted by 10,000+ teams".
**Fix:** one real proof the user supplied (a name, a place, a number with a source), or no proof section. Inventing customers is not a visual choice. It is a false claim. Do not generate portraits of people.

### 7. Vanity stat cards

**Looks like:** four tiles with a giant number, a tiny label, a green upward arrow, and a gradient or colored corner. "12,409 Users".
**Fix:** a figure with a window and a comparison, set in the page's type, next to the list that explains it. Remove metrics nobody can act on. See `dashboard`.

### 8. Icon-in-a-circle, times six

**Looks like:** every feature or nav item has a unique colored disc and a generic line icon (a bolt, a shield, a gear, a sparkle).
**Fix:** drop the icons first. If scanning still suffers, use one icon style, one color (current text color), and only where the icon adds a cue words do not. Sparkle icons signal "AI" and nothing else. Remove them.

### 9. Everything in a box

**Looks like:** the page is nested rectangles, each with a border, a shadow, and 24px of radius. Cards inside cards inside a container.
**Fix:** remove a level of boxes until sections are separated by space and a heading. Keep a border on inputs and on objects the user selects. See `spacing`.

### 10. Centered everything

**Looks like:** every section is `text-align: center`, including paragraphs of two or three lines and feature lists.
**Fix:** left-align. Center only a short statement of one or two lines. Forms, tables, and prose share a left edge.

### 11. The emoji interface

**Looks like:** emoji used as icons, bullets, empty states, and button prefixes. A wave in the greeting. A rocket on "Ship it".
**Fix:** remove them. Use words. If a symbol is load-bearing, use a small SVG in the text color with a real accessible name, or a character from the typeface.

### 12. Greeting and exclamation

**Looks like:** "Welcome back, Sarah!", "Your dashboard is ready 🎉", "Let's supercharge your workflow."
**Fix:** the page title is the object ("Orders", "Billing"). If there is nothing to show, the empty state says what to create. Do not address the user by name in a headline unless the product's purpose is personal correspondence.

### 13. One more radius, one more shadow

**Looks like:** inputs at 8px, cards at 16px, modals at 24px, buttons at 999px, each with `shadow-lg`.
**Fix:** one control radius. Surfaces either share it or are square. Shadow only on floating layers (`--shadow-pop` from `theming`).

### 14. The default SaaS skeleton

**Looks like:** nav with six links, hero, logos, three features, split "built for teams", testimonial carousel, three pricing tiers with the middle one scaled up, FAQ accordion, footer with four columns of placeholder links. The product name is the only specific word.
**Fix:** pick one structure from `landing-page` and delete every section that does not serve it. A page with three sections about a real subject will beat this skeleton every time.

## Replacement heuristics

When you remove a pattern, replace it with a decision, not with another effect.

| You removed | Replace it with |
| --- | --- |
| A gradient background | A tinted neutral, or one flat color |
| Three adjective cards | One claim and a specific list, or real objects |
| A fake quote | A fact, or silence |
| A second button | A link with a destination, or nothing |
| A stat card | A number with a window, next to its source |
| A colored icon circle | The word, or one monochrome icon |
| A shadow on a static panel | A hairline, or more space |
| A carousel | The single best item, visible |

## What not to do while fixing

- Do not restyle slop into a different trendy costume (glass becomes brutalist noise, purple becomes acid green, cards become bento). That is still a costume.
- Do not add motion to distract from a structure problem.
- Do not introduce a new font, a new icon library, and a new illustration set in the same pass. Change the structure and the copy first. Add a face only if the current one is part of the problem.
- Do not claim the redesign is done while the headline could still sit on a competitor's site.

## Before / after

**Before.** A generated homepage for "Northline, AI logistics". Indigo mesh background. Centered "Ship smarter with AI". Two pills. Six feature cards with colored discs (bolt, shield, sparkle, clock, globe, chart). A row of gray fake logos. "Trusted by innovative teams worldwide." Inter throughout. Gray-400 subcopy.

**After.** Structure: Workbench, because the user is a dispatcher who has a load to place. The first screen is a lane, a date, and "Find a truck", on warm-cool ink, no mesh. Under it, one sentence of constraint: "Regional freight, 11 western states, no brokers." Proof is a single line the company can stand behind ("Median tender to cover: 14 minutes, last 90 days") or it is omitted until they have the number. Features that were adjectives are cut. What remains is a short list of what the dispatcher can actually do. The swap test: a CRM cannot wear this screen.

## While coding

1. After the first visual pass, search the diff for the usual signatures and inspect each hit:

```
bg-gradient, from-indigo, from-purple, to-pink, bg-clip-text,
backdrop-blur, rounded-full, shadow-xl, shadow-2xl,
text-gray-400, text-gray-500, text-muted-foreground (then check the actual color),
🚀, ✨, 👋, Get Started, Learn More, Welcome, Seamless, Elevate, Unlock
```

2. For each hit, apply the catalog fix in the earliest-pattern-first order. Do not restyle around a hit you could delete.
3. Re-read the headline out loud. If it would work for any product in the category, rewrite it until it contains a constraint, a material, a place, or a time.
4. Screenshot the result, squint, and confirm one loud thing and a visible left edge or a deliberate center.

## Finishing check

- [ ] None of the fourteen patterns remain, or each survivor has a stated reason tied to the subject.
- [ ] The headline contains something only this product can say.
- [ ] You did not replace one costume with another.
- [ ] Proof is real or absent.
- [ ] Muted text, if it exists, passes contrast.
- [ ] The page still has one primary action.
