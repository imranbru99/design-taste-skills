#!/usr/bin/env python3
"""Sanity-check skill folders against the Agent Skills spec."""

from __future__ import annotations

import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
SKILLS = ROOT / "skills"
MAX_LINES = 500
MAX_DESC = 1024
REQUIRED = {
    "design-taste",
    "typography",
    "spacing",
    "color",
    "motion",
    "components",
    "landing-page",
    "dashboard",
    "theming",
    "anti-slop",
    "critique",
}


def parse_frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---\n"):
        raise ValueError("missing frontmatter")
    end = text.find("\n---\n", 4)
    if end == -1:
        raise ValueError("unterminated frontmatter")
    raw = text[4:end]
    data: dict[str, str] = {}
    key = None
    buf: list[str] = []
    for line in raw.splitlines():
        if key and (line.startswith("  ") or line.startswith("\t")):
            buf.append(line.strip())
            continue
        if key is not None:
            data[key] = _collapse(buf)
            key = None
            buf = []
        if not line.strip() or line.strip().startswith("#"):
            continue
        if ":" not in line:
            raise ValueError(f"bad frontmatter line: {line}")
        k, v = line.split(":", 1)
        key = k.strip()
        buf = [v.strip().strip('"').strip("'")]
    if key is not None:
        data[key] = _collapse(buf)
    return data


def _collapse(parts: list[str]) -> str:
    text = " ".join(part for part in parts if part).strip()
    if text.startswith(">"):
        text = text.lstrip(">").lstrip("-").strip()
    return " ".join(text.split())


def main() -> int:
    errors: list[str] = []
    found: set[str] = set()
    for path in sorted(SKILLS.glob("*/SKILL.md")):
        name = path.parent.name
        found.add(name)
        text = path.read_text(encoding="utf-8")
        lines = text.splitlines()
        if len(lines) > MAX_LINES:
            errors.append(f"{name}: {len(lines)} lines exceeds {MAX_LINES}")
        try:
            meta = parse_frontmatter(text)
        except ValueError as exc:
            errors.append(f"{name}: {exc}")
            continue
        if meta.get("name") != name:
            errors.append(f"{name}: frontmatter name is {meta.get('name')!r}")
        desc = meta.get("description", "")
        if not desc:
            errors.append(f"{name}: empty description")
        elif len(desc) > MAX_DESC:
            errors.append(f"{name}: description is {len(desc)} chars")
        elif desc.startswith(("I ", "You ", "you ")):
            errors.append(f"{name}: description should be third person")
        if "Use when" not in desc and "use when" not in desc:
            errors.append(f"{name}: description should say when to use it")
        if meta.get("license") != "MIT":
            errors.append(f"{name}: license should be MIT")
        body = text.split("\n---\n", 1)[-1]
        for heading in ("## When to use", "## Before / after", "## While coding", "## Finishing check"):
            if heading not in body:
                errors.append(f"{name}: missing {heading}")
    missing = REQUIRED - found
    extra = found - REQUIRED
    if missing:
        errors.append(f"missing skills: {', '.join(sorted(missing))}")
    if extra:
        errors.append(f"unexpected skills: {', '.join(sorted(extra))}")
    if errors:
        print("\n".join(errors), file=sys.stderr)
        return 1
    print(f"{len(found)} skills ok")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
