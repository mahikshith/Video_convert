1. Build a Project Operating System
Create this structure at the root of the repository:
/docs

PRODUCT.md
PRD.md
ARCHITECTURE.md
DECISIONS.md
ROADMAP.md

/tasks

BACKLOG.md
SPRINT_01.md
SPRINT_02.md

/context

CURRENT_STATE.md
NEXT_STEPS.md
KNOWN_ISSUES.md

/claude

UI_RULES.md
ENGINEERING_RULES.md
CODE_STANDARDS.md
This becomes Claude's memory.
________________________________________
2. The Most Important File
Create:
/context/CURRENT_STATE.md
Claude updates this after every session.
Example:
# Current State

## Completed

✅ Flutter project created

✅ RevenueCat integrated

✅ Home Screen completed

✅ File picker implemented

✅ FFmpeg wrapper service completed

## In Progress

- Compression presets

## Not Started

- GIF creation
- Audio extraction

## Last Commit

a84b31c

## Current Branch

feature/compression

## Blockers

None
Every new session:
Read CURRENT_STATE.md first
instead of
Read 50,000 lines of code
This alone can reduce token usage by 70-90%.
________________________________________
3. Create an Architecture File
ARCHITECTURE.md
Example:
# Architecture

Flutter

State Management:
Riverpod

Storage:
Hive

Analytics:
Firebase

Purchases:
RevenueCat

Video Processing:
FFmpegKit

Pattern:
Feature First
Claude never has to infer architecture.
________________________________________
4. Create UI Rules
claude/UI_RULES.md
Example:
Never use glassmorphism

Use Material 3

8pt spacing

Primary CTA only

No bottom navigation

Maximum 3 actions per screen

Dark mode required
Now Claude doesn't redesign the app every session.
________________________________________
5. Create Engineering Rules
claude/ENGINEERING_RULES.md
Example:
Use Riverpod

No Provider

No Bloc

No GetX

Feature-first structure

Repository pattern

No business logic in widgets

All services injectable

Unit tests required
Claude becomes consistent.
________________________________________
6. Decision Log
Most teams skip this.
Create:
DECISIONS.md
Example:
# Decisions

2026-08-08

Chosen:
One-time purchase

Rejected:
Monthly subscription

Reason:
Utility category users hate subscriptions

---

2026-08-08

Chosen:
FFmpegKit

Rejected:
CloudConvert API

Reason:
Zero infrastructure cost
Future Claude sessions stop reopening old debates.
________________________________________
7. Task Driven Development
Instead of:
Build the app
Use:
Read:

PRODUCT.md
ARCHITECTURE.md
CURRENT_STATE.md

Execute task:

Implement compression preset selector.
Token consumption becomes tiny.
________________________________________
8. The BEST Claude Workflow
At the start of every session:
Read only:

ARCHITECTURE.md
CURRENT_STATE.md
NEXT_STEPS.md
ENGINEERING_RULES.md

Do NOT scan the repository.

Wait for task.
This is exactly how large teams use Claude Code.
________________________________________
9. Repository Memory Compression
Create:
CURRENT_STATE.md
and keep it under:
500 lines maximum
Never let it become a novel.
Think:
Executive summary
not
Complete history
________________________________________
10. Skills Claude Actually Needs
For this project specifically:
Critical
Flutter
Dart

Riverpod

FFmpeg

RevenueCat

Firebase Analytics

Android Storage APIs

iOS File APIs

Share Extensions

Background Processing

Material 3
Helpful
CI/CD

Fastlane

GitHub Actions

App Store Connect

Play Console
Not Needed
AI/LLMs

Vector Databases

RAG

LangChain

OpenAI APIs

OCR

Machine Learning
None of these help the MVP.
________________________________________
What I Would Do If I Were Building This
Before writing a single line of code:
1. Create repository

2. Create all documentation files

3. Create CURRENT_STATE.md

4. Create DECISIONS.md

5. Create UI_RULES.md

6. Create ENGINEERING_RULES.md

7. Create ARCHITECTURE.md

8. Commit everything

9. Then start coding
This will save you far more time and tokens than any Claude skill pack, MCP server, or prompt engineering trick.
The biggest risk to this project is not coding difficulty.
It's Claude forgetting context and rebuilding the same thing three different ways across multiple sessions.
The documentation system above eliminates that risk almost completely.

