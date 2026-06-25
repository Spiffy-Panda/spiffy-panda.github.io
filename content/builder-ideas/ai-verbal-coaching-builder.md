---
title: ai-verbal-coaching
type: builder-idea
tags: [builder-idea]
---

# Abstract
"Voice Coach" is a local, on-device tool for rehearsing PhD interview answers out loud. Panda holds a push-to-talk button, speaks, and a local Whisper instance transcribes — keeping the ums and false starts that most tools scrub. It began as a way to practice a research pitch and turned into reference code for working with speech in an agentic loop.

# Agentic Systems
The twist: Claude isn't just the author, it's the runtime client. The project's core is a custom MCP server whose tools (`request_user_audio`, `speak_to_user`) Claude *calls* mid-conversation — it poses a mock question, the call blocks until Panda speaks, the transcript returns, and Claude coaches on filler words, hedging, and answer shape. Claude also built and debugged the whole stack across staged sessions.

# Human's role
Director and target audience at once. Panda set the staged plan and acted as the validation gate (no skipping ahead), while the tool exists to coach Panda's own pitch — so `CLAUDE.md` encodes the real alignment/interpretability subject matter the feedback draws on.

# Why Agentic
Current STT-to-TTS and even Audio-to-Audio LLMs are limited in how well they can perceive disfluency, which is what Panda was most concerned with.

# Technology and Methods
- C# / ASP.NET (.NET 9), `ModelContextProtocol.AspNetCore`, Streamable-HTTP MCP
- Python FastAPI + faster-whisper (CUDA, `int8_float32` tuned for a Pascal GPU)
- Vanilla HTML/JS push-to-talk recorder; Windows SAPI TTS (extracted to a shared library)
- Subject matter: speech disfluency, interview coaching, AI-alignment pitch framing
