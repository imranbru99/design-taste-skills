---
name: critique
description: >-
  Critiques an existing interface on intent, hierarchy, restraint, specificity,
  and craft, then applies a short ranked list of revisions. Use when the user
  asks for a design critique, design review, polish pass, or to improve,
  refine, or redesign an existing page, screen, or component. Use with
  design-taste. Use anti-slop to name generic patterns during the review.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Critique and refinement

A critique is a ranked argument about what the screen is doing to the person in front of it. It is not a list of every spacing token you would have chosen, and it is not a rewrite for its own sake.

Two modes:

- **Review.** The user wants the critique and does not want edits yet. Deliver the report and stop.
- **Revise.** The user wants the design improved, or they asked you to build on something that is already weak. Deliver the report, then implement the ranked revisions in order, and stop when they are done.

If it is unclear which mode, and the user said "critique", "review", or "what's wrong", do Review. If they said "improve", "polish", "fix the design", or "make this better", do Revise.

## When to use

- There is an existing page, component, screenshot, or mock to respond to.
- A first pass exists and needs judgment before more features.
- The user asks why something looks bad, or to raise the quality without specifying pixels.

Do not use this to nitpick copy in a backend diff, and do not open a redesign the user did not ask for when they asked for a bug fix.

## Read before you judge

Look at the thing. Note:

1. What you think the screen is for, in one sentence.
2. What the first, second, and third glances actually land on.
3. Which `anti-slop` patterns are present. Name them; do not paraphrase them into vibes.
4. What is already working and should survive. A critique that only subtracts will delete the one specific thing the screen has.

If you can run it, look at it at desktop width and at 375px, with the keyboard, and with an empty or error state if one exists. Say which of these you could not check.

## The five lenses

Score each lens in a sentence, not a number. A number pretends the judgment is a metric.

### Intent

Can you write the 3-second sentence from `design-taste` for this screen as it stands? If the screen serves two jobs (explain the product and operate the product), name the conflict. Recommend one job for this view.

### Hierarchy

Does glance order match importance? Common failures: a logo louder than the claim, a metric louder than the queue, a secondary button louder than the primary, a heading on every card so nothing is a heading.

### Restraint

What can leave without breaking the job? Look for duplicate actions, sections that repeat the hero, boxes around things space already grouped, and status color used as decoration.

### Specificity

Run the swap test. Could a competitor wear this layout unchanged? Generic copy, stock imagery, and the default SaaS skeleton fail here even when the spacing is tidy. Name the one detail that makes the screen belong to this product, or say that none does.

### Craft

Alignment, type roles, contrast, hit targets, focus, and state coverage. Craft is last on purpose. Do not lead with "the border radius is inconsistent" when the page has the wrong structure. Do mention craft when it blocks use: contrast failures, missing labels, focus removed, type below 16px for prose.

## The report

Use this shape. Keep it short enough that the user can act.

```markdown
## Critique

Mode: Review | Revise
Subject: [screen or component]
Seen at: [widths and states you actually checked]

Sentence as built: ...
Sentence it should serve: ...

### Lenses
- Intent: ...
- Hierarchy: ...
- Restraint: ...
- Specificity: ...
- Craft: ...

### Working already
- ...

### Revisions
1. [Highest leverage.] What to change, and what it unlocks.
2. ...
3. ...

### Leave alone
- ...
```

Rules for the revision list:

- Three to five items. If you have more, you have not ranked. Put the rest aside.
- Order by leverage: structure and content first, then hierarchy, then type and color, then polish. A new font does not outrank a wrong first screen.
- Each item is a change a person can make, not a value ("improve the spacing"). Say the move ("collapse the three feature cards into one list under a single claim").
- The first item should be the one you would do if you could only do one.
- "Leave alone" is required. It prevents a revise pass from restyling the parts that were fine.

## Revise mode

After the report, implement the revisions in order.

- Touch only what the list names. A drive-by restyle of neighboring components betrays the critique.
- If revision 1 makes revision 3 unnecessary, skip 3 and say so.
- Preserve behavior, routes, and copy intent unless the revision is explicitly about copy. Do not invent testimonials, metrics, or customers while "improving the design".
- If a revision needs a fact you do not have (the real lead time, the real empty-state action), use a clearly labeled placeholder and tell the user what to replace. Do not fabricate proof.
- When the list is done, stop. Show what changed in a few lines tied back to the revision numbers. Do not open a second round unless the user asks.
- Re-check contrast, focus, and the narrow viewport for anything you touched.

## Before / after

**Existing screen.** A billing page titled "Welcome to Billing". Four pastel stat cards (MRR, Churn, Seats, NPS). Below, a card containing another card with the invoice table. Primary button "Get Started" next to "Learn More". Muted text is gray-400. The empty state, when there are no invoices, still shows the four cards and an illustration of a rocket.

**Report, compressed.**

- Sentence as built: a visitor is being sold analytics. Sentence it should serve: a studio manager finds unpaid invoices and sends a reminder.
- Hierarchy is inverted: NPS is louder than the unpaid row.
- Restraint: drop the greeting, the four cards, the inner card, and "Learn More".
- Specificity fails the swap test. Nothing says this is a kiln studio's billing.
- Craft: muted text fails contrast, and the table's identifying column is centered.

**Revisions.** (1) Replace the header with "Invoices" and a primary "New invoice". (2) Replace the stat cards with one line: "4 unpaid · $12,400 · oldest 32 days", leading into the table sorted by oldest unpaid. (3) Flatten the nested cards. (4) Darken secondary text and left-align the table. Leave the invoice row actions alone. They already say "Send reminder" and "Record payment".

That is a revise pass. It does not also redesign the settings page, introduce a new brand font, or add a chart.

## While coding

1. If the user pasted a screenshot or a file, cite the concrete offenders (the greeting, the four cards, the nested container) so the report is about this screen.
2. In Revise mode, edit the existing files. Do not recreate the page in a new file unless the user asked for a separate exploration.
3. Map each code change to a revision number in your final note, so they can reject one without losing the others.
4. If you disagree with a constraint the user set ("keep the three cards"), say so once, follow it, and make those cards as specific and quiet as the constraint allows.
5. Do not expand a polish request into a new information architecture. Rank the IA change as revision 1 and let the user accept it. If they only asked for visual polish, keep revision 1 visual and mention the IA issue under the lenses without building it.

## Finishing check

- [ ] Mode is explicit, and you stopped at the report if the mode is Review.
- [ ] All five lenses are present, each as a judgment about this screen.
- [ ] Revisions are ranked, concrete, and fewer than six.
- [ ] Something is marked to leave alone.
- [ ] In Revise mode, the diff follows the list and does not wander.
- [ ] No invented social proof, metrics, or portraits.
