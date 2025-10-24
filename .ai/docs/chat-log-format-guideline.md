# ForgeMind Chat Log Format Guidelines

**Version**: 1.0
**Date**: 2025-10-24
**Purpose**: Standard format for all ForgeMind facilitator agent conversation logs
**Location**: `.ai/docs/chat-log-format-guideline.md`

---

## 📋 Overview

All ForgeMind conversation logs must follow this standardized format to ensure consistency, completeness, and searchability. The format captures the full conversation flow between Boss and Facilitator Agent, including analysis, questions, responses, and outcomes.

**Reference Template**: `.ai/templates/chat-log-template.md`
**Example Logs**: `.dev/ask/2025-10-23-*.md`

---

## 📝 Required Structure

### 1. Title
```
# ForgeMind Facilitator Agent Conversation Log
```
- Always use this exact title
- No variations allowed

### 2. Metadata Block
```
**Date**: YYYY-MM-DD
**Session**: Brief descriptive title (3-7 words)
**Context**: ForgeMind version, Phase, current status
**Role**: Facilitator Agent (Boss Mode Core)
**Goal**: Primary objective of the session (1-2 sentences)
```
- Date: When the conversation occurred
- Session: Concise title describing the main topic
- Context: Current project state and phase
- Role: Always "Facilitator Agent (Boss Mode Core)"
- Goal: What was accomplished or attempted

### 3. Initial Task Section
```
## Initial Task

**User**: [Exact user input that started the session]

[Additional context provided by user]
```
- Capture the user's initial request verbatim
- Include any context or instructions provided

### 4. Facilitator Agent Analysis Section
```
## Facilitator Agent Analysis

**Facilitator Agent**: [My analysis, planning, or response to initial task]

[Subsections as needed:
- Summary of understanding
- Areas needing clarification
- Planned approach
- etc.]
```
- Document my thinking process
- Show analysis of the user's request
- Include planning and preparation

### 5. Conversation Flow Sections

For each clarification question/response cycle:

```
## Clarification Question N

**Facilitator Agent**: [The question and options]

**Options:**
- A) [Option 1]
- B) [Option 2]
- etc.

**Why this clarification matters:** [Explanation]

---

## User Response N

**User**: [Exact user response]
```

- Number each question/response pair sequentially
- Include full question text, options, and rationale
- Capture user responses verbatim

### 6. Final Summary Section
```
## Final Summary

**Facilitator Agent**: [Summary of outcomes]

[Key achievements, decisions made, clarity improvements, etc.]
```
- Summarize what was accomplished
- Document key decisions and outcomes
- Note clarity level changes

### 7. Session Metadata Section
```
## Session Metadata

- **Duration**: ~X minutes
- **Questions Asked**: N
- **Clarity Increase**: X% → Y% (+Z%)
- **Key Insights Gained**: [List]
- **Next Steps**: [What comes next]
```
- Quantitative session metrics
- Qualitative outcomes
- Forward-looking next steps

---

## ✍️ Writing Guidelines

### Language & Tone
- **Professional**: Business-appropriate language
- **Objective**: Report facts, not opinions
- **Complete**: Include all relevant details
- **Concise**: Avoid unnecessary verbosity

### Content Standards
- **Verbatim Capture**: User inputs and responses exactly as stated
- **Complete Context**: Include all options, explanations, rationales
- **Structured Analysis**: Break down complex analysis into clear subsections
- **Outcome Focus**: Emphasize what was achieved and decided

### Formatting Standards
- **Markdown**: Use proper markdown syntax
- **Headers**: Use # ## ### for section hierarchy
- **Bold**: Use **bold** for labels and emphasis
- **Code Blocks**: Use `backticks` for commands, paths, options
- **Lists**: Use - for unordered, 1. 2. 3. for ordered

---

## 🔍 Quality Checklist

Before saving a chat log, verify:

- [ ] Title is exactly "ForgeMind Facilitator Agent Conversation Log"
- [ ] All metadata fields are complete and accurate
- [ ] Initial Task captures user's exact request
- [ ] Facilitator Agent Analysis shows clear thinking process
- [ ] All question/response cycles are documented
- [ ] Final Summary captures key outcomes
- [ ] Session Metadata includes quantitative metrics
- [ ] No personal opinions or external commentary
- [ ] All user inputs are verbatim
- [ ] Formatting is consistent with markdown standards

---

## 📚 Examples

### Good Question Format
```
## Clarification Question 2

**Facilitator Agent**: ## Clarification Question

**Question 2: What are the top 3 specific pain points ForgeMind aims to solve?**

**Options:**
- A) Time-to-market delays for new features
- B) High development costs for small teams
- C) Lack of technical expertise in business teams
- D) Difficulties maintaining and refactoring legacy code
- E) Communication gaps between business and development
- F) Quality assurance and bug management
- G) Other (please specify)

**Why this clarification matters:** Understanding the core pain points will help prioritize which features to implement first and ensure ForgeMind addresses real market needs. This will also guide the development of success metrics and help validate whether the system is solving the right problems for your target users.
```

### Good Response Format
```
## User Response 2

**User**: 1. idea模糊, requirements模糊又不足
2. 欠缺domain expert
3. AI generate code欠缺規則, 會無序生成code, 原因是AI在沒有足夠了解下就立即去生成code, 也沒有coding的規則
4. 管理系統的knowledge 變更, idea 變更, 其他(specifications, requirements, tech stack, etc.)變更, 都很煩瑣, 也很管理困難
5. 過早決定, 令軟件變得變難以變更
6. ai generate code 時, 會有content 所限, 會有幻覺等問題, 很難掌控程式碼的品質與風格
```

---

## 🔗 Related Files

- **Template**: `.ai/templates/chat-log-template.md`
- **Existing Logs**: `.dev/ask/2025-10-23-*.md`
- **Facilitator Command**: See save chat command in facilitator-agent.md

---

## 📝 Update History

- **v1.0** (2025-10-24): Initial guideline based on established format from 2025-10-23-first-facilitator-conversation.md

---

**This guideline ensures all ForgeMind conversations are documented consistently and professionally!** 🎯