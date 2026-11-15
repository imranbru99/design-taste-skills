#!/usr/bin/env bash
# Link or copy design-taste-skills into the folders coding agents scan.
#
# User-wide (default):
#   ./install.sh
#   → ~/.agents/skills/   (Cursor, Codex, Gemini CLI, Copilot, OpenCode)
#   → ~/.claude/skills/   (Claude Code)
#
# One project:
#   ./install.sh --project /path/to/app
#   → /path/to/app/.agents/skills/
#   → /path/to/app/.claude/skills/
#
# Flags:
#   --copy          copy directories instead of symlinking
#   --agents-only   skip .claude/skills
#   --claude-only   skip .agents/skills
#   --cursor        also link .cursor/skills (project) or ~/.cursor/skills (user)
#   --force         replace an existing skill directory
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCOPE="user"
PROJECT=""
MODE="link"
AGENTS=1
CLAUDE=1
CURSOR=0
FORCE=0

usage() {
  sed -n '2,19p' "$0"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --project)
      SCOPE="project"
      if [[ "${2:-}" != "" && "${2:-}" != --* ]]; then
        PROJECT="$2"
        shift
      else
        PROJECT="$(pwd)"
      fi
      ;;
    --copy) MODE="copy" ;;
    --agents-only) CLAUDE=0; AGENTS=1 ;;
    --claude-only) AGENTS=0; CLAUDE=1 ;;
    --cursor) CURSOR=1 ;;
    --force) FORCE=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown argument: $1" >&2; usage >&2; exit 1 ;;
  esac
  shift
done

if [[ "$SCOPE" == "project" && -z "$PROJECT" ]]; then
  PROJECT="$(pwd)"
fi

declare -a DIRS=()
if [[ "$SCOPE" == "user" ]]; then
  [[ "$AGENTS" -eq 1 ]] && DIRS+=("$HOME/.agents/skills")
  [[ "$CLAUDE" -eq 1 ]] && DIRS+=("$HOME/.claude/skills")
  [[ "$CURSOR" -eq 1 ]] && DIRS+=("$HOME/.cursor/skills")
else
  [[ "$AGENTS" -eq 1 ]] && DIRS+=("$PROJECT/.agents/skills")
  [[ "$CLAUDE" -eq 1 ]] && DIRS+=("$PROJECT/.claude/skills")
  [[ "$CURSOR" -eq 1 ]] && DIRS+=("$PROJECT/.cursor/skills")
fi

if [[ ${#DIRS[@]} -eq 0 ]]; then
  echo "No destination selected." >&2
  exit 1
fi

install_one() {
  local src="$1" dest_root="$2" name
  name="$(basename "$src")"
  local dest="$dest_root/$name"
  mkdir -p "$dest_root"
  if [[ -e "$dest" || -L "$dest" ]]; then
    if [[ -L "$dest" || "$FORCE" -eq 1 ]]; then
      rm -rf "$dest"
    else
      echo "skip $dest (exists; pass --force to replace)" >&2
      return
    fi
  fi
  if [[ "$MODE" == "copy" ]]; then
    cp -R "$src" "$dest"
  else
    ln -s "$src" "$dest"
  fi
  echo "installed $name → $dest"
}

for dir in "${DIRS[@]}"; do
  for skill in "$ROOT"/skills/*/; do
    install_one "${skill%/}" "$dir"
  done
done
