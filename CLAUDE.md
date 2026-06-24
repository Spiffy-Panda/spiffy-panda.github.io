# CLAUDE.md

## What this repo is

This is the **GitHub Pages root** for the `Spiffy-Panda` GitHub organization.
The live site is served from: `https://spiffy-panda.github.io`

GitHub Pages serves the `pages` branch (built artifact). `main` holds source content.

## Stack

[Quartz v4](https://quartz.jzhao.xyz/) — static site generator that consumes Obsidian-flavored markdown with `[[wiki-links]]`, backlinks, and graph view. Same setup pattern as the HCDE-561 / HCDE-564 journal repos.

- `content/` — site source markdown (Obsidian vault)
- `content/assets/` — images referenced by notes
- `quartz/` — Quartz framework source (vendored, v4.5.2)
- `quartz.config.ts` — site config (title, theme, plugins)
- `quartz.layout.ts` — page layout components
- `.github/workflows/publish.yml` — CI build → push `public/` to `pages` branch
- `.claude/launch.json` — `quartz` config that runs `build --serve` for preview (port 9249)

## Content conventions

Wiki-link resolution is set to `shortest` in `quartz.config.ts`, so `[[IK]]` resolves to `content/personal_projects/IK.md` automatically. Alias syntax is Obsidian-style: `[[target|display text]]` (target first, alias second — opposite of Dendron).

Image attribute extensions like Dendron's `{width: 30%, float: right}` are not supported; use HTML `<img>` tags for styled images. Plain `![](path)` works as normal.

## Local preview

```
npm ci
npm run serve
```

…or use the `quartz` config in `.claude/launch.json`.
