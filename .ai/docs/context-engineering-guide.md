# Context Engineering Guide for ForgeMind

**Version**: 1.0  
**Last Updated**: 2025-10-27  
**Location**: `.ai/docs/context-engineering-guide.md`  
**Purpose**: Complete guide for implementing Context Engineering in ForgeMind

---

## 📚 Table of Contents

1. [What is Context Engineering](#what-is-context-engineering)
2. [Why ForgeMind Needs It](#why-forgemind-needs-it)
3. [Core Principles](#core-principles)
4. [4 Pillars of Context Engineering](#4-pillars-of-context-engineering)
5. [Implementation Guide](#implementation-guide)
6. [Context Layers](#context-layers)
7. [Best Practices](#best-practices)
8. [Monitoring & Validation](#monitoring--validation)

---

## 🎯 What is Context Engineering

**Context Engineering** is the practice of dynamically providing AI agents with the **right information**, in the **right format**, at the **right time**, to maximize effectiveness while minimizing cognitive load and hallucination risk.

### Traditional Approach vs Context Engineering

```
❌ Traditional Approach:
Boss: "What's the current status?"
Agent: [Loads ALL files - 100k tokens]
       [Information overload]
       [Misses key details]
       [May hallucinate to fill gaps]

✅ Context Engineering:
Boss: "What's the current status?"
Agent: [Loads context metadata only]
       [Shows summary with file paths]
       [Loads details on-demand]
       [Crystal clear, no hallucination]
```

---

## 💡 Why ForgeMind Needs It

### Current Pain Points

| Problem                         | Context Engineering Solution         |
| ------------------------------- | ------------------------------------ |
| **AI assumes missing info**     | Provide complete, structured context |
| **Changes impact unclear**      | Context tracks dependencies          |
| **Agent info inconsistent**     | Unified context management           |
| **Backtrack loses info**        | Context version management           |
| **Clarity tracking imprecise**  | Context-based clarity calculation    |
| **Long sessions exceed window** | Context compaction strategy          |

### ForgeMind-Specific Needs

ForgeMind workflows can last **hours or days**:

- Boss clarifies IDEA over 50+ messages
- Need to remember ALL Boss decisions
- Track clarity evolution
- Maintain traceability across layers
- Support non-linear backtracking

**Without CE**: Context window fills up → information loss → hallucination  
**With CE**: Clean context → complete history → zero hallucination

---

## 🔑 Core Principles

### 1. **Just-in-Time Retrieval**

```
❌ Load everything upfront
✅ Load summaries → Load details on-demand

Example:
Boss: "Show me all ideas"
Agent: [Lists IDEA-001 through IDEA-005 with summaries]
Boss: "Show IDEA-003 details"
Agent: [NOW loads IDEA-003/current.md fully]
```

### 2. **Context Layering**

```
Layer 1 (Essential): ALWAYS loaded
├── Current role & agent
├── Current layer & clarity
├── Last 3 Boss decisions
└── Pending actions

Layer 2 (Task-Specific): Load on demand
├── Relevant IDEA/MODULE/DOMAIN
├── Traceability links
└── Related artifacts

Layer 3 (Historical): Load when needed
├── Session summaries
├── Past clarifications
└── Lessons learned
```

### 3. **Context Compaction**

```
When context window > 70%:
├── Preserve last 10 messages (full)
├── Preserve ALL Boss decisions (never lose)
├── Summarize middle 80% of conversation
└── Result: 100 messages → 15 messages equivalent
```

### 4. **Context Validation**

```
Before EVERY action:
✓ Do I have current layer info?
✓ Do I have clarity level?
✓ Do I have Boss preferences?
✓ Do I have recent decisions?
✓ Is context window under 80%?
✓ Do I have required tools?

If ANY fail → Load missing context first
```

---

## 🏗️ 4 Pillars of Context Engineering

### Pillar 1: System Prompts (XML Structure)

**Before CE**:

```markdown
You are Facilitator Agent. You help Boss...
```

**With CE**:

```xml
<role>
You are Facilitator Agent (L1-EXEC-001).
Current Session: {session_id}
Current Layer: {current_layer} ({layer_name})
Clarity: {clarity}%
</role>

<context_state>
Loaded Artifacts: {loaded_artifacts}
Context Window: {window_usage}%
Recent Decisions: {recent_decisions_count}
Last Updated: {timestamp}
</context_state>

<instructions>
Before ANY action:
1. Validate context completeness
2. Load additional context if needed
3. Follow Plan-Ask-Execute protocol
4. Update context after action
</instructions>
```

**Benefits**:

- Clear separation of concerns
- Dynamic placeholders
- Easy to update specific sections
- Agents know exactly what context they have

---

### Pillar 2: Just-in-Time Context Retrieval

**Lightweight Identifiers**:

```json
{
  "ideas": [
    {
      "id": "IDEA-001",
      "name": "AI Coding Tool",
      "clarity": 90,
      "status": "Layer 1 (MODULE) - 85%",
      "path": ".dev/current/ideas/IDEA-001/",
      "size": "50KB",
      "last_modified": "2025-10-26",
      "loaded": false
    },
    {
      "id": "IDEA-002",
      "name": "CRM System",
      "clarity": 50,
      "status": "Layer 0 (IDEA) - 50%",
      "path": ".dev/current/ideas/IDEA-002/",
      "size": "25KB",
      "last_modified": "2025-10-25",
      "loaded": false
    }
  ]
}
```

**Load Strategy**:

```
1. ALWAYS: Load metadata (list above)
2. ON-DEMAND: Load full content when Boss asks
3. UNLOAD: Remove when no longer needed
4. CACHE: Keep recently accessed for quick re-load
```

**Example Commands**:

```bash
facilitator list ideas --summary-only
# Shows metadata only, ~5KB

facilitator show IDEA-001
# Loads IDEA-001/current.md, ~50KB
# Status: loaded = true

facilitator unload IDEA-001
# Removes from active context
# Status: loaded = false
```

---

### Pillar 3: Context Compaction

**Compaction Strategy**:

```markdown
## Session Start (100 messages later...)

Context Window: 85% full ⚠️

Compaction Triggered:
├── Preserve (Never compress):
│ ├── Last 10 messages (full)
│ ├── ALL Boss decisions (immutable)
│ ├── Open questions
│ └── Current layer state
│
├── Summarize (Compress):
│ ├── Middle 80 messages
│ ├── Agent tool outputs
│ ├── Intermediate clarifications
│ └── Redundant confirmations
│
└── Result:
├── Before: 100 messages, 80K tokens
└── After: 25 messages equivalent, 20K tokens
```

**Compaction Summary Format**:

```markdown
# Session Summary (Messages 11-90)

## Key Decisions

- Boss decided on 6-layer structure (keep MODULE & DOMAIN separate)
- Boss approved Plan-Ask-Execute protocol
- Boss created Ubiquitous Language

## Progress Made

- Layer 0 (IDEA): 85% → 90%
- Layer 1 (MODULE): 40% → 85%
- Created 68 agents catalog

## Unresolved Items

- Scripts module structure pending Boss decision
- Git automation inclusion TBD

## Tools Used

- facilitator clarify (5 times)
- facilitator update idea (2 times)
- facilitator status (3 times)
```

---

### Pillar 4: Agentic Memory (External Memory System)

**Memory Structure**:

```
.forgemind/memory/
├── facilitator-notes.md       ← Agent's "notebook"
├── boss-preferences.md        ← Boss habits & preferences
└── project-knowledge.md       ← Domain knowledge

Each agent maintains separate memory!
```

**facilitator-notes.md Example**:

```markdown
# Facilitator Agent Notes

## Last Updated

2025-10-27 10:00 HKT

## Active Tasks

- [ ] P0: Finalize scripts/ module structure
- [ ] P0: Complete module dependency mapping
- [ ] P1: Create module architecture diagrams

## Key Decisions (Immutable Log)

1. **2025-10-26 15:00**: Boss decided 6-layer structure
   - Rationale: Support large enterprise systems
   - Impact: All docs updated to reflect 6 layers
2. **2025-10-26 16:30**: MODULE + DOMAIN stay separate
   - Rationale: Clear separation of concerns
   - Alternative rejected: Merge into single DOMAIN layer

## Open Questions

- **Q1**: Should scripts/ include git automation?
  - Status: Waiting for Boss decision
  - Impact: ~5 script files
  - Priority: P0

## Boss Preferences (Learned)

- Prefers structured questions (Options + Why format)
- Wants explicit approval for ALL changes (Plan-Ask-Execute)
- Values 3-second impact analysis before decisions
- Language: Mix of English + 繁體中文

## Current Context

- Layer: Layer 1 (MODULE) - 85%
- Next Action: Present scripts/ structure options
- Last Interaction: 2 hours ago
- Boss Mood: Focused, productive

## Lessons Learned

1. Boss doesn't like vague questions → Always provide options
2. Boss wants to know impact before deciding → Run impact analysis
3. Boss prefers backtracking freedom → Regularly remind about non-linear support
```

**boss-preferences.md Example**:

```markdown
# Boss Preferences Profile

## Communication Style

- Language Mix: English (technical) + 繁體中文 (clarification)
- Question Format: Options + Why this matters
- Approval Style: Explicit "Yes" required, never assume

## Decision Making

- Needs: Impact analysis before major decisions
- Values: Traceability and clarity tracking
- Risk: Conservative (prefers proven over experimental)

## Working Hours

- Active: 09:00-18:00 HKT (weekdays)
- Response Time: Usually within 30 min
- Session Length: 1-2 hours typical

## Technical Preferences

- Tools: OpenCode, Grok Code
- Git: Single main branch (no feature branches)
- Documentation: Comprehensive, well-organized

## Quality Standards

- Expects: 90%+ clarity before layer progression
- Testing: 85%+ mutation coverage
- Code Review: All 48 checks must pass
```

---

## 🔧 Implementation Guide

### Step 1: Set Up Context Management Files

```bash
# Create context management structure
mkdir -p .forgemind/context
mkdir -p .forgemind/memory

# Create essential files
touch .forgemind/context/current-context.json
touch .forgemind/memory/facilitator-notes.md
touch .forgemind/memory/boss-preferences.md
touch .forgemind/memory/project-knowledge.md
```

### Step 2: Initialize current-context.json

```json
{
  "version": "1.0",
  "timestamp": "2025-10-27T10:00:00Z",
  "session_id": "session-2025-10-27-01",

  "role": {
    "agent": "Facilitator Agent",
    "agent_id": "L1-EXEC-001",
    "mode": "Boss Mode"
  },

  "project": {
    "name": "ForgeMind",
    "current_idea": "IDEA-001",
    "current_layer": 1,
    "layer_name": "MODULE",
    "clarity": 85
  },

  "context_window": {
    "usage_percent": 35,
    "total_tokens": 70000,
    "used_tokens": 24500,
    "compaction_threshold": 70,
    "needs_compaction": false
  },

  "loaded_artifacts": [
    {
      "type": "config",
      "id": "forgemind-config",
      "path": ".forgemind/config.json",
      "loaded": true,
      "size_kb": 5,
      "load_time": "2025-10-27T09:00:00Z"
    },
    {
      "type": "idea",
      "id": "IDEA-001",
      "path": ".dev/current/ideas/IDEA-001/current.md",
      "loaded": false,
      "size_kb": 50,
      "summary": "AI Coding Tool with Plan-Ask-Execute"
    }
  ],

  "recent_decisions": [
    {
      "timestamp": "2025-10-26T15:00:00Z",
      "decision": "Keep 6-layer structure",
      "rationale": "Support large enterprise systems",
      "impact": "All documentation updated"
    }
  ],

  "pending_actions": [
    {
      "action": "Finalize scripts/ module",
      "priority": "P0",
      "blocked_by": "Boss decision on git automation",
      "estimated_time": "30 min"
    }
  ],

  "available_commands": [
    "facilitator status",
    "facilitator clarify",
    "facilitator update idea",
    "facilitator git commit"
  ]
}
```

### Step 3: Update Agent Prompts with CE

**See Section: Enhanced Agent Prompts (below)**

### Step 4: Implement Context Validation

```python
# Pseudo-code for context validation
def validate_context_before_action(context, action):
    """
    Validate context completeness before executing action
    """
    required_checks = {
        "has_current_layer": context.get("project", {}).get("current_layer") is not None,
        "has_clarity": context.get("project", {}).get("clarity") is not None,
        "has_session_id": context.get("session_id") is not None,
        "context_window_ok": context.get("context_window", {}).get("usage_percent", 100) < 80,
        "has_required_artifacts": all(
            artifact["loaded"]
            for artifact in context.get("loaded_artifacts", [])
            if artifact["id"] in action.get("required_artifacts", [])
        )
    }

    missing = [check for check, result in required_checks.items() if not result]

    if missing:
        return {
            "valid": False,
            "missing": missing,
            "action": "load_missing_context"
        }

    return {"valid": True}
```

### Step 5: Implement Context Refresh Triggers

```markdown
## Context Refresh Triggers

### Trigger 1: Layer Transition

When: Boss moves from Layer 0 → Layer 1
Action:

- Unload Layer 0 details
- Load Layer 1 templates
- Update available commands
- Refresh clarity tracking

### Trigger 2: Clarity Significant Change (+10%)

When: Clarity increases by 10% or more
Action:

- Update context with new clarity
- Refresh available actions
- Update progress tracking

### Trigger 3: Boss Major Decision

When: Boss makes important decision
Action:

- Add to immutable decisions list
- Update project state
- Invalidate outdated context

### Trigger 4: Context Window > 70%

When: Context window exceeds threshold
Action:

- Trigger compaction
- Summarize and compress
- Preserve critical information

### Trigger 5: Backtrack Initiated

When: Boss backtracks to previous layer
Action:

- Restore historical context
- Load previous layer state
- Reset clarity if needed
```

---

## 📊 Context Layers

### Layer 1: Essential Context (ALWAYS Loaded)

**Size**: ~5-10KB  
**Tokens**: ~2,000-3,000  
**Load Time**: Instant

```json
{
  "role": "Facilitator Agent",
  "current_layer": 1,
  "clarity": 85,
  "last_3_decisions": [
    "Keep 6-layer structure",
    "Separate MODULE and DOMAIN",
    "Use Plan-Ask-Execute"
  ],
  "pending_actions": ["Finalize scripts/ module"],
  "session_id": "session-2025-10-27-01"
}
```

### Layer 2: Task-Specific Context (On-Demand)

**Size**: ~50-100KB  
**Tokens**: ~15,000-30,000  
**Load Time**: <1 second

```json
{
  "current_idea_full": "IDEA-001/current.md content",
  "current_modules": ["MODULE-001", "MODULE-002"],
  "traceability": {
    "IDEA-001": ["MODULE-001", "MODULE-002"]
  },
  "recent_changes": [...]
}
```

### Layer 3: Historical Context (When Requested)

**Size**: ~200-500KB  
**Tokens**: ~60,000-150,000  
**Load Time**: 2-3 seconds

```json
{
  "session_summaries": [...],
  "all_clarifications": [...],
  "version_history": [...],
  "lessons_learned": [...]
}
```

**Load Strategy**:

```
Default: Layer 1 only
Boss asks specific question → Load Layer 2
Boss asks for history → Load Layer 3
After action → Update Layer 1, optionally unload Layer 2/3
```

---

## ✅ Best Practices

### 1. **Prefer Summaries Over Full Content**

```
❌ Don't:
Load all IDEA files when Boss asks "What ideas do we have?"

✅ Do:
Show list with summaries, load details on request

Example:
facilitator list ideas
→ IDEA-001: AI Coding Tool (90% clarity)
→ IDEA-002: CRM System (50% clarity)

facilitator show IDEA-001
→ [NOW load full content]
```

### 2. **Update Context Immediately After Actions**

```
❌ Don't:
Execute action → forget to update context → stale context

✅ Do:
Execute action → update context → validate consistency

Example:
Boss: "Update clarity to 92%"
Agent: Updates file → Updates context.json → Validates match
```

### 3. **Compress Proactively, Not Reactively**

```
❌ Don't:
Wait until context window 95% full → emergency compression

✅ Do:
Monitor at 70% → trigger compression → maintain healthy state

Thresholds:
- 50%: Normal operation
- 70%: Trigger compression warning
- 80%: Aggressive compression
- 90%: Emergency mode
```

### 4. **Never Lose Boss Decisions**

```
✅ Always Preserve:
- All Boss decisions (immutable)
- Open questions
- Current layer state
- Pending actions

Can Compress:
- Tool outputs
- Intermediate clarifications
- Agent-to-agent communication
- Redundant confirmations
```

### 5. **Validate Context Before AND After Actions**

```python
# Before action
validate_context(action)
if not valid:
    load_missing_context()

# Execute action
result = execute(action)

# After action
update_context(result)
validate_consistency()
```

---

## 📈 Monitoring & Validation

### Context Health Metrics

```json
{
  "context_health": {
    "window_usage": 35,
    "loaded_artifacts": 5,
    "unloaded_artifacts": 20,
    "decisions_tracked": 15,
    "open_questions": 2,
    "session_duration": "2 hours",
    "compressions_triggered": 1,
    "last_compression": "1 hour ago",
    "status": "healthy"
  }
}
```

**Health Status**:

- **Healthy**: Window < 50%, all essential context loaded
- **Warning**: Window 50-70%, consider compression soon
- **Critical**: Window > 70%, compression needed
- **Emergency**: Window > 90%, immediate action required

### Validation Checklist

```markdown
## Daily Context Validation

- [ ] Context window under 70%
- [ ] All Boss decisions preserved
- [ ] Current layer state accurate
- [ ] Clarity levels up to date
- [ ] No stale loaded artifacts
- [ ] Memory files updated
- [ ] No missing required context
```

### Context Audit Log

```markdown
# Context Audit Log - 2025-10-27

## Session: session-2025-10-27-01

10:00 - Session started, context initialized
10:15 - Loaded IDEA-001 (Layer 2)
10:30 - Boss decision recorded: "Keep 6-layer"
10:45 - Context window: 45% → 52% (normal)
11:00 - Unloaded IDEA-001, loaded MODULE-001
11:30 - Context window: 52% → 48% (healthy)
12:00 - Compression triggered at 71%
12:05 - Compression complete: 71% → 35%
12:30 - Session ended, context saved
```

---

## 🎯 Success Criteria

Context Engineering is working when:

1. ✅ **No Hallucinations**: Agent never fabricates information
2. ✅ **Fast Responses**: <1 second for normal queries
3. ✅ **Complete History**: All Boss decisions preserved
4. ✅ **Healthy Window**: Context usage < 70% maintained
5. ✅ **Accurate State**: Context always reflects true project state
6. ✅ **Smooth Sessions**: Multi-hour sessions work smoothly
7. ✅ **Easy Backtracking**: Historical context readily available

---

## 📚 Related Documentation

- **context-management-system.md** - Detailed CM implementation
- **facilitator-agent-enhanced.md** - CE-enhanced agent prompt
- **ubiquitous-language.md** - Terminology definitions
- **plan-ask-execute-protocol.md** - Approval protocol

---

**Context Engineering is the foundation of reliable AI agents in ForgeMind.**  
**Implement it consistently across all 68 agents for maximum effectiveness.**

**Version**: 1.0 (2025-10-27)  
**Status**: Active - Ready for implementation
