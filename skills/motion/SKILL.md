---
name: motion
description: >-
  Adds motion only when it explains a change of state, cause, or spatial
  relationship, with specific durations, easing, and reduced-motion support.
  Use when animating interfaces, building transitions, hover effects, page
  load, or scroll effects, or when the user asks for animation, delight, or
  micro-interactions. Use with design-taste.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Motion and interaction

Motion is a sentence about what just changed. If nothing changed, nothing should move. A fade-and-rise on every section does not explain the product. It explains that an agent knew the word "animate".

Follow `design-taste`. One motion language per product, then stop.

## When to use

- You are adding CSS transitions, keyframes, a JS animation library, or scroll-driven effects.
- Hover, open, close, route change, or loading needs to be understandable.
- The user asked for something to "feel alive".

If the interface is a form, a table, or a document, the correct amount of motion is often a 150ms color and border transition and nothing else.

## Legal reasons to move

Use motion for one of these. If you cannot name which, do not animate.

1. **State.** A control changed: hover, press, focus, selection, expansion. The element itself transforms or recolors. The page does not.
2. **Cause.** Something arrived or left because the user did something: a dialog, a toast, a new row, a deleted row. The motion should answer "where did it come from?"
3. **Place.** The user moved between regions and needs to keep their bearings: a shared element, a panel sliding from the edge that invoked it, a drill-in that moves forward.
4. **Progress.** Work is happening that they must wait for. Show that the system is not frozen. A spinner or a thin progress bar is enough. Do not loop a decorative illustration beside it.

Marketing pages may have one orchestrated moment (a specimen settling, a headline resolving). They do not get a choreographed entrance for every block.

## Duration and easing

| Change | Duration | Easing |
| --- | --- | --- |
| Hover color, border, opacity | 120–160ms | `ease-out` |
| Press (scale 0.98) | 80–120ms | `ease-out` |
| Menu, disclosure, tooltip | 160–220ms | `ease-out` on open, `ease-in` on close |
| Dialog, drawer | 200–280ms | `ease-out` entering, `ease-in` leaving |
| Layout move (a shared element) | 250–400ms | `cubic-bezier(0.2, 0, 0, 1)` |
| Exit | Shorter than entrance | `ease-in` |

Never use a bounce, an elastic, or a spring overshoot on routine UI. A drawer that bounces at the end feels like a toy and slows the next click. Reserve a spring for a single playful product where the brand is already that, and only for one gesture.

Do not animate layout properties (`width`, `height`, `top`, `margin`) when `transform` and `opacity` can say the same thing. Layout animation stutters and shifts neighbors.

Entrances travel a short distance: 4–8px, or a slight scale from 0.98. A 40px rise is a slide, and a slide needs a reason (it came from that edge).

## A small vocabulary

Pick at most three patterns for the whole product and reuse them.

```css
:root {
  --move-fast: 140ms ease-out;
  --move: 200ms ease-out;
  --move-slow: 320ms cubic-bezier(0.2, 0, 0, 1);
}

@media (prefers-reduced-motion: reduce) {
  :root {
    --move-fast: 1ms linear;
    --move: 1ms linear;
    --move-slow: 1ms linear;
  }
}

.popover {
  transform-origin: top left;
  transition: opacity var(--move), transform var(--move);
}
.popover[hidden] { /* or [data-state=closed] */
  opacity: 0;
  transform: translateY(-4px);
}
```

Reduced motion is not optional. When `prefers-reduced-motion: reduce` is set, remove travel and scaling. Keep instant state changes and opacity fades under 150ms only if they help comprehension. Focus management and content updates still happen.

## Interaction is not decoration

- **Hover** changes something the user can act on: background, underline, a revealed action. It never moves the layout (no `translateY` that shifts the document). It is never the only way to reach an action, because touch has no hover.
- **Press** acknowledges the pointer with a small scale or a darker fill, under 120ms.
- **Focus-visible** is a ring or an offset outline in a color that clears 3:1 against both the control and the page. Do not remove outlines without replacing them. `:focus-visible`, not `:focus`, so mouse clicks do not leave a ring that looks like a bug.
- **Loading.** Buttons that submit show a pending state on themselves (label change plus a small indicator) and ignore double submits. Pages that load show skeletons that match the layout's real widths, not a centered spinner over an empty viewport. Skeletons do not shimmer if the user prefers reduced motion.
- **Nothing loops** except a progress indicator while work is in flight. No pulsing logos, no gradient background animation, no floating blobs.

## Scroll

Scroll-linked fade-up of every section is the default slop motion. Do not add it.

Acceptable scroll motion:

- A single sticky element that changes in a way that preserves context (a compact header).
- A progress indicator through a long document.
- One pinned specimen while the adjacent copy changes, if the subject is the specimen.

If you use an animation library, you still follow the duration table and reduced motion. A library is not a reason to animate more.

## Dos and don'ts

**Do**

- Interrupt an in-progress exit if the user reverses direction. Closing and reopening should not queue two animations.
- Keep hit areas stable during hover. Do not make the user chase a moving button.
- Let a new page start at the top, instantly, unless the user navigated "back" and you are restoring scroll.
- Test animations at 4× slowdown in the browser's animation inspector. If the path looks confused slowly, it is confused at full speed too.

**Don't**

- Don't animate on initial page load beyond one moment.
- Don't use scroll hijacking, smooth-scroll on every in-page link longer than a short jump, or parallax on text.
- Don't fade in text character by character.
- Don't delay a data update so an animation can finish. Information first, motion second. If you must sequence, cap the wait at the duration table.
- Don't add motion to hit a "delight" request by sprinkling classes on every block. Choose one moment that fits the subject.

## Before / after

**Before.** A landing page where each section fades up 24px and waits 100ms after the previous section, a gradient background shifts hue on a 12s loop, cards lift 8px and grow a shadow on hover, and the primary button bounces when the page loads.

**After.** The page is still. The header gains a hairline when it becomes sticky, in 140ms. The primary button darkens on hover and scales to 0.98 on press. Opening "Request a firing" fades and rises 4px in 200ms, origin at the button, and focus moves into the dialog. Closing is 140ms, ease-in, and focus returns to the button. With reduced motion on, the dialog appears without travel. Nothing else moves.

## While coding

1. Define `--move-fast`, `--move`, and `--move-slow` once. Ban ad-hoc `duration-300`, `duration-500`, `duration-700`, and `duration-1000` in components.
2. Prefer CSS transitions for state. Use keyframes for a loading indicator or the one orchestrated moment.
3. Gate the decorative moment:

```css
@media (prefers-reduced-motion: no-preference) {
  .specimen { animation: settle var(--move-slow) both; }
  @keyframes settle {
    from { opacity: 0; transform: translateY(8px); }
    to { opacity: 1; transform: none; }
  }
}
```

4. Do not make the user wait: if you use animation on a route transition, start it immediately and keep it under 300ms. Never put a 1s intro in front of a tool.
5. Verify keyboard operation. Animations must not trap focus, hide focus, or move a focused element off screen.

## Finishing check

- [ ] Every animation cites state, cause, place, or progress.
- [ ] Durations come from the table. Nothing routine runs past 400ms.
- [ ] Easing is ease-out in, ease-in out. No bounce on UI chrome.
- [ ] `prefers-reduced-motion: reduce` removes travel and loops.
- [ ] Hover does not shift layout and is not required to operate the UI.
- [ ] `:focus-visible` is visible on every interactive control.
