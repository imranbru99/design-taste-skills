---
name: dashboard
description: >-
  Designs dense, scannable application UI for operators: queues, records,
  metrics, filters, tables, and charts with quiet chrome. Use when building
  dashboards, admin tools, settings screens, data-heavy products, or SaaS app
  shells. Use with design-taste, spacing, typography, color, and components.
  Do not use the landing-page skill inside an app.
license: MIT
metadata:
  author: Imran Ahmed
  website: https://imrandev.bd
  version: "1.0.0"
---

# Dashboard and app design

An application is a place where someone does a job they already understand. They do not need to be welcomed, impressed, or told what the product is. They need to find the next item, trust a number, and act without hunting.

Density is a feature. Alignment is the polish. Color is a status signal, not a theme park.

Follow `design-taste`. A dashboard that looks like a marketing page — hero, gradient stat cards, generous whitespace — is failing its user.

## When to use

- You are building the surface people use after they have an account: dashboards, inboxes, CRMs, billing tools, admin, settings, editors, monitoring.
- You are displaying records, metrics, filters, or a navigation shell.

## Pick the screen type

| Type | The user is here to | The spine of the layout |
| --- | --- | --- |
| Queue | Work the next item | A list or table. Filters above. The row is the unit. Status is a word plus a small mark. |
| Record | Understand and edit one entity | A title, the few attributes that identify it, then sections or tabs of related facts. |
| Overview | Decide where to look, then leave | Three to six figures, each with a delta and a time window, then the list that explains the outliers. |
| Settings | Change a preference and leave | A narrow column. Labels and controls. No hero, no illustrations. |

If you are unsure, build a queue. Most "dashboards" are queues with vanity metrics bolted on top. Cut the metrics until someone asks for them.

## The shell

- A left rail or a top bar, not both full of the same links. Pick one primary navigation.
- Navigation items are named for the objects: "Orders", "Kilns", "Invoices". Not "Dashboard", "Insights", "Experience".
- The current location is marked by weight or a quiet bar, and by the page title. Do not use a saturated pill behind every active item.
- The account menu and the rare global action live at the far edge. Everything else is content.
- Breadcrumbs only when the hierarchy is deeper than two levels and the user drills in. They are not decoration under a top bar.
- Page title in the title role, left-aligned, with the primary action of *this page* on the same row, right-aligned. One primary.

## Numbers

A number without a comparison and a window is decoration.

- Write "86 past due · since Monday", not a giant "86".
- The delta states direction in a word or a sign, and in color only as reinforcement. Red is not "down" if down is good. Color the exception, not the trend direction, unless direction is the point and you also say "up" or "down".
- Do not put metrics in gradient cards. Put them in a row of plain figures with a shared baseline, or in the header of the list they summarize.
- If a figure is not actionable and not diagnostic, remove it. "Total users: 12,409" on an operator's morning screen is a vanity metric unless their job is growth.

## Tables and lists

Tables are the default for repeated records with several attributes. Cards are the default only when each item is visual (a photo, a glaze, a creative) or has a variable shape.

- Align text left, numbers right, headers in the label role. Use tabular figures.
- The first column identifies the row (name, number, place). It is the one that stays visible if you have to freeze a column.
- Row hover may reveal actions. Do not show a button column that is empty until hover if the action is the point of the screen. Then the action is visible.
- Sort by the column the user is most likely to care about, and show the sort.
- Zebra stripes are unnecessary when row height and a hairline already separate rows. A hover wash is enough.
- Empty is a row that says there is nothing in this filter, plus how to clear the filter. It is not an illustration in the middle of the page.
- Pagination or infinite scroll is a conscious choice. A tool that needs random access into thousands of rows gets pagination and a count. A feed gets more-on-scroll.

## Filters

- Filters sit above the list, as controls, not as a sidebar of checkboxes that pushes the list off the screen, unless the filter set is large and persistent.
- Show active filters as removable chips under the control row, with a "Clear" action.
- The default view is the one that matches the job: "Open" not "All", "This week" not "All time", if that is how the user starts. Say what the default is.

## Charts

Use a chart when the shape of the data is the point (a trend, a distribution, a comparison over time). Use a table when the values are the point.

- One series, or two to compare. A legend with eight colors is a failed chart. Split it.
- Axes have units. The y-axis starts at zero for bar charts. Do not truncate to exaggerate.
- Gridlines are faint (`--line`), not gray boxes. The chart background is the page background.
- Do not use a 3D chart, a donut of more than three slices, or a rainbow palette. A single ink plus the accent for the series that matters is enough.
- Always offer the values another way: a table next to it, or a tooltip that shows the exact figure. Do not make a tooltip the only way to read a number the user needs.

## Forms inside apps

Settings and edit screens use the `components` rules: visible labels, errors under fields, a primary action that says what it saves. Destructive actions are isolated, named for the destruction ("Delete kiln log"), and confirmed with a sentence that names the object, not "Are you sure?".

Do not wrap a settings form in cards stacked down the page. Use headings and a single column.

## Dos and don'ts

**Do**

- Prefer a dense, quiet screen the user can scan by running a finger down one column.
- Put the exception in front of the user: failed, late, over threshold. Sort or badge the rows that need a person.
- Use the same status words everywhere. Pick "Past due" or "Overdue" and do not also say "Delayed" and "At risk" for the same state.
- Show time in the user's zone, with the zone if the product crosses zones. Relative time ("3h ago") needs an absolute time on hover or in the record.
- Make loading stable: reserve the row height, don't flash a skeleton that is a different shape from the table.

**Don't**

- Don't open an app with a welcome banner, a gradient header, or "Here's what's happening, Sarah".
- Don't use a card grid for tabular data.
- Don't color entire rows in saturated red and green. Tint the status mark, or use a left border in the status ink if the whole row must be findable.
- Don't hide critical actions in a kebab menu to make the row look clean. Hide the rare ones.
- Don't auto-refresh in a way that moves rows while the user is about to click. Pause updates or insert them without reordering the viewport.
- Don't put a chart, four stat cards, a calendar, an activity feed, and a table on one overview "so it looks full". Full is not the goal. Decided is.

## Before / after

**Before.** "Good morning, Alex 👋" over a purple header. Four gradient cards: Revenue, Users, Growth, NPS, each a giant number with a green arrow. Below, six "quick actions" as icon tiles. Below that, a donut of plan types and a feed of "User signed up" events. Nothing tells Alex what to do today.

**After.** Title: "Orders". Action: "New order". A filter row: status (default Open), glaze, due window. A one-line summary in the label role: "14 open · 3 past due · due this week". A table: order number, architect, glaze, quantity, due, status. Past-due rows sort first. Status is the word "Past due" in danger ink with a small dot. Clicking a row opens the record. No greeting, no donut, no quick-action tiles. Alex can see the late work in one glance.

## While coding

1. Build the shell once: navigation, page header, content region. Pages fill the content region. They do not each redraw the gradient header.
2. Use a real table element for tabular data, with `th scope="col"`. Lists of objects with variable content can be `ul`.
3. Right-align numeric columns with `font-variant-numeric: tabular-nums` and a consistent format (thousands separator, unit in the header not in every cell, except currencies that differ per row).
4. Define status as data, not as color classes scattered through JSX:

```css
.status { display: inline-flex; align-items: center; gap: var(--space-2); font-weight: 600; }
.status::before {
  content: "";
  width: 8px; height: 8px; border-radius: 50%;
  background: currentColor;
}
.status[data-state="past-due"] { color: var(--danger); }
.status[data-state="open"] { color: var(--muted); }
```

The word is in the element. The dot repeats the color. Color is not the only signal.

5. At 768px and below, the queue can become a stacked list of the identifying fields, not a shrunken table with horizontal scroll, unless comparing columns is the job. If it is, keep the table and allow horizontal scroll with the first column frozen.
6. Do not introduce a chart library for a single series you could draw with a labeled bar. If you do use one, theme it with the same tokens and turn off the default rainbow.

## Finishing check

- [ ] The screen type is queue, record, overview, or settings, and the layout matches.
- [ ] The first useful information is visible without scrolling on a laptop.
- [ ] Every prominent number has a window and a comparison, or it is gone.
- [ ] Tables align, use tabular figures, and have a clear identifying column.
- [ ] Status is a word plus a mark, using a shared vocabulary.
- [ ] There is one primary action on the page, named for what it does.
- [ ] No greeting banner, gradient stat cards, or icon-tile quick actions.
