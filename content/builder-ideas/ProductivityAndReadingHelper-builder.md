---
title: ProductivityAndReadingHelper
type: builder-idea
tags: [builder-idea]
---

# Abstract
A local, no-cloud toolkit for studying dense academic papers: PDF → markdown working copy → skim-highlight overlay + two-voice podcast script → synthesized audio. It grew out of Panda's own need to get through alignment/interpretability papers in a dyslexia-friendly way.

# Agentic Systems
Claude is the orchestrator, not just the coder. A C# server (`paper-coach`) exposes the pipeline as **MCP tools** that Claude calls to navigate, extract, and render; custom **Skills** wrap each step. Notably, a Skill makes Claude the *gatekeeper* — it reads a generated script and blocks rendering if the dialogue falls into a gendered learner/expert pattern.

# Human's role
Firm director and target audience. Panda drives from chat, reviews each intermediate artifact, and hands sessions off overnight under an explicit rules charter — then ratifies the agent's deferred decisions in the morning ("Panda has the keys").

# Why Agentic
The agent was load-bearing *and* the subject: Claude ran autonomously overnight (even with parallel sessions), governed by a written `CLAUDE.local.md` charter of unattended-run rules — what it may install, fetch, commit, or must defer. The collaboration model itself is part of the build.

# Technology and Methods
- C#/.NET 9 MCP host (System.Speech + WinRT neural TTS), shared with sibling project [[builder-ideas/ai-verbal-coaching-builder|ai-verbal-coaching]]
- Python FastAPI sidecar (`pymupdf4llm`) for PDF→markdown
- Vanilla HTML/CSS/JS reader; agent-authored DEV-LOG written for future sessions
- Subject matter: AI alignment, mechanistic interpretability, activation steering
