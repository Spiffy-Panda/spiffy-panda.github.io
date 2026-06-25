---
title: AI-BT-Gym
type: builder-idea
tags: [builder-idea]
---

# Abstract
An evolutionary "gym" in Godot (C#) where LLM-written behavior trees fight in a 2D chain-fist game and improve across generations. It started as a question: can an LLM act as the mutation-and-selection engine of a genetic loop, not just a code generator? In researching that, a workflow for building game-design tools and data interfaces emerged.

# Agentic Systems
Claude plays two distinct roles. Inside the loop it is the evolution operator: a working `tools/scouting_report.py` feeds a fighter's BT (as JSON) plus battle-log metrics to the Claude API, which writes a scouting report and drives Improve / Mutate / Crossbreed prompts that return the next generation's trees. Outside the loop, Claude was the builder — it wrote the simulation, tournament server, and dashboard, and audited multiple generations of match data to surface balance bugs.

# Human's role
Panda was the firm director and analyst — designing the season/evolution structure, running the headless tournament server, and judging whether emergent strategies (and a stubborn map-balance problem) were actually meaningful. A note for any video game, LLMs have trouble understanding fun and exciting. They can understand statistics, so framing the problem is a skill the Agentic Practitioner needs in spades if they are going to pursue gaming tooling.

# Why Agentic
The agent is load-bearing twice over: the BT-evolution loop only works because an LLM can read fight telemetry and reason out a tactical fix, and the whole codebase was agent-built. The collaboration *is* the experiment.

# Technology and Methods
- Godot 4.6.1 (mono), C# / .NET, headless deterministic sim
- Anthropic API for in-loop BT generation/mutation
- Behavior trees serialized as JSON; Elo tournaments; replay system
- Python analysis toolkit + web dashboard on :8585
