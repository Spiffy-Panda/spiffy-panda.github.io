---
title: OstranautDataExplorer
type: builder-idea
tags: [builder-idea]
---

# Abstract
An IDE-style "Find Usages" browser for the game *Ostranauts'* data tree, where everything is a `CondOwner` referencing other objects by string name across ~70 folders with no foreign keys or tooling. It started as a personal attempt to understand the game's data well enough to answer modders' questions and ship data-only mods.

# Agentic Systems
Claude is the primary builder and operator, not just an advisor. It wrote the C# parser, the vanilla-JS Cytoscape site, and the schema overlays; crunched the data (76k+ reference edges, decompiled-C# cross-checks); authored modder-facing handoff guides; and even ran click-only usability audits on the shipped site. `CLAUDE.md` is a literal operating manual *for the agent*, with rules written to be passed verbatim into subagent prompts.

# Human's role
Panda directs and edits rather than codes: setting priorities, making the judgment calls a rule file can't (fair-use substantiality, who counts as a "newcomer"), and launching the game to verify behavioral ground truth the decompiled code alone can't settle. Normal caveats of LLM working on games apply. This one in particular due to its unique nature. The agents tend to assume a more Elite, EVE, or X4: Foundations style game.

# Why Agentic
Load-bearing both ways. The agent turned questions Panda couldn't otherwise answer in time into takeable tasks, and the collaboration *itself* is the object of study (an HCDE561 case write-up lives in-repo). Without the agent there is no project at this scope given the size and variety of data files.

# Technology and Methods
- C# (`netstandard2.1` lib + `net8.0` CLI), vanilla JS + Cytoscape.js, `make`/`build.bat`, Python utilities, dnSpy decomp.
- **Extractable patterns**: a reusable repo-bootstrap "initialization skill"; the README (human) + ALL-CAPS-spec (agent) deliverable-folder pairing; a doc-tier sync discipline (`CodeDocs/` read-before-code); claim-tagged handoff pages with confidence tables; the "pass every convention into subagent prompts" rule.
