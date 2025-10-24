# Facilitator Agent - File Sync & State Management Prompts

**Version**: 1.0  
**Purpose**: Prompts for handling file state inconsistencies  
**Location**: `.ai/docs/facilitator-file-sync-prompts.md`

---

## 🔍 Problem: Files和工作狀態不同步

當發現以下情況時使用這些prompts:
- Files沒有更新到最新狀態
- 對話中修改的內容未反映在files中
- Config與實際工作不一致
- 遺失了之前的更改

---

## 📋 Prompt Templates

### 1. 檢測狀態不一致

```
facilitator check sync

或更詳細:

Facilitator, I notice that the files may not be in sync with our current work state.

Please check:
1. .forgemind/config.json - Is it up to date?
2. .dev/current/ideas/IDEA-{ID}/current.md - Does it reflect our latest clarifications?
3. .dev/PHASE-{X}-TODO.md - Are completed items marked?
4. Any other files we modified in this session

Report any discrepancies you find.
```

**Expected AI Response**:
```
Checking file synchronization...

Found inconsistencies:
❌ .forgemind/config.json
   - Current in file: clarity: 85%
   - Should be: clarity: 92%
   - Last updated: 2025-10-23T09:52:00
   - Should be: 2025-10-23T14:40:00

❌ .dev/current/ideas/IDEA-001/current.md
   - Missing: Target Users clarification (from today's session)
   - Missing: 6 Pain Points (from today's session)

✅ .dev/PHASE-0-TODO.md
   - Up to date

Would you like me to sync these files now?
```

---

### 2. 請求同步文件

```
facilitator sync files

或更詳細:

Facilitator, please sync all files to match our current work state.

Update:
1. .forgemind/config.json with latest context
2. IDEA-001/current.md with all clarifications from this session
3. Mark completed TODO items
4. Create new version snapshot if needed

Confirm each change before writing.
```

**Expected AI Response**:
```
Syncing files to current state...

1. Updating .forgemind/config.json:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{
  "current_context": {
    "idea": "IDEA-001",
    "phase": 0,
    "layer": 0,
    "clarity": 92  ← Updated from 85
  },
  "metadata": {
    "last_updated": "2025-10-23T14:40:00+08:00"  ← Updated
    "last_session": "2025-10-23T14:40:00+08:00"
    "total_sessions": 2  ← Incremented
  }
}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Proceed? (Yes/No)

2. Updating IDEA-001/current.md:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[ADDED] Target Users section
[ADDED] 6 Pain Points
[MODIFIED] Clarity: 85% → 92%
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Proceed? (Yes/No)

3. No TODO updates needed.

4. Version snapshot recommended (v0.3)?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Changes since v0.2:
- Clarified target users
- Identified 6 pain points
- Clarity +7%
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Create version? (Yes/No)
```

---

### 3. 列出Session中的所有更改

```
facilitator list changes

或更詳細:

Facilitator, please list all changes made during this session that should be reflected in files.

Include:
- What was discussed
- What was clarified
- What decisions were made
- Which files should be updated
```

**Expected AI Response**:
```
Session Changes Summary
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Session: 2025-10-23 13:41 - 14:40 (59 minutes)

Changes Made:
1. ✅ Clarified Target Users
   - Small business owners (50%)
   - Technical founders (30%)
   - Developers (20%)
   
2. ✅ Identified 6 Pain Points
   - Idea模糊，requirements不足
   - 欠缺domain expert
   - AI code缺規則
   - Knowledge變更煩瑣
   - 過早決定難變更
   - AI hallucination問題

3. ✅ Defined Technology Scope
   - Enterprise apps
   - Web/Mobile/API/Microservices

4. ✅ Clarified Success Metrics
   - All quantitative metrics + change management

5. ✅ Simplified Integration
   - Git only, no branching, no CI/CD (Phase 0)

Clarity Progress: 85% → 92% (+7%)

Files to Update:
📄 .forgemind/config.json
   - clarity: 92
   - last_updated: 2025-10-23T14:40:00
   - total_sessions: 2

📄 .dev/current/ideas/IDEA-001/current.md
   - Add Target Users section
   - Add Pain Points section
   - Update clarity percentage
   
📄 .dev/current/ideas/IDEA-001/versions/v0.3.md
   - Create new version snapshot

Would you like me to apply these updates?
```

---

### 4. 回溯到上一個已知狀態

```
facilitator restore from last save

或更詳細:

Facilitator, I think we lost some changes. 

Please restore to the last known good state from:
- Last Git commit, OR
- Last version snapshot, OR
- Last session backup

Then tell me what was lost since then.
```

**Expected AI Response**:
```
Checking last known good states...

Found 3 restore points:
1. ✅ Git commit: "docs: First Facilitator conversation" 
   - Time: 2025-10-23T11:00:00
   - Files: IDEA-001/current.md, PHASE-0-TODO.md
   
2. ✅ Version: IDEA-001/versions/v0.2.md
   - Time: 2025-10-23T10:30:00
   - Clarity: 85%
   
3. ✅ Backup: .forgemind/backups/session-2025-10-23-0930.json
   - Time: 2025-10-23T09:30:00
   - State: Phase 0 start

Most recent is Git commit (1).

Restore to this point? This will:
- Revert IDEA-001/current.md to commit state
- Revert config.json to commit state
- You'll need to redo: Today's clarification session (59 minutes)

Alternative: Let me re-apply the session changes on top of Git commit?
```

---

### 5. 創建當前狀態快照

```
facilitator snapshot current state

或更詳細:

Facilitator, before we make any changes, please snapshot the current state.

Include:
- All files in .forgemind/
- All files in .dev/current/ideas/IDEA-{ID}/
- PHASE-{X}-TODO.md
- Timestamp and session info

This is for safety in case we need to rollback.
```

**Expected AI Response**:
```
Creating state snapshot...

Snapshot: snapshot-2025-10-23-1440.json
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Included files:
✅ .forgemind/config.json
✅ .dev/current/ideas/IDEA-001/current.md
✅ .dev/PHASE-0-TODO.md
✅ Session metadata

Snapshot location: .forgemind/backups/

Content:
- Current Idea state (clarity: 92%)
- Config state
- TODO state
- Session: 2025-10-23 13:41-14:40
- Total size: 45KB

✅ Snapshot created successfully!

You can restore this snapshot anytime with:
facilitator restore snapshot-2025-10-23-1440
```

---

### 6. 對比兩個狀態

```
facilitator compare states

或更詳細:

Facilitator, please compare:
- Current files vs what we discussed in this session
- Current files vs last Git commit
- Current config vs expected config

Show me what's different.
```

**Expected AI Response**:
```
State Comparison
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Comparing: Current Files vs Session Discussion

1. .forgemind/config.json
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
In File          | In Session       | Status
-----------------+------------------+---------
clarity: 85      | clarity: 92      | ❌ OUT OF SYNC
last_updated:    | last_updated:    | ❌ OUT OF SYNC
  10:30:00       |   14:40:00       |
total_sessions:1 | total_sessions:2 | ❌ OUT OF SYNC

2. IDEA-001/current.md
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
In File          | In Session       | Status
-----------------+------------------+---------
Target Users:    | Target Users:    | ❌ MISSING
(empty)          | 3 types defined  |
Pain Points:     | Pain Points:     | ❌ MISSING
(empty)          | 6 identified     |
Clarity: 85%     | Clarity: 92%     | ❌ OUT OF SYNC

3. PHASE-0-TODO.md
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
✅ IN SYNC

Summary:
- 2 files out of sync
- 6 fields need updating
- Recommend: Run 'facilitator sync files'
```

---

### 7. 自動sync模式

```
facilitator enable auto-sync

或更詳細:

Facilitator, please enable auto-sync mode.

After each significant change (clarification, decision, etc.), 
automatically update relevant files without asking me.

Just notify me what was synced.
```

**Expected AI Response**:
```
✅ Auto-sync mode enabled!

From now on, I will automatically sync files after:
- Each clarification (update IDEA current.md)
- Clarity level changes (update config.json)
- TODO completion (update PHASE-X-TODO.md)
- Session end (update all metadata)

I'll show you a notification like:
┌─────────────────────────────────────┐
│ 🔄 Auto-synced:                    │
│ • config.json (clarity → 92%)      │
│ • IDEA-001/current.md (added...)   │
│ • Time: 14:42:15                   │
└─────────────────────────────────────┘

Disable anytime with: facilitator disable auto-sync

Note: This setting is saved in config.json
```

---

### 8. 手動觸發特定文件更新

```
facilitator update IDEA-001/current.md

或更詳細:

Facilitator, please update only IDEA-001/current.md

Include our latest clarifications:
- Target Users
- Pain Points
- Technology Scope
- Success Metrics

Show me the diff before writing.
```

**Expected AI Response**:
```
Updating IDEA-001/current.md...

Diff:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
## Target Users

Small business owners (50%)
- Cannot afford full development team
- Need affordable solution

Technical founders (30%)
+ - Want to accelerate development
+ - Still want control over quality

Developers (20%)
+ - Need assistance on new projects
+ - Refactoring existing code
+ - Adding new features

## Pain Points

1. Idea模糊，requirements模糊又不足
2. 欠缺domain expert
...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Lines added: 47
Lines modified: 3
New clarity: 92%

Proceed with update? (Yes/No)
```

---

### 9. 檢查文件完整性

```
facilitator verify files

或更詳細:

Facilitator, please verify that all required files exist and are valid:
- Check file structure
- Check JSON validity
- Check Markdown format
- Check for missing required fields
```

**Expected AI Response**:
```
Verifying file integrity...

Checking required files:
✅ AGENTS.md (root)
✅ .forgemind/config.json
✅ .ai/agents/prompts/level-1-executive/facilitator-agent.md
✅ .dev/current/ideas/IDEA-001/current.md
✅ .dev/PHASE-0-TODO.md
✅ FORGEMIND-README.md
✅ ARTIFACT-MANIFEST.md

Checking JSON validity:
✅ .forgemind/config.json - Valid JSON
✅ exports/forgemind_knowledge_base.json - Valid JSON
✅ .ai/docs/agents-catalog.json - Valid JSON

Checking Markdown format:
✅ All .md files - Valid Markdown
✅ No broken links found

Checking required fields:
✅ config.json has all required fields
✅ IDEA-001/current.md has all required sections

✅ All files are valid and complete!
```

---

### 10. Session結束時的完整同步

```
facilitator end session

或更詳細:

Facilitator, we're ending this session. 

Please do a complete sync:
1. Update all files with session changes
2. Create version snapshot
3. Git commit (if needed)
4. Update config with session end time
5. Generate session summary

Confirm before each action.
```

**Expected AI Response**:
```
Ending session and syncing...

Session Summary:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Start: 2025-10-23 13:41:00
End:   2025-10-23 14:40:00
Duration: 59 minutes

Actions completed:
1. ✅ Clarified 5 areas
2. ✅ Clarity: 85% → 92%
3. ✅ Answered 5 questions
4. ✅ Made 3 decisions

Sync checklist:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[ ] 1. Update IDEA-001/current.md
    Changes: Target Users, Pain Points, +47 lines
    Proceed? (Yes/No)

[ ] 2. Create version v0.3
    Reason: Significant clarifications (+7% clarity)
    Proceed? (Yes/No)

[ ] 3. Git commit
    Message: "docs: Clarify IDEA-001 target users and pain points
    
    - Defined 3 target user types
    - Identified 6 core pain points
    - Clarity: 85% → 92%
    
    Phase 0 Week 1 Day 1"
    Proceed? (Yes/No)

[ ] 4. Update config.json
    - last_session: 2025-10-23T14:40:00
    - total_sessions: 2
    Proceed? (Yes/No)

[ ] 5. Generate session summary
    Save to: .dev/ask/2025-10-23-session-summary.md
    Proceed? (Yes/No)

Type 'Yes' to proceed with all, or 'Skip' to skip any step.
```

---

## 🎯 最佳實踐

### 何時使用這些Prompts

1. **每次session開始**: `facilitator check sync`
2. **做重要決定後**: `facilitator snapshot current state`
3. **感覺不對勁時**: `facilitator compare states`
4. **Session結束時**: `facilitator end session`
5. **長session中間**: `facilitator sync files` (每30分鐘)

### 預防措施

```
facilitator enable auto-sync        # 在session開始時
facilitator snapshot current state  # 在做大改動前
facilitator verify files           # 定期檢查
```

### 救援措施

```
facilitator list changes           # 看看做了什麼
facilitator restore from last save # 如果搞砸了
facilitator compare states         # 確認差異
```

---

## 🔧 在Facilitator Agent Prompt中加入

在facilitator-agent.md中加入這個section:

```markdown
### File Synchronization

You MUST keep files in sync with conversation state:

1. **Auto-detect inconsistencies**:
   - After each significant change, check if files match
   - Notify Boss if sync is needed

2. **Respond to sync commands**:
   - `facilitator check sync` - Check all files
   - `facilitator sync files` - Update all files
   - `facilitator list changes` - Show session changes
   
3. **Proactive sync**:
   - Suggest sync when Boss says "let's stop"
   - Remind Boss to commit at session end
   
4. **Safety first**:
   - Always show diff before writing
   - Create snapshots before major changes
   - Confirm destructive operations
```

---

## 📝 Quick Reference Card

```
╔════════════════════════════════════════════════════════════╗
║ Facilitator File Sync Commands                            ║
╠════════════════════════════════════════════════════════════╣
║                                                            ║
║ Check:                                                     ║
║  • facilitator check sync      - Check all files          ║
║  • facilitator compare states  - Compare differences      ║
║  • facilitator verify files    - Verify integrity         ║
║                                                            ║
║ Sync:                                                      ║
║  • facilitator sync files      - Sync all files           ║
║  • facilitator update {file}   - Update specific file     ║
║  • facilitator list changes    - Show session changes     ║
║                                                            ║
║ Safety:                                                    ║
║  • facilitator snapshot        - Create snapshot          ║
║  • facilitator restore         - Restore from snapshot    ║
║                                                            ║
║ Session:                                                   ║
║  • facilitator end session     - Complete sync at end     ║
║  • facilitator enable auto-sync - Auto sync mode          ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝
```

---

**這些prompts確保Boss和Facilitator Agent之間的文件狀態始終一致！** 🎯
