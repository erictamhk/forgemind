# Context Management System

**Version**: 1.0  
**Last Updated**: 2025-10-27  
**Location**: `.forgemind/context/context-management-system.md`  
**Purpose**: Detailed implementation specifications for ForgeMind Context Management

---

## 📚 Table of Contents

1. [System Overview](#system-overview)
2. [File Structure](#file-structure)
3. [Context State Schema](#context-state-schema)
4. [Load Strategies](#load-strategies)
5. [Compaction Algorithms](#compaction-algorithms)
6. [Refresh Triggers](#refresh-triggers)
7. [Validation Rules](#validation-rules)
8. [Memory Management](#memory-management)

---

## 🎯 System Overview

The Context Management System (CMS) is responsible for:

1. **Tracking** current context state
2. **Loading** artifacts just-in-time
3. **Compacting** context when window fills
4. **Refreshing** context on significant events
5. **Validating** context completeness
6. **Managing** agent memory

### Architecture

```
┌─────────────────────────────────────────────────────────┐
│                 Context Manager                         │
│  ┌───────────┐  ┌──────────┐  ┌────────────┐          │
│  │  Loader   │  │Compactor │  │ Validator  │          │
│  └───────────┘  └──────────┘  └────────────┘          │
│       ↓              ↓              ↓                   │
│  ┌──────────────────────────────────────┐              │
│  │     Context State (JSON)             │              │
│  └──────────────────────────────────────┘              │
│       ↓              ↓              ↓                   │
│  ┌─────────┐  ┌──────────┐  ┌───────────┐             │
│  │ Memory  │  │ History  │  │  Cache    │             │
│  └─────────┘  └──────────┘  └───────────┘             │
└─────────────────────────────────────────────────────────┘
```

---

## 📁 File Structure

```
.forgemind/
├── context/
│   ├── current-context.json           ← Live context state
│   ├── context-history/               ← Previous contexts
│   │   ├── session-2025-10-27-01.json
│   │   └── session-2025-10-26-03.json
│   ├── compaction-summaries/          ← Compressed sessions
│   │   ├── 2025-10-27-session-01-summary.md
│   │   └── 2025-10-26-session-03-summary.md
│   └── context-management-system.md   ← This file
│
├── memory/
│   ├── facilitator-notes.md           ← Facilitator memory
│   ├── ba-agent-notes.md              ← BA Agent memory
│   ├── domain-expert-notes.md         ← Domain Expert memory
│   ├── boss-preferences.md            ← Boss habits
│   └── project-knowledge.md           ← Domain knowledge
│
├── cache/
│   ├── artifacts/                     ← Recently loaded
│   │   ├── IDEA-001.cache
│   │   └── MODULE-001.cache
│   └── cache-index.json               ← Cache metadata
│
└── config.json                        ← Project config (legacy)
```

---

## 📋 Context State Schema

### current-context.json

```json
{
  "version": "1.0",
  "schema": "forgemind-context-v1",

  "metadata": {
    "timestamp": "2025-10-27T10:00:00Z",
    "session_id": "session-2025-10-27-01",
    "session_start": "2025-10-27T09:00:00Z",
    "session_duration_minutes": 60,
    "last_updated_by": "Facilitator Agent"
  },

  "role": {
    "agent": "Facilitator Agent",
    "agent_id": "L1-EXEC-001",
    "agent_version": "1.4",
    "mode": "Boss Mode",
    "capabilities": ["clarify", "coordinate", "track_clarity", "manage_files"]
  },

  "project": {
    "name": "ForgeMind",
    "id": "PROJ-FORGEMIND-001",
    "current_idea": "IDEA-001",
    "current_layer": 1,
    "layer_name": "MODULE",
    "clarity": 85,
    "status": "In Progress"
  },

  "context_window": {
    "total_tokens": 200000,
    "used_tokens": 70000,
    "usage_percent": 35,
    "available_tokens": 130000,
    "compaction_threshold_percent": 70,
    "emergency_threshold_percent": 90,
    "needs_compaction": false,
    "last_compaction": "2025-10-27T08:30:00Z",
    "compressions_this_session": 1
  },

  "loaded_artifacts": [
    {
      "type": "config",
      "id": "forgemind-config",
      "name": "Project Configuration",
      "path": ".forgemind/config.json",
      "loaded": true,
      "load_layer": 1,
      "size_kb": 5,
      "tokens": 1500,
      "load_time": "2025-10-27T09:00:00Z",
      "last_accessed": "2025-10-27T09:45:00Z",
      "access_count": 15
    },
    {
      "type": "idea",
      "id": "IDEA-001",
      "name": "AI Coding Tool",
      "path": ".dev/current/ideas/IDEA-001/current.md",
      "loaded": false,
      "load_layer": 2,
      "size_kb": 50,
      "tokens": 15000,
      "summary": "AI Coding Tool with Plan-Ask-Execute protocol",
      "clarity": 90,
      "last_modified": "2025-10-26T18:00:00Z",
      "available": true
    },
    {
      "type": "module",
      "id": "MODULE-001",
      "name": "Constitution Framework",
      "path": ".dev/current/modules/MODULE-001/current.md",
      "loaded": true,
      "load_layer": 2,
      "size_kb": 30,
      "tokens": 9000,
      "load_time": "2025-10-27T09:30:00Z",
      "last_accessed": "2025-10-27T10:00:00Z",
      "access_count": 8
    }
  ],

  "recent_decisions": [
    {
      "id": "DEC-001",
      "timestamp": "2025-10-26T15:00:00Z",
      "decision": "Keep 6-layer structure",
      "rationale": "Support large enterprise systems (ERP, HRMS, MRP)",
      "impact": ["All documentation updated", "Workflow adjusted"],
      "decision_maker": "Boss",
      "recorded_by": "Facilitator Agent",
      "immutable": true
    },
    {
      "id": "DEC-002",
      "timestamp": "2025-10-26T16:30:00Z",
      "decision": "Separate MODULE and DOMAIN layers",
      "rationale": "Clear separation of concerns",
      "alternatives_rejected": ["Merge into single DOMAIN layer"],
      "impact": ["Layer structure defined", "Agent responsibilities updated"],
      "decision_maker": "Boss",
      "recorded_by": "Facilitator Agent",
      "immutable": true
    },
    {
      "id": "DEC-003",
      "timestamp": "2025-10-26T17:00:00Z",
      "decision": "Implement Plan-Ask-Execute protocol",
      "rationale": "Prevent AI hallucination and ensure Boss control",
      "impact": ["All agents must follow PAE", "No action without approval"],
      "decision_maker": "Boss",
      "recorded_by": "Facilitator Agent",
      "immutable": true
    }
  ],

  "pending_actions": [
    {
      "id": "ACT-001",
      "action": "Finalize scripts/ module structure",
      "priority": "P0",
      "layer": 1,
      "blocked_by": "Boss decision on git automation inclusion",
      "estimated_time_minutes": 30,
      "assigned_to": "Facilitator Agent",
      "created": "2025-10-27T09:00:00Z",
      "due": "2025-10-27T12:00:00Z"
    },
    {
      "id": "ACT-002",
      "action": "Complete module dependency mapping",
      "priority": "P0",
      "layer": 1,
      "blocked_by": null,
      "estimated_time_minutes": 45,
      "assigned_to": "Architect Agent",
      "created": "2025-10-27T09:15:00Z",
      "due": "2025-10-27T14:00:00Z"
    }
  ],

  "open_questions": [
    {
      "id": "Q-001",
      "question": "Should scripts/ module include git automation?",
      "context": "Boss considering workflow simplification",
      "asked_by": "Facilitator Agent",
      "asked_at": "2025-10-27T09:30:00Z",
      "status": "awaiting_answer",
      "priority": "high",
      "blocking": ["ACT-001"]
    }
  ],

  "available_commands": [
    {
      "command": "facilitator status",
      "description": "Show project status",
      "availability": "always"
    },
    {
      "command": "facilitator clarify",
      "description": "Start clarify session",
      "availability": "when_clarity_below_90"
    },
    {
      "command": "facilitator update idea",
      "description": "Update IDEA file",
      "availability": "when_idea_loaded"
    },
    {
      "command": "facilitator backtrack",
      "description": "Return to previous layer",
      "availability": "when_layer_above_0"
    }
  ],

  "session_stats": {
    "messages_exchanged": 42,
    "clarifications_made": 8,
    "decisions_recorded": 3,
    "files_updated": 5,
    "git_commits": 2,
    "commands_executed": 12,
    "errors_encountered": 0
  }
}
```

---

## 🔄 Load Strategies

### Strategy 1: Layered Loading

```python
def load_context(layer_level):
    """
    Load context based on layer level (1-3)
    """
    if layer_level >= 1:
        # Essential Context (ALWAYS)
        load_essential_context()
        # - Current role & agent
        # - Current layer & clarity
        # - Last 3 decisions
        # - Pending actions

    if layer_level >= 2:
        # Task-Specific Context (ON-DEMAND)
        load_task_context()
        # - Current IDEA/MODULE/DOMAIN
        # - Traceability links
        # - Related artifacts

    if layer_level >= 3:
        # Historical Context (WHEN NEEDED)
        load_historical_context()
        # - Session summaries
        # - All clarifications
        # - Version history
```

### Strategy 2: Just-in-Time Loading

```python
def load_artifact_jit(artifact_id):
    """
    Load artifact only when explicitly needed
    """
    # Check if already loaded
    if is_loaded(artifact_id):
        update_last_accessed(artifact_id)
        return get_from_context(artifact_id)

    # Check cache first
    if in_cache(artifact_id):
        load_from_cache(artifact_id)
        mark_as_loaded(artifact_id)
        return get_from_context(artifact_id)

    # Load from disk
    artifact = load_from_disk(artifact_id)
    add_to_context(artifact)
    add_to_cache(artifact)
    mark_as_loaded(artifact_id)

    return artifact

# Example usage:
# Boss: "Show IDEA-001 details"
# Agent: load_artifact_jit("IDEA-001")
```

### Strategy 3: Preemptive Loading

```python
def preload_likely_needed_artifacts(current_layer):
    """
    Preload artifacts likely to be needed based on current layer
    """
    if current_layer == 0:  # IDEA layer
        # Likely needed: IDEA files, clarification history
        preload(["current_idea", "clarifications"])

    elif current_layer == 1:  # MODULE layer
        # Likely needed: MODULE files, architecture docs
        preload(["current_modules", "architecture_diagrams"])

    elif current_layer == 2:  # DOMAIN layer
        # Likely needed: DOMAIN models, DDD docs
        preload(["domain_models", "domain_events"])
```

### Strategy 4: Unload When Not Needed

```python
def unload_stale_artifacts(threshold_minutes=30):
    """
    Unload artifacts not accessed recently
    """
    current_time = get_current_time()

    for artifact in get_loaded_artifacts():
        last_access = artifact.get("last_accessed")
        minutes_since_access = (current_time - last_access).minutes

        if minutes_since_access > threshold_minutes:
            # Don't unload essential artifacts (Layer 1)
            if artifact["load_layer"] > 1:
                unload_artifact(artifact["id"])
                save_to_cache(artifact)  # Cache before unloading
```

---

## 🗜️ Compaction Algorithms

### Algorithm 1: Session Summary Compaction

```python
def compact_session_summary(messages, start_index, end_index):
    """
    Compress a range of messages into summary
    Preserves: Decisions, Open Questions, Layer Changes
    Compresses: Tool outputs, Intermediate clarifications
    """
    messages_to_compress = messages[start_index:end_index]

    summary = {
        "range": f"Messages {start_index}-{end_index}",
        "decisions": [],
        "clarifications": [],
        "layer_changes": [],
        "tools_used": {},
        "compressed_tokens": 0,
        "original_tokens": 0
    }

    for msg in messages_to_compress:
        summary["original_tokens"] += count_tokens(msg)

        if is_boss_decision(msg):
            # NEVER compress decisions
            summary["decisions"].append(extract_decision(msg))

        elif is_clarification(msg):
            # Summarize clarifications
            summary["clarifications"].append(summarize_clarification(msg))

        elif is_layer_change(msg):
            # Keep layer changes
            summary["layer_changes"].append(msg)

        elif is_tool_output(msg):
            # Count tools, discard output
            tool = msg["tool_name"]
            summary["tools_used"][tool] = summary["tools_used"].get(tool, 0) + 1

    # Generate compact markdown
    summary_md = generate_summary_markdown(summary)
    summary["compressed_tokens"] = count_tokens(summary_md)
    summary["compression_ratio"] = summary["original_tokens"] / summary["compressed_tokens"]

    return summary_md, summary
```

### Algorithm 2: Preserve-Summarize-Discard

```python
def psd_compaction(context, threshold=0.70):
    """
    Preserve-Summarize-Discard compaction strategy
    """
    if context["window"]["usage_percent"] < threshold:
        return  # No compaction needed

    messages = context["messages"]
    total = len(messages)

    # PRESERVE last 10 messages (full)
    preserve_count = min(10, total)
    preserved = messages[-preserve_count:]

    # PRESERVE all Boss decisions (immutable)
    decisions = [msg for msg in messages if is_boss_decision(msg)]

    # SUMMARIZE middle 80%
    middle_start = 0
    middle_end = total - preserve_count
    summary = compact_session_summary(messages, middle_start, middle_end)

    # DISCARD intermediate tool outputs
    # (Already discarded during summarization)

    # Reconstruct messages
    new_messages = [
        {"role": "system", "content": summary},  # Compressed summary
        *decisions,  # All decisions (preserved)
        *preserved   # Last 10 messages (preserved)
    ]

    context["messages"] = new_messages
    context["window"]["compressions_this_session"] += 1
    context["window"]["last_compaction"] = get_current_timestamp()

    # Recalculate usage
    recalculate_context_usage(context)
```

### Algorithm 3: Adaptive Compression

```python
def adaptive_compress(context):
    """
    Adjust compression aggressiveness based on window usage
    """
    usage = context["window"]["usage_percent"]

    if usage < 50:
        # No compression needed
        return

    elif 50 <= usage < 70:
        # Light compression
        compress_tool_outputs()

    elif 70 <= usage < 80:
        # Medium compression
        compress_tool_outputs()
        summarize_clarifications()

    elif 80 <= usage < 90:
        # Aggressive compression
        compress_tool_outputs()
        summarize_clarifications()
        summarize_middle_messages()

    else:  # usage >= 90
        # Emergency compression
        compress_everything_except_essentials()
        alert_low_context_space()
```

---

## 🔔 Refresh Triggers

### Trigger Configuration

```json
{
  "refresh_triggers": [
    {
      "name": "layer_transition",
      "enabled": true,
      "condition": "current_layer != previous_layer",
      "actions": [
        "unload_previous_layer_details",
        "load_new_layer_templates",
        "update_available_commands",
        "refresh_clarity_tracking"
      ]
    },
    {
      "name": "clarity_significant_change",
      "enabled": true,
      "condition": "abs(current_clarity - previous_clarity) >= 10",
      "actions": [
        "update_context_clarity",
        "refresh_available_actions",
        "update_progress_tracking"
      ]
    },
    {
      "name": "boss_major_decision",
      "enabled": true,
      "condition": "is_boss_decision(message) AND priority == 'high'",
      "actions": [
        "add_to_immutable_decisions",
        "update_project_state",
        "invalidate_outdated_context",
        "save_to_memory"
      ]
    },
    {
      "name": "context_window_threshold",
      "enabled": true,
      "condition": "context_usage_percent > 70",
      "actions": [
        "trigger_compaction",
        "summarize_and_compress",
        "preserve_critical_info"
      ]
    },
    {
      "name": "backtrack_initiated",
      "enabled": true,
      "condition": "command == 'facilitator backtrack'",
      "actions": [
        "restore_historical_context",
        "load_previous_layer_state",
        "reset_clarity_if_needed",
        "invalidate_forward_progress"
      ]
    },
    {
      "name": "session_end",
      "enabled": true,
      "condition": "command == 'facilitator end session'",
      "actions": [
        "full_sync_all_files",
        "create_session_summary",
        "save_context_snapshot",
        "clear_temporary_data"
      ]
    }
  ]
}
```

---

## ✅ Validation Rules

### Rule Set 1: Context Completeness

```python
def validate_context_completeness(context):
    """
    Ensure all required context fields are present and valid
    """
    required_fields = {
        "metadata": ["timestamp", "session_id"],
        "role": ["agent", "agent_id", "mode"],
        "project": ["name", "current_layer", "clarity"],
        "context_window": ["usage_percent", "used_tokens"]
    }

    for section, fields in required_fields.items():
        if section not in context:
            raise ContextValidationError(f"Missing section: {section}")

        for field in fields:
            if field not in context[section]:
                raise ContextValidationError(f"Missing field: {section}.{field}")

    return True
```

### Rule Set 2: Consistency Validation

```python
def validate_context_consistency(context):
    """
    Ensure context state is internally consistent
    """
    # Check loaded artifacts match usage
    loaded_tokens = sum(
        artifact["tokens"]
        for artifact in context["loaded_artifacts"]
        if artifact["loaded"]
    )

    if abs(loaded_tokens - context["context_window"]["used_tokens"]) > 1000:
        raise ContextValidationError("Token count mismatch")

    # Check layer consistency
    current_layer = context["project"]["current_layer"]
    layer_name = context["project"]["layer_name"]

    layer_mapping = {
        0: "IDEA",
        1: "MODULE",
        2: "DOMAIN",
        3: "REQUIREMENT",
        4: "SPECIFICATION",
        5: "CODE"
    }

    if layer_mapping[current_layer] != layer_name:
        raise ContextValidationError(f"Layer mismatch: {current_layer} != {layer_name}")

    return True
```

### Rule Set 3: Boss Decision Preservation

```python
def validate_decisions_preserved(context, original_context):
    """
    Ensure no Boss decisions were lost during compaction
    """
    original_decisions = set(
        dec["id"] for dec in original_context.get("recent_decisions", [])
    )

    current_decisions = set(
        dec["id"] for dec in context.get("recent_decisions", [])
    )

    lost_decisions = original_decisions - current_decisions

    if lost_decisions:
        raise ContextValidationError(f"Lost decisions: {lost_decisions}")

    return True
```

---

## 🧠 Memory Management

### Memory Types

```markdown
## Agent Memory (facilitator-notes.md)

- Active tasks
- Key decisions log
- Open questions
- Boss preferences learned
- Current context summary
- Lessons learned

## Boss Preferences (boss-preferences.md)

- Communication style
- Decision making patterns
- Working hours
- Technical preferences
- Quality standards

## Project Knowledge (project-knowledge.md)

- Domain glossary
- Business rules
- Technical constraints
- Integration points
- Known issues
```

### Memory Update Protocol

```python
def update_agent_memory(event_type, event_data):
    """
    Update agent memory based on events
    """
    memory_path = ".forgemind/memory/facilitator-notes.md"
    memory = load_memory(memory_path)

    if event_type == "boss_decision":
        # Add to immutable decisions log
        memory["decisions"].append({
            "timestamp": event_data["timestamp"],
            "decision": event_data["decision"],
            "rationale": event_data["rationale"]
        })

    elif event_type == "open_question":
        # Track unanswered question
        memory["open_questions"].append(event_data)

    elif event_type == "lesson_learned":
        # Record insight
        memory["lessons"].append(event_data)

    save_memory(memory_path, memory)
```

---

## 🔍 Monitoring Dashboard

```json
{
  "monitoring": {
    "context_health": {
      "status": "healthy",
      "window_usage": 35,
      "loaded_artifacts": 5,
      "decisions_tracked": 15,
      "open_questions": 2,
      "last_compaction": "1 hour ago"
    },
    "session_health": {
      "duration": "2 hours",
      "messages": 42,
      "commands": 12,
      "errors": 0,
      "clarity_progress": "+7%"
    },
    "alerts": []
  }
}
```

---

**Context Management System ensures ForgeMind agents maintain optimal context at all times.**  
**Implement these specifications across all agents for consistent, reliable behavior.**

**Version**: 1.0 (2025-10-27)  
**Status**: Ready for implementation
