---
name: landing-page
description: >-
  Designs marketing and landing pages with a specific first screen, one idea
  per section, and a structure chosen for the product. Use when building
  homepages, launch pages, marketing sites, hero sections, pricing, feature
  tours, or product storytelling. Use with design-taste, typography, spacing,
  color, and components.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Landing page design

A landing page has one job: help a specific person decide to take a specific next step. It is not a tour of every feature, and it is not a template with the nouns swapped.

The common template — centered headline, gradient, two pills, logo cloud, three feature cards, testimonials, pricing, FAQ, footer — exists because it is easy to generate. Use it only when the product is a multi-plan SaaS that genuinely needs those sections, and even then change the structure so the page could not belong to a competitor.

Follow `design-taste`. Load `motion` only if you have one real moment to animate.

## When to use

- You are building a homepage, a campaign page, a product launch, or a marketing section.
- A page is trying to explain, sell, or introduce something to a first-time visitor.

For an application screen the person uses after they have committed, use `dashboard` instead. Do not put a marketing hero inside a tool.

## The first screen

The first viewport answers four questions, in type and in the specimen, not in four headings:

1. What is this?
2. Who is it for?
3. Why does it matter, in their words?
4. What do I do next?

Write the headline as a claim the product can keep. "Tile fired in small batches for rooms that should still look right in twenty years." beats "Elevate your space". The subhead is one sentence of mechanism or constraint, not a stack of adjectives.

One primary action. A secondary action is a text link or a secondary button, and it is optional. "Learn more" is not an action. Name the destination: "See current work", "Read the method".

If you have a real specimen (the product, the material, the place, a screenshot of the actual tool), it belongs on the first screen. If you do not, do not invent one with stock photography or a decorative mockup of a different product. Type and a fact can carry the screen.

## Pick a structure

Choose one. Say which you chose and why, in a sentence, before coding. Do not mix three of them into a long scroll of everything.

| Structure | Use when | First screen | What follows |
| --- | --- | --- | --- |
| Statement | The offer is a position: a studio, a book, a manifesto, a single product with a strong claim | A large sentence, a short support line, one action. Almost no chrome. | One proof section, then the action again. Stop. |
| Split | You have words and a real specimen of equal importance | Text on one side, specimen on the other. Not 50/50 if the text is short; let the specimen be larger. | Two or three sections, each one idea. |
| Specimen | The thing itself convinces: catalog, portfolio, material, food, a dataset | The object fills the screen. A caption carries the claim and the action. | A way to look closer: a list, a filter, a series. |
| Index | The value is finding something: docs, magazine, directory, changelog | A title and a list, a search, or a table of contents. Navigation is the design. | The index continues. No fake hero above a directory. |
| Argument | The reader must understand a mechanism before they care: developer tools, infrastructure, science | A claim, then the problem in one paragraph | Mechanism, evidence, boundaries, ask. Sequential, not a card grid. |
| Workbench | The page is the tool: a calculator, a converter, "paste a URL" | The input is the hero. The result appears in place. | One example and one sentence on limits. |

**Section jobs.** After the first screen, every section does one of: prove, explain, show, price, or answer. If you cannot name which, cut the section.

- **Prove** with a specific fact: "18-week lead time", "Used on the 4th-floor lobby at 210 Congress", a named customer with a named consequence. Five stars and "Game changer" from Alex R. do not prove anything.
- **Explain** one mechanism. A diagram or a numbered sequence beats three icon cards.
- **Show** the work. Images with captions, not images with marketing headings overlaid in white.
- **Price** when the cost changes the decision. Say the unit (per firing, per seat, per month) and the boundary (what is not included). Three tiers only if three real buying modes exist. If there is one offer, show one price.
- **Answer** the two or three questions a skeptical buyer actually has. A twelve-item FAQ is a failure of the page above it.

## Navigation and chrome

- A small marketing site needs a wordmark and one action. Links only for pages that exist and matter. Do not add Pricing, Blog, Docs, Careers, and Login to look like a company.
- The footer repeats the action and holds the legal line, an address, and a way to write to a person. It is not a second homepage of link columns.
- Do not pin a cookie-banner-shaped promo over the first screen.

## Copy

- Use the vocabulary of the buyer. Architects say "lead time", "sample", "slip", and "grout joint". Founders do not, unless they are the buyer.
- Ban, unless the user wrote them deliberately: unlock, elevate, seamless, powerful, next-gen, cutting-edge, "the future of", "all-in-one", "meet {product}".
- Numbers are copy. "4 glazes" is stronger than "a curated palette of glazes".
- Buttons are verbs with an object.

## Dos and don'ts

**Do**

- Give each section a different shape from the last, so the scroll has rhythm. A text section, then a full-bleed specimen, then a short list. Not six identical bands.
- Use real line breaks in headlines. Do not let a claim wrap at a random word. `text-wrap: balance`, then adjust the width.
- Make the primary action reachable by keyboard and visible without hunting.
- If you mention a customer, use a real one the user supplied, or describe the *kind* of customer without a fake portrait and a fake quote.

**Don't**

- Don't open with a logo cloud of gray rectangles. If the logos are real and the buyer cares, put three, in one line, with a caption "Specified by".
- Don't build a testimonial carousel. Carousels hide the only quote that mattered and add motion for no reason.
- Don't use a video background. If there is a film of the work, put it in the page as a still the user can play, with a caption.
- Don't repeat the hero headline in the next section in different words.
- Don't add a newsletter field "just in case". One ask per page.

## Before / after

**Before.** "Nimbus — The AI platform for modern teams." Centered, gradient, Get Started and Book a Demo. Logo cloud. Three cards: Fast, Secure, Scalable. Carousel of quotes from "Sarah K., Ops". Pricing with Hobby, Pro (highlighted), Enterprise. FAQ of eight generic questions. Footer with five columns of dead links.

**After, for a kiln that sells tile to architects.** Structure: Split. Eyebrow: "Atelier Maren · Portland". Headline is the claim about twenty-year rooms. Subhead: "Four glazes, a standard module, and a written lead time before you specify." Action: "Request a firing." The right half is a grid of the four glazes with their names underneath. Next section proves one project: one photograph, the building name, the glaze, the year. Next section is the constraint list (minimum run, lead time, what they will not do). The page ends by repeating the action. No carousel, no tiers, no FAQ. The swap test fails immediately if you rename it to a CRM.

## While coding

1. Write the section list with a job for each before any CSS. If two sections share a job, merge them.
2. Use semantic structure: `header`, `main`, `section`, `footer`, one `h1`, headings in order. The first screen is not a `div` soup with absolute positioning.
3. The specimen is an `img` with width and height (or aspect-ratio) so the page does not jump, and `alt` that says what the object is. Decorative gloss gets `alt=""`.
4. Set the page max width. Let the first screen's type have a measure. Full-bleed specimens may break out of the measure on purpose.
5. On a narrow viewport: headline, the action, then the specimen. Do not put a decorative image above the claim.
6. Check the page with images blocked and with CSS color forced to grayscale. The words should still make the decision possible.

## Finishing check

- [ ] You can name the structure and the job of each section.
- [ ] The first screen answers what, who, why, and next step.
- [ ] There is one primary action, labeled as a verb with an object.
- [ ] Proof is specific, or it is absent.
- [ ] No section is an identical card grid unless the objects are real, repeated, and choosable.
- [ ] The swap test fails: this page cannot be reskinned as a different product by changing the logo.
