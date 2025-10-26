# ForgeMind Ubiquitous Language

**Version**: 1.0  
**Last Updated**: 2025-10-24  
**Location**: `.ai/docs/ubiquitous-language.md`  
**Purpose**: Official terminology for ForgeMind - Everyone must use these terms consistently

---

## 📖 Why This Matters

**Problem**: Mixed terminology causes confusion
- Sometimes "Phase", sometimes "Layer"
- Sometimes "Stage", sometimes "Step"  
- Unclear what terms mean

**Solution**: One Ubiquitous Language for everyone
- Boss uses these terms
- AI Agents use these terms
- Documentation uses these terms
- Code uses these terms

**Rule**: If a term is not in this document, we define it first before using it.

---

## 🎯 Core Concepts

### Layer (層級) ✅ USE THIS

**Definition**: A level of abstraction in ForgeMind's top-down design structure.

**Layers** (6 total):
1. **Layer 0: IDEA** - Initial vague concept
2. **Layer 1: MODULE** - System decomposition  
3. **Layer 2: DOMAIN** - Domain modeling (DDD)
4. **Layer 3: REQUIREMENT** - Specific requirements
5. **Layer 4: SPECIFICATION** - Executable specs
6. **Layer 5: CODE** - Final implementation

**Key Properties**:
- Layers are NOT time-sequential
- Can move between layers freely (non-linear)
- Each layer has clarity percentage
- Lower layers depend on higher layers

**Usage**:
```
✅ "We're at Layer 2 now"
✅ "Backtrack to Layer 0"
✅ "Layer 3 requirements"
❌ "We're in Phase 2" (WRONG - don't use Phase)
❌ "Stage 3 development" (WRONG - don't use Stage)
```

---

### Phase ❌ DON'T USE

**Status**: DEPRECATED - Do not use

**Why Deprecated**: 
- Implies time-sequential progression
- Sounds like waterfall methodology
- Conflicts with non-linear nature

**Replace With**: Layer

**Migration**:
```
Old (Phase)              → New (Layer)
Phase 0: Validation      → Currently working on all Layers for ForgeMind itself
Phase 1: Development     → (Remove concept, use Layer directly)
Phase 2: Production      → (Remove concept, use deployment status)
```

---

### Clarity (清晰度) ✅ USE THIS

**Definition**: Measurable percentage indicating how well a Layer is understood.

**Range**: 10% (vague) → 100% (crystal clear)

**Typical Progression**:
- Start: 10-30%
- After clarify: 50-70%
- Ready for next layer: 90%+
- Perfect understanding: 95-100%

**Per Layer**:
- Each Layer maintains its own clarity
- Moving to next layer doesn't freeze previous clarity
- Can refine any layer to increase clarity

**Usage**:
```
✅ "IDEA clarity: 85%"
✅ "MODULE clarity increased from 40% to 60%"
✅ "Need 90%+ clarity before moving to next layer"
❌ "We're 50% done" (WRONG - clarity ≠ progress)
```

---

### Clarify Phase (釐清階段) ✅ USE THIS

**Definition**: The process of asking structured questions to increase clarity.

**Key Characteristics**:
- Primarily happens at Layer 0 (IDEA)
- Can happen at any layer
- Uses structured questions with options
- Boss answers to increase clarity
- Tracks clarity progression

**Not A Time Phase**: "Clarify Phase" is the ACTION of clarifying, not a time period.

**Usage**:
```
✅ "Start clarify phase for this IDEA"
✅ "Entering clarify phase to increase MODULE clarity"
✅ "Clarify phase complete, clarity now 90%"
❌ "We're in Phase 0 clarification" (WRONG - don't mix with Phase)
```

---

### Backtrack (回溯) ✅ USE THIS

**Definition**: Moving back to a higher (earlier) layer to make changes.

**Common Scenarios**:
```
CODE → SPEC → REQ → DOMAIN → MODULE → IDEA
(Discovering CODE is impossible, backtrack to fix IDEA)

REQ → DOMAIN → MODULE
(Requirements don't make sense, backtrack to fix MODULE structure)
```

**Key Property**: Backtracking triggers re-alignment of dependent layers.

**Usage**:
```
✅ "Backtrack to Layer 1 (MODULE)"
✅ "Need to backtrack - IDEA needs refinement"
✅ "Backtracking from CODE to REQUIREMENT"
❌ "Go back to Phase 0" (WRONG)
❌ "Revert to Stage 1" (WRONG)
```

---

### Alignment (對齊) ✅ USE THIS

**Definition**: Synchronizing lower layers to match changes in higher layers.

**When Needed**:
- After backtracking and modifying a layer
- Lower layers must be updated to reflect changes
- Ensures consistency across all layers

**Example**:
```
Backtrack to IDEA (Layer 0) and modify
   ↓
Align MODULE (Layer 1) to new IDEA
   ↓
Align DOMAIN (Layer 2) to new MODULE
   ↓
Align REQUIREMENT (Layer 3) to new DOMAIN
   ↓
Continue...
```

**Usage**:
```
✅ "Align MODULE to updated IDEA"
✅ "Re-align all layers after IDEA change"
✅ "DOMAIN needs alignment with MODULE"
❌ "Sync to Phase 0" (WRONG)
```

---

### Iterate (迭代) ✅ USE THIS

**Definition**: Repeatedly cycling through layers to refine the solution.

**Pattern**:
```
IDEA → MODULE → DOMAIN → discover issue
  ↓
Backtrack to MODULE → refine
  ↓
DOMAIN (aligned) → REQ → discover issue
  ↓
Backtrack to IDEA → refine
  ↓
Align all layers → continue...
```

**Key Point**: This is NOT "iterations" in Agile/Scrum sense. It's refining through layers.

**Usage**:
```
✅ "Iterate on DOMAIN design"
✅ "Several iterations needed to get IDEA clear"
✅ "Iterating between SPEC and CODE"
❌ "Sprint iteration" (Different concept - avoid in ForgeMind context)
```

---

### Top-Down Design (由上而下設計) ✅ USE THIS

**Definition**: ForgeMind's design approach starting from high-level IDEA down to CODE.

**Flow**:
```
Top (Abstract)
   IDEA → Problem domain, vague concept
   MODULE → High-level system structure
   DOMAIN → Domain modeling
   REQUIREMENT → Specific needs
   SPECIFICATION → Executable definition
   CODE → Implementation
Bottom (Concrete)
```

**Key Point**: "Top-down" describes the conceptual direction, NOT that we strictly go one direction.

**Usage**:
```
✅ "ForgeMind uses top-down design"
✅ "Start from top (IDEA) and refine downward"
✅ "Top-down doesn't mean waterfall - we can backtrack"
❌ "Bottom-up approach" (Opposite of ForgeMind philosophy)
```

---

### Non-Linear (非線性) ✅ USE THIS

**Definition**: The ability to move freely between any layers in any direction.

**Contrast**:
```
Linear (Waterfall):
IDEA → MODULE → DOMAIN → REQ → SPEC → CODE
(Can only move forward)

Non-Linear (ForgeMind):
IDEA ↔ MODULE ↔ DOMAIN ↔ REQ ↔ SPEC ↔ CODE
(Can move any direction, anytime)
```

**Key Benefit**: Discover issues early, fix at source, realign dependent layers.

**Usage**:
```
✅ "ForgeMind is non-linear"
✅ "Non-linear allows backtracking anytime"
✅ "Non-linear workflow is key to flexibility"
❌ "Sequential development" (Opposite)
```

---

### Plan-Ask-Execute (計劃-詢問-執行) ✅ USE THIS

**Definition**: Mandatory 3-step protocol for ALL AI Agent actions.

**Steps**:
1. **PLAN**: AI creates detailed plan
2. **ASK**: AI requests explicit approval  
3. **EXECUTE**: AI proceeds only after "Yes"

**Key Rule**: NO exceptions. Every action must follow this protocol.

**Usage**:
```
✅ "Following Plan-Ask-Execute protocol"
✅ "AI must Plan-Ask-Execute for all changes"
✅ "Violated Plan-Ask-Execute - rejected"
❌ "Just execute" (WRONG - violates protocol)
❌ "Assume permission" (WRONG - must ask)
```

---

### Boss ✅ USE THIS

**Definition**: Non-technical user who provides ideas and makes decisions.

**Responsibilities**:
- Provide vague initial IDEA
- Answer clarifying questions
- Review AI proposals
- Approve/reject/modify changes
- Final decision maker

**NOT Responsibilities**:
- Write code
- Design architecture  
- Generate specs
- Technical details

**Usage**:
```
✅ "Boss provides IDEA"
✅ "Wait for Boss approval"
✅ "Boss Mode - simplified language"
❌ "User" (Too generic)
❌ "Client" (Wrong relationship)
❌ "Product Owner" (Agile term, avoid confusion)
```

---

### Agent (代理) ✅ USE THIS

**Definition**: Specialized AI that performs specific tasks in ForgeMind.

**Types**:
- **Level 1: Executive Agents** (4) - High-level coordination
- **Level 2: Department Agents** (38) - Specialized functions
- **Level 3: Sub-agents** (26) - Specific tasks

**Total**: 68 Agents

**Key Agent**: **Facilitator Agent** - Primary interface for Boss

**Usage**:
```
✅ "Facilitator Agent handles Boss interactions"
✅ "Call Domain Expert Agent for modeling"
✅ "68 Agents in ForgeMind"
❌ "AI" (Too generic when referring to specific agent)
❌ "Bot" (Wrong terminology)
```

---

### Facilitator Agent ✅ USE THIS

**Definition**: Primary Level 1 Executive Agent that interfaces with Boss.

**Responsibilities**:
- Guide Boss through layers
- Ask clarifying questions
- Track clarity progression
- Execute Boss commands (13 commands)
- Coordinate other agents
- Ensure Plan-Ask-Execute protocol

**Key Property**: Boss primarily interacts ONLY with Facilitator Agent.

**Usage**:
```
✅ "Facilitator Agent asks questions"
✅ "facilitator status" (command)
✅ "Facilitator coordinates other agents"
❌ "Main AI" (Wrong term)
❌ "Primary assistant" (Too generic)
```

---

### Traceability (可追溯性) ✅ USE THIS

**Definition**: Linking all artifacts across layers to show relationships.

**Structure**:
```
IDEA → MODULE → DOMAIN → REQUIREMENT → SPECIFICATION → CODE
All connected bidirectionally
```

**Maintained In**: `.dev/traceability/master-matrix.json`

**Key Benefit**: 3-second impact analysis when changes occur.

**Usage**:
```
✅ "Traceability links IDEA to CODE"
✅ "Check traceability matrix for impact"
✅ "Maintain traceability across all layers"
❌ "Dependency tracking" (Different concept)
```

---

### Impact Analysis (影響分析) ✅ USE THIS

**Definition**: Analyzing consequences of changes before making them.

**Target**: 3 seconds to show full impact

**Shows**:
- Which layers affected
- Which files need updating
- Estimated effort to propagate changes

**Usage**:
```
✅ "Run impact analysis before changing IDEA"
✅ "Impact analysis shows 5 files affected"
✅ "3-second impact analysis complete"
❌ "Change impact" (Less specific)
```

---

### Artifact (產物/文件) ✅ USE THIS

**Definition**: Any file or document generated during ForgeMind workflow.

**Types**:
- IDEA documents (`.md`)
- MODULE definitions (`.md`)
- DOMAIN models (`.md`)
- REQUIREMENT files (`.md`)
- SPECIFICATION files (`.json`)
- CODE files (`.java`, `.md` for prompts, etc.)

**Location**: `.dev/current/`

**Usage**:
```
✅ "Generate REQUIREMENT artifacts"
✅ "All artifacts tracked in traceability matrix"
✅ "Artifact versioning enabled"
❌ "Document" (Less specific)
❌ "File" (Too generic)
```

---

### Current State (當前狀態) ✅ USE THIS

**Definition**: The latest version of all artifacts.

**Location**: `.dev/current/`

**Structure**:
```
.dev/current/
├── ideas/IDEA-XXX/current.md      ← Current IDEA
├── modules/MODULE-XXX/current.md  ← Current MODULE
├── domains/DOMAIN-XXX/current.md  ← Current DOMAIN
├── requirements/REQ-XXX.md        ← Current REQUIREMENT
└── specs/SPEC-XXX.json            ← Current SPECIFICATION
```

**Key Property**: Single source of truth.

**Usage**:
```
✅ "Update current state"
✅ "Current state reflects latest changes"
✅ "Check current state before modifying"
❌ "Latest version" (Less specific)
```

---

### Version Snapshot (版本快照) ✅ USE THIS

**Definition**: Historical copy of an artifact at a specific point in time.

**Location**: `.dev/current/{layer}/versions/`

**Naming**:
- `v0.1.md` - Initial version
- `v0.2.md` - After first clarify
- `v1.0.md` - Major milestone

**When Created**:
- After significant clarity increase (+5% or more)
- Before major changes (backup)
- At layer transitions
- On Boss request

**Usage**:
```
✅ "Create version snapshot v0.3"
✅ "Version snapshot saved"
✅ "Compare current with version v0.2"
❌ "Backup" (Less specific)
❌ "Checkpoint" (Different concept)
```

---

### TODO (待辦事項) ✅ USE THIS

**Definition**: List of tasks to be completed.

**Organization**:
- By Layer (IDEA, MODULE, DOMAIN, etc.)
- By Priority (P0, P1, P2)

**File**: `TODO.md` (single file, no more PHASE-X-TODO.md)

**NOT organized by time/phase**.

**Usage**:
```
✅ "Add to TODO: Clarify MODULE dependencies"
✅ "TODO organized by Layer and Priority"
✅ "P0 TODO items are critical"
❌ "Phase 0 TODO" (WRONG - no more phases)
❌ "Sprint backlog" (Different concept)
```

---

### Priority (優先級) ✅ USE THIS

**Definition**: Importance level of a task.

**Levels**:
- **P0**: Critical - Must have
- **P1**: Important - Should have
- **P2**: Nice to have - Could have
- **P3**: Future - Won't have now

**Usage**:
```
✅ "P0: Implement Plan-Ask-Execute"
✅ "P1: Complete all agent specs"
✅ "P2: Add examples and tutorials"
❌ "High priority" (Use P0 instead)
❌ "Critical" (Use P0 instead for consistency)
```

---

### Generic (通用的) ✅ USE THIS

**Definition**: Reusable across all ForgeMind projects.

**Location**: `.ai/` folder

**Examples**:
- Agent prompts
- Constitution documents
- Standards
- Templates

**Key Property**: Project-independent, can be copied to new projects.

**Usage**:
```
✅ "Generic agent prompts in .ai/"
✅ "This is generic, use in all projects"
✅ "Generic framework, project-specific in .dev/"
❌ "Shared" (Less specific)
❌ "Common" (Ambiguous)
```

---

### Project-Specific (專案專屬) ✅ USE THIS

**Definition**: Unique to one specific project.

**Location**: `.dev/` folder

**Examples**:
- Current IDEA
- Current MODULES
- Current REQUIREMENTS
- Project TODO

**Key Property**: Cannot be reused across projects.

**Usage**:
```
✅ "Project-specific artifacts in .dev/"
✅ "This IDEA is project-specific"
✅ "Separate generic (.ai/) from project-specific (.dev/)"
❌ "Custom" (Less clear)
❌ "Local" (Ambiguous)
```

---

### Sync (同步) ✅ USE THIS

**Definition**: Making files match the current conversation/work state.

**When Needed**:
- Files don't reflect latest changes
- After session with many modifications
- Before ending session

**Commands**:
- `facilitator check sync` - Check if synced
- `facilitator sync files` - Sync all files

**Usage**:
```
✅ "Files out of sync"
✅ "Sync current state to files"
✅ "Check sync before committing"
❌ "Update" (Less specific)
```

---

### Anti-Hallucination (防幻覺) ✅ USE THIS

**Definition**: Checks to prevent AI from fabricating information.

**21+ Checks** covering:
- No assumptions about Boss intent
- No unrequested features
- No guessing missing information
- No fabricated facts
- Must ask when uncertain

**Location**: `.ai/standards/anti-hallucination/`

**Usage**:
```
✅ "Anti-hallucination checks passed"
✅ "Violated anti-hallucination rule"
✅ "21+ anti-hallucination checks built-in"
❌ "Prevent mistakes" (Less specific)
```

---

### Clarity Tracking (清晰度追蹤) ✅ USE THIS

**Definition**: Monitoring and displaying clarity percentage for each layer.

**Display Format**:
```
Layer 0 (IDEA):         [████████░░] 85%
Layer 1 (MODULE):       [████░░░░░░] 40%
Layer 2 (DOMAIN):       [██░░░░░░░░] 20%
```

**Updated**: After each clarification or modification.

**Usage**:
```
✅ "Clarity tracking shows IDEA at 85%"
✅ "Track clarity for all layers"
✅ "Clarity tracking updated"
❌ "Progress tracking" (Different concept)
```

---

### Command (指令) ✅ USE THIS

**Definition**: Boss instruction to Facilitator Agent.

**Format**: `facilitator [action]`

**13 Core Commands**:
```
facilitator status
facilitator clarify
facilitator help
facilitator update idea
facilitator new version
facilitator git commit
... (7 more)
```

**Usage**:
```
✅ "Use command: facilitator status"
✅ "13 commands available"
✅ "Command format is simple"
❌ "Request" (Less specific)
❌ "Instruction" (Less specific)
```

---

## 🚫 Deprecated Terms (Don't Use)

### Phase ❌
**Replacement**: Layer  
**Why**: Implies time-sequential, conflicts with non-linear nature

### Stage ❌
**Replacement**: Layer  
**Why**: Same as Phase

### Step ❌
**Replacement**: Layer (for structure), Action (for tasks)  
**Why**: Ambiguous - could mean many things

### Sprint ❌
**Replacement**: (Don't use - ForgeMind doesn't have sprints)  
**Why**: Agile/Scrum term, different methodology

### Iteration (in Agile sense) ❌
**Replacement**: Use "iterate" as verb, but avoid "iteration N"  
**Why**: ForgeMind iteration is different from Agile iterations

### User ❌
**Replacement**: Boss  
**Why**: Boss is specific role in ForgeMind

### Client ❌
**Replacement**: Boss  
**Why**: Wrong relationship

### Progress ❌
**Replacement**: Clarity (for understanding), Status (for completion)  
**Why**: "50% progress" is ambiguous

### Checkpoint ❌
**Replacement**: Version Snapshot  
**Why**: More specific

### Backup ❌
**Replacement**: Version Snapshot (for versions), Snapshot (for state)  
**Why**: More specific to purpose

---

## 📐 Structure Terms

### Layer Structure (6 Layers)

```
Layer 0: IDEA          - Initial concept, problem domain
Layer 1: MODULE        - System decomposition
Layer 2: DOMAIN        - Domain modeling (DDD)
Layer 3: REQUIREMENT   - Specific requirements (EARS)
Layer 4: SPECIFICATION - Executable specs (ezSpec)
Layer 5: CODE          - Final implementation
```

**Always use number + name**: "Layer 0" not just "IDEA layer"

---

## 🗂️ File Structure Terms

### Folder Names (Official)

```
.ai/                    - Generic framework
.dev/                   - Project-specific
.forgemind/             - Configuration
```

**Subfolders**:
```
.ai/agents/             - NOT "agent/" or "ai-agents/"
.ai/constitution/       - NOT "rules/" or "principles/"
.ai/standards/          - NOT "guidelines/"
.ai/docs/              - NOT "documentation/"

.dev/current/          - NOT "state/" or "latest/"
.dev/traceability/     - NOT "trace/" or "tracking/"
.dev/lessons/          - NOT "learnings/" or "learning-logs/"
```

### File Names (Official)

```
AGENTS.md              - NOT "agents.md" or "AGENT-LIST.md"
TODO.md                - NOT "TODOS.md" or "todo-list.md"
FORGEMIND-README.md    - NOT "README.md" or "forgemind.md"
```

---

## 💬 Communication Terms

### Questions Format

**Structured Question**: Question with options + explanation

**Format**:
```
Q: [Question]
Options:
A. [Option A]
B. [Option B]
C. [Option C]

Why this matters:
- [Reason 1]
- [Reason 2]
```

**NOT**: Open-ended questions without options

---

### Response Format

**Approval Responses**:
```
✅ Valid:
- "Yes"
- "Proceed"
- "Go ahead"
- "可以"
- "執行"

❌ Invalid (need clarification):
- "ok" (too vague)
- "sure" (ambiguous)
- "hmm" (not approval)
- [silence] (not consent)
```

---

## 🎓 Usage Examples

### ✅ Correct Usage

```markdown
"Boss provides vague IDEA at Layer 0"
"Clarity increased from 70% to 85%"
"Backtrack to Layer 1 (MODULE)"
"Following Plan-Ask-Execute protocol"
"Facilitator Agent coordinates 67 other agents"
"Sync files before commit"
"Create version snapshot v0.3"
"Impact analysis shows 5 artifacts affected"
"Align DOMAIN to updated MODULE"
"Iterate on REQUIREMENT design"
"P0 priority: Implement core protocol"
```

### ❌ Incorrect Usage

```markdown
"User provides vague idea at Phase 0"  ❌ (Use Boss, Layer)
"Progress increased to 85%"             ❌ (Use Clarity)
"Go back to Stage 1"                    ❌ (Use Backtrack to Layer)
"Just execute without asking"           ❌ (Violates Plan-Ask-Execute)
"Main AI coordinates others"            ❌ (Use Facilitator Agent)
"Update files"                          ❌ (Use Sync)
"Create checkpoint v0.3"                ❌ (Use Version Snapshot)
"Change impact shows 5 files"           ❌ (Use Impact Analysis)
"Sync domain to new module"             ❌ (Use Align)
"Refine in next sprint"                 ❌ (Use Iterate, no sprint)
"High priority task"                    ❌ (Use P0/P1/P2)
```

---

## 📚 Term Categories

### By Concept

**Structure Terms**:
- Layer, Top-Down Design, Non-Linear, Backtrack, Alignment, Iterate

**Process Terms**:
- Clarify Phase, Plan-Ask-Execute, Impact Analysis, Traceability

**Role Terms**:
- Boss, Agent, Facilitator Agent

**Quality Terms**:
- Clarity, Anti-Hallucination

**Artifact Terms**:
- Artifact, Current State, Version Snapshot, TODO

**Organization Terms**:
- Generic, Project-Specific, Priority

**File Terms**:
- Sync, Command

---

## 🔄 Updating This Document

**When to Update**:
1. New concept introduced
2. Term meaning clarified
3. Deprecated term identified
4. Confusion observed in usage

**Process**:
1. Boss proposes new term or change
2. Facilitator adds to this document
3. All documentation updated to use new term
4. Old term marked as deprecated

**Version**: Track changes in git history

---

## ✅ Compliance Checklist

Before using a term, check:

- [ ] Is this term in Ubiquitous Language?
- [ ] Am I using the exact term (not a variation)?
- [ ] Am I using deprecated terms? (If yes, replace)
- [ ] Is the term consistent across all contexts?
- [ ] Would a newcomer understand this term from this document?

---

## 🎯 Summary

**Golden Rules**:

1. ✅ **Use Layer, NOT Phase**
2. ✅ **Use Clarity, NOT Progress**  
3. ✅ **Use Boss, NOT User/Client**
4. ✅ **Use exact terms from this document**
5. ✅ **When in doubt, check this document first**
6. ✅ **If term not here, define it first**

**This is ForgeMind's Ubiquitous Language. Everyone uses it. No exceptions.**

---

**Document Version**: 1.0  
**Maintained by**: Boss + Facilitator Agent  
**All team members (AI and human) must use these terms consistently.**
