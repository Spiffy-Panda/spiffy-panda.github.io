---
title: DemonBluffAi-Redux
type: builder-idea
tags: [builder-idea]
---

# Abstract
A web-based course that teaches modern computer-vision practice by building one constrained system end to end: reading *Demon Bluff* game state from video frames alone and serving it over a REST API. The course is the product; the working CV pipeline is the worked example it is built around.

# Agentic Systems
Claude (Opus 4.8) is the engineer-of-record: across a 24-commit, two-day burst it wrote the CV code, ran the experiments, diagnosed an embedding collapse as domain shift (citing ICLR papers), fine-tuned the model on a local GPU, and authored the lesson modules — every commit co-signed.

# Human's role
Panda directs the firm. As the intended student of the final lesson plan, they follow the agent's recommendations. Most choices they made are to prioritize and authorize. Normal caveats about a LLM trying to understand a video game apply. Even provided the whole wiki and >1:30 hours of footage, the agent still does not know all the rules.

# Why Agentic
Load-bearing and meta. The agent did the build, but the repo is also a teaching artifact about disciplined agent collaboration: a research-before-deciding gate, honest negative results logged, and a CLAUDE.md rule-set that governs how the agent works.

# Technology and Methods
- Python CV stack: OpenCV + NumPy (classical), PyTorch (dev train/export), ONNX Runtime (CPU inference)
- FastAPI + Pydantic v2 REST; pytest (110 tests)
- MobileNetV3-Small fine-tune: Proxy-Anchor metric loss, LP-FT, cosine-margin abstention
- Subject: social-deduction game board reading, resolution-agnostic geometry
