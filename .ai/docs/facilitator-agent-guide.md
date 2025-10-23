# Facilitator Agent - Quick Reference Guide

**Version**: 1.0  
**For**: Boss Users  
**Location**: `.ai/docs/facilitator-agent-guide.md`

---

## 🎯 What is Facilitator Agent?

Facilitator Agent是ForgeMind的核心Agent，是Boss與整個系統的主要接口。它會：
- 引導你理解和完善Idea
- 用結構化問題幫你clarify
- 追蹤clarity進度
- 自動更新文檔
- 執行各種command

---

## 🚀 Quick Start

### 啟動Facilitator Agent

```bash
# 在項目根目錄
opencode

# 或其他AI編碼工具
```

### 第一個Prompt

```
I want you to act as the Facilitator Agent.

Context:
- Project: {你的項目名}
- Current Idea: IDEA-001
- Phase: 0
- Clarity: 85%

Please read:
- .dev/current/ideas/IDEA-001/current.md
- FORGEMIND-README.md
- .dev/PHASE-0-TODO.md

Then follow the Facilitator Agent prompt in:
.ai/agents/prompts/level-1-executive/facilitator-agent.md

Let's start!
```

---

## 📋 All Commands

### 💬 Conversation Commands

#### `facilitator clarify`
開始Clarify session，用結構化問題幫你refine Idea

**Example**:
```
facilitator clarify
```

**What happens**:
1. AI讀取當前Idea
2. 識別3-5個需要clarify的地方
3. 逐個問結構化問題
4. 追蹤clarity進度
5. 最後給summary

---

#### `facilitator status`
查看當前項目狀態

**Example**:
```
facilitator status
```

**Shows**:
- 當前Idea和Phase
- 5層的clarity levels
- 最近activity
- Phase進度

---

#### `facilitator help`
顯示所有可用commands

**Example**:
```
facilitator help
```

---

### 📝 Documentation Commands

#### `facilitator update idea`
更新當前Idea的文檔

**Example**:
```
facilitator update idea
```

**What happens**:
1. AI生成更新後的內容
2. 顯示diff給你看
3. 你確認後寫入文件

**Output**: `.dev/current/ideas/IDEA-{ID}/current.md`

---

#### `facilitator new version`
創建新的Idea version snapshot

**Example**:
```
facilitator new version
```

**What happens**:
1. 確定version number (v0.2, v0.3...)
2. 複製current.md with version info
3. 添加changelog

**Output**: `.dev/current/ideas/IDEA-{ID}/versions/v{X}.{Y}.md`

**Version Logic**:
- **Patch** (v1.0.1): 小改動
- **Minor** (v1.1.0): 重要clarification
- **Major** (v2.0.0): 方向性改變

---

#### `facilitator new idea`
創建全新的Idea (IDEA-002等)

**Example**:
```
facilitator new idea
```

**What happens**:
1. 創建新文件夾和文件
2. 引導你填基本信息
3. 初始clarity: 10%

**Output**: `.dev/current/ideas/IDEA-{XXX}/`

---

### 🔄 Git Commands

#### `facilitator git commit`
提交當前更改到Git

**Example**:
```
facilitator git commit
```

**What happens**:
1. 檢查changed files
2. 生成commit message
3. 顯示給你確認
4. 執行git commands

**Commit Format**:
```
docs: Refine IDEA-001 with user clarifications

- Clarified target users
- Identified 6 pain points
- Updated clarity: 85% → 92%

Phase 0 Week 1 Day 1
```

---

### 📋 Task Management Commands

#### `facilitator update todo`
更新Phase TODO清單

**Example**:
```
facilitator update todo
```

**What happens**:
1. 讀取當前TODO
2. 標記完成的items為 [x]
3. 更新進度percentage

**Output**: `.dev/PHASE-{X}-TODO.md`

---

#### `facilitator fill learning log`
填寫Learning Log

**Example**:
```
facilitator fill learning log
```

**What happens**:
1. AI問你幾個問題
2. 生成learning log
3. 保存文件

**Output**: `.dev/lessons/{DATE}-learning-log.md`

---

#### `facilitator regenerate agent-catalog`
從JSON生成agents catalog markdown

**Example**:
```
facilitator regenerate agent-catalog
```

**What happens**:
1. 讀取.ai/docs/agents-catalog.json
2. 生成markdown格式的catalog
3. 保存到.ai/docs/agents-catalog.md

**Output**: `.ai/docs/agents-catalog.md`

---

#### `facilitator update config`
更新.forgemind/config.json配置

**Example**:
```
facilitator update config
```

**What happens**:
1. AI問你要更新什麼
2. 你指定要更新的字段和值
3. AI更新config.json文件
4. 顯示更新結果

**Example interaction**:
```
You: facilitator update config
AI: What would you like to update in .forgemind/config.json?
   Current config: {"project_name": "ForgeMind", "current_idea": "IDEA-001", "current_phase": 0, "default_agent": "facilitator"}

   What field to update? (project_name, current_idea, current_phase, default_agent, or other)

You: current_phase to 1
AI: Updated .forgemind/config.json:
   - current_phase: 0 → 1
   ✅ Config updated successfully
```

---

### 🔀 Navigation Commands

#### `facilitator switch {IDEA-ID}`
切換到另一個Idea

**Example**:
```
facilitator switch IDEA-002
```

**What happens**:
1. 載入新的Idea context
2. 顯示Idea信息
3. 準備好工作

---

#### `facilitator list ideas`
列出所有Ideas

**Example**:
```
facilitator list ideas
```

**Shows**:
- 所有Idea IDs
- 每個的clarity %
- Current status

---

### 📊 Analysis Commands

#### `facilitator analyze`
分析當前Idea質量

**Example**:
```
facilitator analyze
```

**Shows**:
- Clarity breakdown
- Potential issues
- Missing information
- Quality score

---

#### `facilitator suggest`
建議下一步

**Example**:
```
facilitator suggest
```

**Shows**:
- 推薦的actions
- 需要clarify的areas
- Next milestones

---

## 💡 Usage Examples

### Example 1: 第一次Clarify Session

```
You: facilitator clarify

AI: Starting Clarify session for IDEA-001...
    Current Clarity: 85%
    Target: 95%
    
    I've identified 5 areas needing clarification:
    1. Target user specifics
    2. Pain point priorities
    3. Success metrics
    4. Technology scope
    5. Integration strategy
    
    Let's start with the first one...
    
    🤔 Clarification Needed: Target User Specifics
    
    Who exactly is the "non-technical Boss"?
    
    Options:
    A. Small business owner (zero technical background)
    B. Startup founder (technical background, no time to code)
    C. Product manager (some technical knowledge)
    D. Enterprise executive (manages technical teams)
    E. Mix of above
    
    Why this matters:
    - Affects UI complexity
    - Determines language to use
    - Influences feature priority
    
    Your choice?

You: E - Mix of above. Mainly small business owners and technical founders.

AI: ✅ Clarified: Target Users
    
    Updated Clarity: 85% → 88% (+3%)
    
    Shall we continue to the next area?

[Continue...]
```

---

### Example 2: Update Idea After Clarify

```
You: facilitator update idea

AI: Updating IDEA-001/current.md...
    
    Changes to be made:
    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    [ADDED]
    + Target Users: 
      - Small business owners (50%)
      - Technical founders (30%)
      - Developers (20%)
    
    [MODIFIED]
    ~ Clarity: 85% → 92%
    ~ Pain Points: Added 6 specific pain points
    
    ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
    
    Proceed? (Yes/No)

You: Yes

AI: ✅ Updated IDEA-001/current.md
    
    [Shows full updated content]
    
    Next: Would you like me to:
    - Create a new version (v0.3)?
    - Commit to Git?
    - Update TODO?
    - All of the above?

You: All of the above

AI: [Executes all three commands]
```

---

### Example 3: Backtracking

```
You: Wait, I want to change my answer about target users.
     Actually, I want to focus on developers only.

AI: 🔄 Backtracking to: Target Users
    
    Your previous answer: Mix (Small business + Technical founders + Developers)
    You want to change to: Developers only
    
    Let me analyze the impact...
    
    Impact Analysis:
    - Affects: Pain Points (2 items)
    - Affects: Technology Scope (Backend focus)
    - Affects: Success Metrics (Different metrics)
    - Clarity change: 92% → 88% (need to re-clarify affected areas)
    
    Do you want to proceed? (Yes/No)

You: Yes

AI: ✅ Updated Target Users
    ✅ Propagated changes
    
    Affected areas now need re-clarification:
    1. Pain Points (for developers specifically)
    2. Technology Scope (developer tools)
    
    Would you like to clarify these now?
```

---

## 🎓 Best Practices

### 1. Regular Clarify Sessions
```
建議: 每週至少1次clarify session
目標: 每次提升5-10% clarity
```

### 2. Version Snapshots
```
建議: 重大clarification後創建version
目的: 可以回溯查看evolution
```

### 3. Git Commits
```
建議: 每個session後commit
格式: 使用AI生成的commit message
```

### 4. Learning Logs
```
建議: 每次對話後填寫
價值: 積累經驗，改進prompt
```

---

## 🔧 Troubleshooting

### Problem: AI不理解command

**Solution**:
```
Use full command format:
"I want you to execute the command: facilitator clarify"

Or explain what you want:
"Please start a clarify session for the current Idea"
```

---

### Problem: AI用英文回答但你用中文

**Solution**:
```
Explicitly request:
"請用中文回答 (Please respond in Chinese)"

或在第一個prompt加入:
"Use Chinese language for all responses"
```

---

### Problem: Clarity tracking不準確

**Solution**:
```
Ask AI to show calculation:
"Please show how you calculated the clarity increase"

Or request adjustment:
"I think the clarity should be X% because..."
```

---

### Problem: AI問題太技術性

**Solution**:
```
Tell AI:
"Please simplify - I'm not technical. 
Use simpler language and explain technical terms."
```

---

## 📁 File Structure

Facilitator Agent會操作這些文件：

```
.dev/
├── current/
│   └── ideas/
│       └── IDEA-{ID}/
│           ├── current.md          ← facilitator update idea
│           └── versions/
│               └── v{X}.{Y}.md     ← facilitator new version
│
├── lessons/
│   └── {DATE}-learning-log.md      ← facilitator fill learning log
│
└── PHASE-{X}-TODO.md                ← facilitator update todo
```

---

## 🎯 Success Indicators

你的session成功如果：
- [ ] Clarity提升了至少5%
- [ ] 所有問題都能回答
- [ ] 你感到被引導而非困惑
- [ ] 文檔被正確更新
- [ ] 你知道下一步要做什麼

---

## 💡 Pro Tips

### Tip 1: 使用縮寫
```
Instead of: "facilitator clarify"
You can say: "clarify"

AI會理解的縮寫:
- clarify, status, help
- update idea, new version
- git commit, update todo
```

### Tip 2: 自然對話
```
You don't need exact commands!
Just talk naturally:

"Let's clarify the Idea"
"Update the Idea document"
"Commit this to Git"

AI會理解你的intent
```

### Tip 3: 組合commands
```
"Clarify, then update idea, then commit"

AI會依序執行
```

### Tip 4: 隨時backtrack
```
"Go back to [topic]"
"Change my answer about [topic]"
"I want to reconsider [decision]"

這是ForgeMind的killer feature!
```

---

## 📞 Need Help?

如果Facilitator Agent無法處理：
- 它會defer給其他Agent
- 或告訴你需要什麼額外信息
- 或承認不知道（不會hallucinate）

---

## 🔗 Related Documentation

- **Full Prompt**: `.ai/agents/prompts/level-1-executive/facilitator-agent.md`
- **Anti-Hallucination Guide**: `.ai/standards/anti-hallucination/`
- **5-Layer Structure**: `.ai/standards/domain-theory/five-layer-structure.md`
- **Phase 0 Guide**: `PHASE-0-CONVERSATION-GUIDE.md`

---

## ✅ Checklist for First Use

- [ ] Facilitator Agent prompt已放在 `.ai/agents/prompts/level-1-executive/`
- [ ] IDEA-001/current.md存在
- [ ] FORGEMIND-README.md存在
- [ ] PHASE-0-TODO.md存在
- [ ] 已啟動AI編碼工具 (OpenCode/Cursor/etc.)
- [ ] 已給第一個prompt
- [ ] AI理解它是Facilitator Agent
- [ ] 開始第一個clarify session!

---

**準備好開始了！ 🚀**

記住：
- Facilitator Agent是你的助手，不是老闆
- 隨時ask clarifying questions
- 隨時backtrack和change answers
- 記錄learnings
- 享受這個過程！

**Good luck!** 🍀
