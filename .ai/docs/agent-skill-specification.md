# ForgeMind Agent Skill Specification

**Version**: 1.0  
**Last Updated**: 2025-10-27  
**Location**: `.ai/docs/agent-skill-specification.md`  
**Purpose**: Complete specification for implementing ForgeMind's 68 agents as Anthropic Agent Skills

---

## 📚 Table of Contents

1. [Overview](#overview)
2. [Agent Skill Structure](#agent-skill-structure)
3. [Required Components](#required-components)
4. [YAML Frontmatter Specification](#yaml-frontmatter-specification)
5. [SKILL.md Content Template](#skillmd-content-template)
6. [Supporting Files](#supporting-files)
7. [Progressive Disclosure Strategy](#progressive-disclosure-strategy)
8. [Implementation Examples](#implementation-examples)
9. [Validation Checklist](#validation-checklist)
10. [68 Agents Conversion Guide](#68-agents-conversion-guide)

---

## 🎯 Overview

### What is an Agent Skill?

An Agent Skill is a **filesystem-based package** containing:

- **Instructions** (SKILL.md with YAML frontmatter)
- **Supporting documentation** (additional .md files)
- **Executable scripts** (optional Python/bash)
- **Resources** (templates, schemas, examples)

### Why Use Agent Skills for ForgeMind?

| Benefit                    | Description                                    |
| -------------------------- | ---------------------------------------------- |
| **Progressive Disclosure** | Load only what's needed, when needed           |
| **Composability**          | Skills automatically stack together            |
| **Portability**            | Same format across Claude Code, API, claude.ai |
| **Efficiency**             | Minimal context consumption                    |
| **Version Control**        | Easy to track and update                       |

### ForgeMind-Specific Requirements

All ForgeMind Agent Skills MUST:

1. ✅ Follow **Plan-Ask-Execute** protocol
2. ✅ Support **Context Engineering** (load/unload)
3. ✅ Integrate with **current-context.json**
4. ✅ Update **agent memory** (`.forgemind/memory/`)
5. ✅ Use **Ubiquitous Language** terms
6. ✅ Support **non-linear backtracking**

---

## 📂 Agent Skill Structure

### Standard Directory Layout

```
~/.claude/skills/forgemind-{agent-name}/
│
├── SKILL.md                       ← REQUIRED: Main skill file
├── CONTEXT.md                     ← Context Engineering rules
├── COMMANDS.md                    ← Available commands (if applicable)
├── PLAN_ASK_EXECUTE.md           ← PAE protocol template
│
├── resources/                     ← Supporting documentation
│   ├── templates/
│   │   └── output-template.md
│   ├── examples/
│   │   └── example-workflow.md
│   └── schemas/
│       └── data-model.json
│
└── scripts/                       ← Executable utilities
    ├── validate.py
    ├── analyze.py
    └── generate.py
```

### File Naming Conventions

| File Type           | Naming Pattern            | Example                    |
| ------------------- | ------------------------- | -------------------------- |
| **Main skill**      | `SKILL.md`                | `SKILL.md`                 |
| **Supporting docs** | `UPPERCASE.md`            | `COMMANDS.md`, `LAYERS.md` |
| **Resources**       | `lowercase-hyphen.md`     | `workflow-template.md`     |
| **Scripts**         | `lowercase_underscore.py` | `validate_module.py`       |

---

## 📋 Required Components

### 1. YAML Frontmatter (Mandatory)

**Location**: Top of SKILL.md

**Required fields**:

```yaml
---
name: forgemind-{agent-id}
description: {what-it-does} {when-to-use}
---
```

**ForgeMind-specific fields** (optional but recommended):

```yaml
---
name: forgemind-facilitator
description: Primary interface for Boss in ForgeMind system. Guides through 6-layer structure, tracks clarity, enforces Plan-Ask-Execute. Use when Boss starts development, needs status, or coordinates agents.

# ForgeMind extensions
agent_id: L1-EXEC-001
agent_level: 1
agent_category: executive
priority: P0
version: 2.0
requires_context: true
integrates_with: [ba-agent, architect-agent, domain-expert]
---
```

### 2. Quick Start Section (Mandatory)

**Purpose**: Get users productive in <30 seconds

**Format**:

````markdown
## Quick start

**Primary command:**

```bash
{primary-command}
```
````

**Common workflow:**

```bash
{step-1}
{step-2}
{step-3}
```

**Expected output:**
{description-of-output}

````

### 3. Core Instructions (Mandatory)

**Purpose**: Main operational guidance

**Format**:
```markdown
## Core responsibilities

**{Responsibility 1 name}**
{Description}
{How to do it}

**{Responsibility 2 name}**
{Description}
{How to do it}

For detailed procedures, see [PROCEDURES.md](PROCEDURES.md)
````

### 4. Plan-Ask-Execute Integration (Mandatory for all agents)

**Format**:

````markdown
## Plan-Ask-Execute protocol

**CRITICAL**: Every action follows 3 steps:

1. **PLAN** - Create detailed plan
2. **ASK** - Request explicit approval
3. **EXECUTE** - Only after "Yes"

**Plan template:**

```markdown
📋 My Plan:

- [Specific actions]
- [Files to modify]
- [Estimated impact]

⚠️ Proceed? (Yes/No/Modify)
```
````

For full protocol, see [PLAN_ASK_EXECUTE.md](PLAN_ASK_EXECUTE.md)

````

---

## 📐 YAML Frontmatter Specification

### Field Definitions

| Field | Type | Max Length | Required | Description |
|-------|------|-----------|----------|-------------|
| `name` | string | 64 chars | ✅ Yes | Lowercase, hyphens only. Pattern: `forgemind-{agent-name}` |
| `description` | string | 1024 chars | ✅ Yes | What + When to use. First 200 chars are most critical. |
| `agent_id` | string | 16 chars | ⚠️ ForgeMind | Format: `L{level}-{category}-{number}` (e.g., `L2-DEPT-001`) |
| `agent_level` | integer | - | ⚠️ ForgeMind | 1=Executive, 2=Department, 3=Sub-agent |
| `agent_category` | string | 32 chars | ⚠️ ForgeMind | executive/department/subagent |
| `priority` | string | 4 chars | ⚠️ ForgeMind | P0/P1/P2/P3 |
| `version` | string | 16 chars | ⚠️ ForgeMind | Semantic versioning (e.g., `2.0.1`) |
| `requires_context` | boolean | - | ⚠️ ForgeMind | Does agent need context management? |
| `integrates_with` | array | - | ⚠️ ForgeMind | List of other agent skill names |

### Description Writing Guidelines

**Format**: `{What it does}. {When to use}.`

**Good examples**:
```yaml
description: Analyzes MODULE dependencies and creates dependency graphs. Use when defining system architecture, checking for circular dependencies, or preparing for DOMAIN modeling.

description: Primary interface for Boss. Guides through 6 layers, tracks clarity, enforces Plan-Ask-Execute. Use when Boss starts projects, needs status updates, or coordinates other agents.

description: Validates DDD aggregate boundaries and invariants. Use when modeling DOMAIN layer, checking aggregate design, or ensuring domain model consistency.
````

**Bad examples**:

```yaml
description: Helps with modules  # ❌ Too vague

description: This agent is responsible for analyzing the module structure and creating dependency graphs and checking for issues  # ❌ Too long, no "when to use"

description: BA Agent  # ❌ No description of function
```

### Name Constraints

**Pattern**: `forgemind-{descriptive-name}`

**Rules**:

- Lowercase only
- Hyphens for word separation
- No spaces, underscores, or special characters
- Cannot contain "anthropic" or "claude"
- Max 64 characters

**Good examples**:

```yaml
name: forgemind-facilitator
name: forgemind-ba-agent
name: forgemind-domain-expert
name: forgemind-impact-analyzer
```

**Bad examples**:

```yaml
name: ForgeMind-Facilitator  # ❌ Uppercase
name: forgemind_facilitator  # ❌ Underscore
name: facilitator            # ❌ Missing prefix
name: forgemind-L1-EXEC-001  # ❌ Technical ID in name
```

---

## 📝 SKILL.md Content Template

### Complete Template

````markdown
---
name: forgemind-{agent-name}
description: {what-it-does}. {when-to-use}.
agent_id: {L#-CAT-###}
agent_level: {1|2|3}
agent_category: {executive|department|subagent}
priority: {P0|P1|P2|P3}
version: {semantic-version}
requires_context: {true|false}
integrates_with: [{other-agents}]
---

# {Agent Display Name}

## Quick start

**Primary command:**

```bash
{primary-command}
```
````

**Common workflow:**

```bash
{command-1}
{command-2}
{command-3}
```

**Expected output:**
{description}

## Core responsibilities

**{Responsibility 1}**
{How to execute}

**{Responsibility 2}**
{How to execute}

**{Responsibility 3}**
{How to execute}

For detailed procedures, see [PROCEDURES.md](PROCEDURES.md)

## Plan-Ask-Execute protocol

**CRITICAL**: Every action follows 3 steps:

### Step 1: PLAN

Create detailed plan showing:

- Specific actions
- Files to modify
- Estimated impact

### Step 2: ASK

Request explicit approval:

```markdown
⚠️ Proceed with this plan? (Yes/No/Modify)
```

### Step 3: EXECUTE

Only after receiving "Yes"

For full protocol, see [PLAN_ASK_EXECUTE.md](PLAN_ASK_EXECUTE.md)

## Context management

**Artifacts this agent loads:**

- {artifact-1}
- {artifact-2}

**Loading strategy:**

- Essential (Layer 1): {always-loaded}
- Task-specific (Layer 2): {on-demand}
- Historical (Layer 3): {when-requested}

For context engineering details, see [CONTEXT.md](CONTEXT.md)

## Integration points

**Calls these agents:**

- {agent-1}: {when-and-why}
- {agent-2}: {when-and-why}

**Called by these agents:**

- {agent-3}: {when-and-why}

For full integration map, see [INTEGRATION.md](INTEGRATION.md)

## Commands (if applicable)

**{command-1}** - {description}
**{command-2}** - {description}
**{command-3}** - {description}

For complete command reference, see [COMMANDS.md](COMMANDS.md)

## Examples

**Example 1: {Common scenario}**

```bash
{command-sequence}
```

**Example 2: {Another scenario}**

```bash
{command-sequence}
```

For more examples, see [EXAMPLES.md](EXAMPLES.md)

## Success criteria

This agent is successful when:

- ✅ {criterion-1}
- ✅ {criterion-2}
- ✅ {criterion-3}

## Limitations

This agent cannot:

- ❌ {limitation-1}
- ❌ {limitation-2}

## Related skills

- **{related-skill-1}**: {relationship}
- **{related-skill-2}**: {relationship}

````

---

## 📚 Supporting Files

### CONTEXT.md (Recommended for all agents)

**Purpose**: Context Engineering rules specific to this agent

```markdown
# Context Management for {Agent Name}

## What this agent loads

### Layer 1 (Essential) - Always loaded
- Current project state
- Agent-specific config
- Recent decisions

### Layer 2 (Task-specific) - Load on-demand
- Relevant artifacts (IDEA/MODULE/DOMAIN)
- Traceability links
- Related files

### Layer 3 (Historical) - Load when requested
- Past sessions
- Historical decisions
- Archived versions

## Loading triggers

**This agent loads context when:**
1. {trigger-1}
2. {trigger-2}
3. {trigger-3}

## Context update rules

**Update current-context.json when:**
1. {update-scenario-1}
2. {update-scenario-2}

## Memory management

**Update `.forgemind/memory/{agent-name}-notes.md` after:**
- {event-1}
- {event-2}
- {event-3}
````

### COMMANDS.md (For agents with multiple commands)

````markdown
# {Agent Name} Commands

## Command 1: {command-name}

**Usage:**

```bash
{command-syntax}
```
````

**Description:**
{what-it-does}

**Example:**

```bash
{example-usage}
```

**Output:**
{expected-output}

## Command 2: {command-name}

[Same structure]

## Command reference table

| Command | Purpose   | Priority   |
| ------- | --------- | ---------- |
| {cmd-1} | {purpose} | {P0/P1/P2} |
| {cmd-2} | {purpose} | {P0/P1/P2} |

````

### PLAN_ASK_EXECUTE.md (Template for all agents)

```markdown
# Plan-Ask-Execute Protocol for {Agent Name}

## Overview

Every action this agent takes MUST follow the 3-step protocol.

## Step 1: PLAN

**Template:**
```markdown
📋 **My Plan:**

**What I will do:**
1. {action-1}
2. {action-2}
3. {action-3}

**What I will NOT do:**
- {non-action-1}
- {non-action-2}

**Files I will modify:**
- {file-1}
- {file-2}

**Estimated impact:**
- {impact-metric-1}: {before} → {after}
- Files affected: {count}
- Time required: {estimate}

**Context check:**
- Required artifacts loaded: {Yes/No}
- Context window: {usage}%
````

## Step 2: ASK

**Template:**

```markdown
⚠️ **Proceed with this plan?**

Options:

- **Yes** - Execute as planned
- **No** - Cancel
- **Modify** - Tell me what to change

**Your decision?**
```

**Wait for explicit approval. Do NOT proceed on silence.**

## Step 3: EXECUTE

**Template:**

```markdown
✅ **Executing plan...**

[Show progress]

✅ **Complete!**

**Results:**

- {result-1}
- {result-2}

**Next suggested action:**
{suggestion}

⚠️ **Ready for next step?**
```

## Violations to avoid

❌ **Never execute without approval**
❌ **Never assume Boss intent**
❌ **Never skip showing the plan**
❌ **Never modify files without Boss knowledge**

````

---

## 📊 Progressive Disclosure Strategy

### Three-Level Loading

**Level 1: Metadata** (Always loaded - ~100 tokens)
```yaml
---
name: forgemind-ba-agent
description: Analyzes MODULE dependencies...
---
````

**Level 2: Instructions** (Loaded when triggered - <5k tokens)

```markdown
# BA Agent

## Quick start

[Essential instructions]

For detailed analysis procedures, see [ANALYSIS.md](ANALYSIS.md)
```

**Level 3: Resources** (Loaded as needed - effectively unlimited)

```
resources/
├── analysis-template.md
├── dependency-schema.json
└── examples/
```

### When to Split Content

**Keep in SKILL.md** (Level 2):

- Quick start (essential)
- Core responsibilities (high-level)
- Plan-Ask-Execute template
- Common commands
- Simple examples

**Move to separate files** (Level 3):

- Detailed procedures
- Complete command reference
- Extensive examples
- Templates and schemas
- Reference documentation

### File Reference Format

**In SKILL.md:**

```markdown
For detailed analysis procedures, see [ANALYSIS.md](ANALYSIS.md)

For all 25 commands, see [COMMANDS.md](COMMANDS.md)

For template usage, see [resources/templates/](resources/templates/)
```

**Agent will load these files only when needed:**

```bash
# Agent reads SKILL.md (Level 2)
# Boss asks for detailed procedures
# Agent then reads ANALYSIS.md (Level 3)
```

---

## 💡 Implementation Examples

### Example 1: Facilitator Agent (L1-EXEC-001)

**Directory structure:**

```
forgemind-facilitator/
├── SKILL.md
├── LAYERS.md              # 6-layer detailed documentation
├── COMMANDS.md            # 13 commands reference
├── PLAN_ASK_EXECUTE.md   # PAE protocol
├── CONTEXT.md            # Context engineering
└── scripts/
    ├── check_sync.py     # File sync validation
    ├── impact_analysis.py # 3-second impact analysis
    └── clarity_calc.py   # Clarity calculation
```

**SKILL.md** (excerpt):

````markdown
---
name: forgemind-facilitator
description: Primary interface for Boss in ForgeMind. Guides through 6-layer structure (IDEA→MODULE→DOMAIN→REQUIREMENT→SPEC→CODE), tracks clarity progression, enforces Plan-Ask-Execute protocol. Use when Boss starts development, needs status, or coordinates agents.
agent_id: L1-EXEC-001
agent_level: 1
agent_category: executive
priority: P0
version: 2.0
requires_context: true
integrates_with:
  [forgemind-ba-agent, forgemind-architect-agent, forgemind-domain-expert]
---

# ForgeMind Facilitator

## Quick start

**Boss's first command:**

```bash
facilitator status
```
````

**Starting a new project:**

```bash
facilitator clarify
```

## Core responsibilities

**Guide Boss through 6 layers**
Progress from IDEA (10% clarity) to CODE (95%+ clarity)

**Track clarity at each layer**
Visual progress bars, automatic calculation

**Enforce Plan-Ask-Execute**
Mandatory 3-step protocol for every action

For detailed layer information, see [LAYERS.md](LAYERS.md)

## Plan-Ask-Execute protocol

[See template above]

For full protocol documentation, see [PLAN_ASK_EXECUTE.md](PLAN_ASK_EXECUTE.md)

## Commands

**Essential commands:**

- `facilitator status` - Show project state
- `facilitator clarify` - Start Q&A session
- `facilitator update idea` - Modify IDEA

For all 13 commands, see [COMMANDS.md](COMMANDS.md)

## Context management

**Essential context (always loaded):**

- Current session info
- Current layer and clarity
- Last 3 Boss decisions

**Task-specific (on-demand):**

- Current IDEA/MODULE/DOMAIN files
- Traceability matrix

For context engineering details, see [CONTEXT.md](CONTEXT.md)

```

### Example 2: BA Agent (L2-DEPT-001)

**Directory structure:**
```

forgemind-ba-agent/
├── SKILL.md
├── MODULE_ANALYSIS.md # Detailed analysis procedures
├── DEPENDENCY_MAPPING.md # Dependency analysis guide
├── PLAN_ASK_EXECUTE.md
├── CONTEXT.md
└── scripts/
├── analyze_deps.py # Dependency analyzer
└── validate_modules.py # Module validator

````

**SKILL.md** (excerpt):
```markdown
---
name: forgemind-ba-agent
description: Analyzes MODULE dependencies and creates dependency graphs. Decomposes system into logical packages. Use when defining Layer 1 (MODULE) structure, checking for circular dependencies, or preparing for DOMAIN modeling.
agent_id: L2-DEPT-001
agent_level: 2
agent_category: department
priority: P1
version: 1.0
requires_context: true
integrates_with: [forgemind-architect-agent, forgemind-domain-expert]
---

# BA Agent

## Quick start

**Analyze MODULE dependencies:**
```bash
ba analyze modules
````

**Expected output:**

- MODULE list with dependencies
- Dependency graph
- Circular dependency warnings

## Core responsibilities

**MODULE decomposition**
Break IDEA into logical modules

**Dependency analysis**
Identify and visualize module relationships

**Circular dependency detection**
Find and recommend fixes for circular deps

For detailed analysis procedures, see [MODULE_ANALYSIS.md](MODULE_ANALYSIS.md)

## Plan-Ask-Execute protocol

[Standard PAE template]

## Integration points

**Called by:**

- Facilitator Agent - when Boss needs MODULE analysis

**Calls:**

- Architect Agent - for technical architecture review
- Domain Expert - to validate MODULE boundaries

## Examples

**Example: Analyze CRM system**

```bash
ba analyze modules IDEA-002
# Output: 4 modules identified
# - Customer Management
# - Sales Pipeline
# - Analytics
# - Reporting
```

For more examples, see [MODULE_ANALYSIS.md](MODULE_ANALYSIS.md)

```

### Example 3: Domain Expert Agent (L2-DEPT-004)

**Directory structure:**
```

forgemind-domain-expert/
├── SKILL.md
├── DDD_PATTERNS.md # DDD pattern library
├── AGGREGATE_DESIGN.md # Aggregate design guide
├── DOMAIN_EVENTS.md # Domain events catalog
├── PLAN_ASK_EXECUTE.md
├── CONTEXT.md
├── resources/
│ ├── templates/
│ │ └── aggregate-template.md
│ └── schemas/
│ └── domain-model-schema.json
└── scripts/
└── validate_aggregates.py

````

**SKILL.md** (excerpt):
```markdown
---
name: forgemind-domain-expert
description: Models DOMAIN layer using DDD patterns. Creates aggregates, value objects, domain events. Validates aggregate boundaries and invariants. Use when designing Layer 2 (DOMAIN), applying DDD patterns, or ensuring domain model consistency.
agent_id: L2-DEPT-004
agent_level: 2
agent_category: department
priority: P1
version: 1.0
requires_context: true
integrates_with: [forgemind-ba-agent, forgemind-requirements-engineer]
---

# Domain Expert Agent

## Quick start

**Create domain model:**
```bash
domain-expert model DOMAIN-001
````

**Validate aggregates:**

```bash
domain-expert validate aggregates
```

## Core responsibilities

**Apply DDD patterns**
Aggregates, Entities, Value Objects

**Design domain events**
Event-driven architecture patterns

**Validate invariants**
Ensure aggregate consistency rules

For DDD pattern details, see [DDD_PATTERNS.md](DDD_PATTERNS.md)

## Plan-Ask-Execute protocol

[Standard PAE template]

## Domain modeling workflow

1. Identify aggregates from MODULE boundaries
2. Define aggregate roots
3. Model entities and value objects
4. Design domain events
5. Validate invariants

For detailed workflow, see [AGGREGATE_DESIGN.md](AGGREGATE_DESIGN.md)

## Examples

**Example: Customer aggregate**

```bash
domain-expert model Customer
# Output:
# - Customer (Aggregate Root)
#   - CustomerId (Identity)
#   - CustomerName (Value Object)
#   - Email (Value Object)
# - Invariants:
#   - Email must be unique
#   - Name cannot be empty
```

For more examples and templates, see [resources/templates/](resources/templates/)

```

---

## ✅ Validation Checklist

### Pre-Implementation Checklist

Before creating an agent skill, verify:

- [ ] **Agent ID assigned** (L#-CAT-###)
- [ ] **Priority determined** (P0/P1/P2/P3)
- [ ] **Integration points identified** (which agents it calls/is called by)
- [ ] **Core responsibilities defined** (3-5 key responsibilities)
- [ ] **Commands listed** (if applicable)
- [ ] **Context requirements known** (what artifacts it needs)

### SKILL.md Checklist

- [ ] **YAML frontmatter complete**
  - [ ] `name` follows pattern `forgemind-{agent-name}`
  - [ ] `description` includes what + when (under 200 chars preferred)
  - [ ] ForgeMind fields present (`agent_id`, `priority`, etc.)
- [ ] **Quick start section** (get productive in <30 seconds)
- [ ] **Core responsibilities** (3-5 responsibilities, high-level)
- [ ] **Plan-Ask-Execute protocol** (mandatory 3-step template)
- [ ] **Context management** (loading strategy explained)
- [ ] **Integration points** (which agents it works with)
- [ ] **Examples** (at least 2 common scenarios)
- [ ] **Success criteria** (measurable outcomes)

### Progressive Disclosure Checklist

- [ ] **Level 1 (Metadata)** is concise (<100 tokens)
- [ ] **Level 2 (SKILL.md)** is under 5k tokens
- [ ] **Level 3 (Supporting files)** referenced but not loaded upfront
- [ ] **Links to supporting files** use `[TEXT](FILE.md)` format
- [ ] **Scripts** are in `scripts/` directory
- [ ] **Resources** are in `resources/` directory

### Quality Checklist

- [ ] **Follows Ubiquitous Language** (uses correct ForgeMind terms)
- [ ] **Plan-Ask-Execute enforced** (no action without approval)
- [ ] **Context-aware** (loads/unloads intelligently)
- [ ] **Integrates with memory** (updates agent notes)
- [ ] **Error handling defined** (what to do when things fail)
- [ ] **Examples are realistic** (based on actual ForgeMind workflows)

---

## 🔧 68 Agents Conversion Guide

### Conversion Process

**For each of the 68 agents:**

1. **Read current agent definition** from `agents-catalog.json`
2. **Create agent skill directory** `~/.claude/skills/forgemind-{agent-name}/`
3. **Generate SKILL.md** following template above
4. **Create supporting files** (CONTEXT.md, COMMANDS.md, etc.)
5. **Add scripts** (if agent performs specific computations)
6. **Test skill** in isolated environment
7. **Validate** against checklist
8. **Document integration** with other agents

### Batch Conversion Strategy

**Phase 1: P0 Agents** (6 agents - Critical)
```

✅ Priority: Implement first
✅ Timeline: Week 1

L1-EXEC-001 - Facilitator Agent
L1-EXEC-002 - Product Owner Agent
L1-EXEC-003 - Scrum Master Agent
L1-EXEC-004 - QA Manager Agent
L2-DEPT-001 - BA Agent
L2-DEPT-002 - Architect Agent

```

**Phase 2: P1 Agents** (19 agents - Important)
```

⏳ Priority: Implement second
⏳ Timeline: Week 2-3

L2-DEPT-003 - Requirements Engineer
L2-DEPT-004 - Domain Expert
L2-DEPT-005 - Data Architect
[...16 more]

```

**Phase 3: P2 Agents** (10 agents - Nice to have)
```

📋 Priority: Implement third
📋 Timeline: Week 4

[10 agents]

```

**Phase 4: P3 Agents** (Deferred)
```

🔮 Priority: Future enhancement
🔮 Timeline: TBD

````

### Automation Template

**Use this command to generate skeleton:**
```bash
forgemind generate-skill \
  --agent-id L2-DEPT-001 \
  --name ba-agent \
  --description "Analyzes MODULE dependencies..." \
  --priority P1 \
  --integrates-with facilitator,architect
````

**Output:**

```
Created: ~/.claude/skills/forgemind-ba-agent/
├── SKILL.md (generated from template)
├── PLAN_ASK_EXECUTE.md (standard template)
├── CONTEXT.md (skeleton)
└── scripts/ (empty directory)

Next steps:
1. Fill in SKILL.md core responsibilities
2. Add specific commands to COMMANDS.md
3. Create supporting documentation
4. Test skill with sample project
```

---

## 📖 Related Documentation

- **context-engineering-guide.md** - Context Engineering principles
- **plan-ask-execute-protocol.md** - PAE detailed specification
- **ubiquitous-language.md** - ForgeMind terminology
- **agents-catalog.json** - Complete 68 agents list
- **forgemind-workflow.md** - 6-layer workflow

---

## 🎯 Success Metrics

Agent Skills implementation is successful when:

1. ✅ **All 68 agents converted** to skill format
2. ✅ **Skills auto-trigger correctly** based on descriptions
3. ✅ **Context usage optimized** (<50% average)
4. ✅ **Plan-Ask-Execute enforced** (100% compliance)
5. ✅ **Skills compose seamlessly** (multi-agent workflows work)
6. ✅ **Portable across platforms** (Claude Code, API, claude.ai)

---

**This specification ensures all ForgeMind agents are implemented consistently, efficiently, and according to best practices.**

**Version**: 1.0 (2025-10-27)  
**Status**: Ready for 68-agent implementation  
**Next Step**: Start with Phase 1 (P0 agents)
