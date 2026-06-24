# Spiffy Panda — GitHub Pages Portfolio

Source for [spiffy-panda.github.io](https://spiffy-panda.github.io), built with [Quartz v4](https://quartz.jzhao.xyz/).

## Develop locally

```bash
npm ci
npm run serve
```

Then open the URL Quartz prints (default `http://localhost:8080`).

## Deploy

Push to `main`. The workflow at `.github/workflows/publish.yml` builds with Quartz and pushes `public/` to the `pages` branch, which GitHub Pages serves.

## Layout

- `content/` — site source (Obsidian-flavored markdown vault)
- `quartz/`, `quartz.config.ts`, `quartz.layout.ts` — Quartz framework + config
