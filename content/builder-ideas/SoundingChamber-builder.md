---
title: SoundingChamber
type: builder-idea
tags: [builder-idea]
---

# Abstract
A puzzle game about *prophecy lawyering via historical sound change* — prophecies bind to sounds, so you apply real linguistic rules (`e → i / _r`) to drift a whole language until *bear* becomes *beer*. It began as a hand-off: Panda asked Fable 5.0 to come up with a unique "game-jam" style game based on a high concept of its choosing; the AI pitch was interesting enough to promote to a project, and the agent built outward from there.

# Agentic Systems
Claude was the implementer, not an advisor. It stood up the agent-driven scaffold, built a zero-dependency TTS package (`sc-tts`) with three voice backends, and crunched the linguistics — two **parallel Opus subagents** authored a 181-rule sound-change database (~6,750 lines of JSON), with a third doing a restoration pass. `CLAUDE.md` is a literal operating manual written *for the agent*, with rules passed verbatim into subagent prompts.

# Human's role
Panda directs and reviews rather than codes: handing off source files, making scoping calls (deselected the SLM lane, chose the Piper neural voice), spotting bugs by ear (the *door* no-op under vowel-fronting), and verifying every change in live preview. A more active role than in [[builder-ideas/DemonBluffAi-Redux-builder|DemonBluffAi-Redux]], where Panda had the agent make judgements based on research.

# Why Agentic
Beyond initial ideation — which was to see the power of Fable 5.0 — Panda is not a linguist and could not design a game that has 181 rules of sound changes without some good resources. Add to it that the sound changes need to be transformed in ways that are not intuitive — IPA to Piper's syntax — and the workload would be outside Panda's expertise and require a subject-matter expert.

# Technology and Methods
- Vanilla JS/HTML/CSS prototypes; JSON data; Python dev server. Final target: **Godot** (web-export, not yet begun).
- **TTS backends**: eSpeak-NG-WASM (IPA phonemizer), Piper neural VITS (`onnxruntime-web`), Web Speech.
- **Subject**: historical linguistics — feeding/bleeding orders, chain shifts, conditioned sound change; the open "un-modernize words" problem (reversing a merger is lossy).
- **Pattern**: tiered read-before-code docs with strict sync discipline; parallel context-isolated subagents for data authoring.
