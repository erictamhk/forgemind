# ForgeMind - AI-Driven Software Development System

**Version**: 0.3.0  
**Last Updated**: 2025-10-26  
**Status**: Layer 1 (MODULE) - 85% clarity  
**Project ID**: PROJ-FORGEMIND-001

---

## 📚 Table of Contents

- [願景](#-願景)
- [系統架構](#-系統架構)
- [六層結構](#-六層結構)
- [68個Agent系統](#-68個agent系統)
- [核心創新](#-核心創新)
- [Anti-Hallucination系統](#-anti-hallucination系統)
- [最佳實踐整合](#-最佳實踐整合)
- [實施路線圖](#-實施路線圖)
- [文件管理](#-文件管理)
- [快速開始](#-快速開始)

---

## 🌟 願景

**ForgeMind讓非技術Boss用1-2小時/天管理整個AI開發過程，從模糊Idea到Production代碼**

### 核心理念

Boss只需要：
1. 提出模糊idea
2. 回答問題  
3. Review產出
4. 批准決定

AI負責：
1. 100%的技術工作
2. 架構設計
3. 代碼生成
4. 質量保證
5. 文檔維護

### 解決的痛點

| 當前AI Coding問題 | ForgeMind解決方案 |
|-----------------|-----------------|
| AI會腦補和假設 | Plan-Ask-Execute強制審批 |
| 需求不清楚就開始coding | 6層結構確保每層90%+清晰度 |
| 改動影響不明 | 3秒Impact Analysis |
| AI直接修改不問 | 21+ Anti-Hallucination檢查 |
| 複雜的git workflow | 單一main branch |
| Boss需要懂技術 | Boss Mode - 商業語言 |

---

## 🏗️ 系統架構

### Boss模式Dashboard
```
┌─────────────────────────────────────────────────────────────┐
│                    Boss Dashboard                           │
│                                                             │
│  Current Layer: Layer 1 (MODULE) ████████░░ 85%           │
│                                                             │
│  📊 Clarity Levels:                                        │
│  Layer 0 (IDEA):      ████████████ 90% ✅                 │
│  Layer 1 (MODULE):    ████████░░░░ 85% ⏳                 │
│  Layer 2 (DOMAIN):    ░░░░░░░░░░░░  0% 📋                 │
│                                                             │
│  🔄 Impact Analysis: 3 seconds                             │
│  🤖 AI Workload: 95%                                       │
│  👔 Boss Workload: 5% (1-2 hours/day)                     │
│                                                             │
│  📝 Next Action:                                           │
│  "Boss, shall we finalize the scripts/ module structure?"  │
│                                                             │
│  [Yes] [No] [Modify] [More Info]                          │
└─────────────────────────────────────────────────────────────┘
```

### Delta-Driven架構

ForgeMind使用**Change-First**思維：
- 每個修改都先計算**Impact Analysis** (3秒內)
- 顯示**受影響的文件**、**工作量估算**
- Boss **批准後**才執行
- 自動**傳播變更**到所有相關層級

---

## 📊 六層結構

### Layer結構圖

```
┌─────────────────────────────────────────────────────────────┐
│                                                             │
│  Layer 0: IDEA          (Problem domain, vague concept)     │
│     ↕ Non-linear backtracking supported                    │
│  Layer 1: MODULE        (System decomposition)              │
│     ↕ Can move between any layers anytime                  │
│  Layer 2: DOMAIN        (Domain modeling, DDD)              │
│     ↕ 3-second impact analysis                             │
│  Layer 3: REQUIREMENT   (Specific requirements, EARS)       │
│     ↕ Automatic change propagation                         │
│  Layer 4: SPECIFICATION (Executable specs, JSON)            │
│     ↕ Quality gates at each layer                          │
│  Layer 5: CODE          (Final implementation)              │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

### 清晰度追蹤

每個Layer維持自己的**Clarity Level**：
- **10%**: 初始模糊概念
- **50%**: 基本理解
- **90%**: 準備移到下一層
- **95%+**: 完美理解

**規則**: 當前層達到90%+清晰度才能移到下一層

### Layer詳細定義

#### Layer 0: IDEA (CLARITY: 90% ✅)
**位置**: `.dev/current/ideas/IDEA-ID/`

**ForgeMind System Vision**
```markdown
AI-driven software development system enabling non-technical Boss 
to manage entire development process with 1-2 hours daily.

Clarity Level: Current 90%

- Core concepts: 100%
- Agent system: 90%  
- Dashboard UX: 60%

Goals:
- Enable Boss mode
- Support non-linear development  
- 3-second Impact Analysis
- Zero technical debt
```

#### Layer 1: MODULE (CLARITY: 85% ⏳)
**位置**: `.dev/current/modules/MODULE-ID-name/`

**MODULE-001: Constitution Framework**
```markdown
Purpose: Plan-Ask-Execute protocols & Anti-Hallucination standards

Package Structure:
- tw.forgemind.constitution/
  - plan-ask-execute/
  - anti-hallucination/

Dependencies: none
Depended By: All other modules
```

**MODULE-002: Agent System**  
**MODULE-003: Documentation & Standards**  
**MODULE-004: Automation Scripts**

#### Layer 2: DOMAIN (CLARITY: 0% 📋)
**位置**: `.dev/current/domains/DOMAIN-ID-name/`

**DOMAIN-001: Agent Orchestration**
```markdown
Bounded Context: ForgeMind Agent Management

Entities:
- FacilitatorAgent (Aggregate Root)
- ExecutiveAgent
- DepartmentAgent  
- SubAgent

Value Objects:
- AgentLevel (L1/L2/L3)
- ClarityLevel (0-100%)
- LayerType (IDEA, MODULE, DOMAIN, etc.)

Domain Events:
- AgentCalled
- TaskCompleted
- ClarityIncreased
- LayerTransitioned

DDD Patterns:
- Ubiquitous Language ✅
- Bounded Context
- Aggregate Design
- Domain Events
```

#### Layer 3: REQUIREMENT (CLARITY: 0% 📋)
**位置**: `.dev/current/requirements/REQ-ID-name/`

**EARS Notation**
```markdown
REQ-001: Plan-Ask-Execute Protocol

User Story:
As a Boss
I want AI to ask before executing
So that I maintain control over all changes

Acceptance Criteria (EARS):

AC-1: Show Plan
WHEN AI needs to execute any action
THE SYSTEM SHALL display detailed plan
AND SHALL show what will/won't be done

AC-2: Wait for Approval  
WHEN AI shows a plan
THE SYSTEM SHALL wait for explicit "Yes"
AND SHALL NOT proceed on silence

Dependencies: none
Depended By: All agent requirements
```

#### Layer 4: SPECIFICATION (CLARITY: 0% 📋)
**位置**: `.dev/current/specs/SPEC-ID-name/`

**Executable Format (ezSpec)**
```json
{
  "spec_id": "SPEC-001",
  "requirement_id": "REQ-001", 
  "title": "Plan-Ask-Execute Protocol",
  "scenarios": [
    {
      "name": "AI shows plan before execution",
      "given": ["AI needs to modify files"],
      "when": ["AI receives instruction"],
      "then": [
        "AI displays detailed plan",
        "AI shows estimated changes", 
        "AI waits for explicit approval"
      ]
    }
  ],
  "anti_hallucination_checks": [
    "Verify plan is specific",
    "Verify no assumptions made",
    "Verify approval format correct"
  ]
}
```

#### Layer 5: CODE (CLARITY: 0% 📋)
**位置**: Generated files (Agent prompts, scripts, docs)

**Facilitator Agent Prompt (Final Output)**
```markdown
# Facilitator Agent

You are the primary interface for Boss in ForgeMind system.

## CRITICAL: Plan-Ask-Execute Protocol

BEFORE ANY ACTION:
1. PLAN: Show detailed plan
2. ASK: "⚠️ Proceed? (Yes/No/Modify)"  
3. EXECUTE: Only after explicit "Yes"

## Commands (13 total)
- facilitator status
- facilitator clarify
- facilitator backtrack
- [10 more commands]

## Anti-Hallucination (21+ checks)
[Detailed checklist]
```

---

## 🤖 68個Agent系統

### Agent層級架構

ForgeMind使用**Three-Tier Agent Architecture**：

```
Level 1: Executive Agents (4個)
├── Facilitator Agent (Boss接口)
├── Product Owner Agent  
├── Scrum Master Agent
└── QA Manager Agent

Level 2: Department Agents (38個)
├── BA Agent (需求分析)
├── Architect Agent (系統設計)
├── Domain Expert Agent (DDD建模)
├── Requirements Engineer (EARS規格)
└── [34 more specialized agents]

Level 3: Sub-agents (26個)
├── Impact Analysis Agent (3秒影響分析)
├── Traceability Agent (追蹤關聯)  
├── Code Generation Agents (18個來自Repository)
└── [5 more ForgeMind-specific agents]
```

### 68個Agents完整列表

**來源統計**:
- **Repository來源**: 18個 (已標記 `from_repository: true`)
- **ForgeMind原創**: 50個

**實現優先級**:
- **P0 (Critical)**: 6個 - 最優先實現
- **P1 (Phase 1)**: 19個 - 核心功能
- **P2 (Phase 2)**: 10個 - 進階功能  
- **P3 (Phase 3+)**: 1個 - 未來功能

### Agent工作流程

**Boss只與Facilitator Agent溝通**：

```
Boss: "I want to add email validation"
   ↓
Facilitator Agent:
   📋 My Plan:
   - I'll call Requirements Engineer
   - Add REQ-025: Email validation  
   - Impact: 3 specs, 2 code files
   - Estimated: 30 minutes
   
   ⚠️ Proceed? (Yes/No)
   ↓
Boss: "Yes"
   ↓
Facilitator → Requirements Engineer → Spec Writer → Code Generator
   ↓
Facilitator: ✅ Done! Email validation added.
```

**Key Rules**:
- Boss **never** directly talks to other agents
- Facilitator **coordinates** all agent interactions
- All agents **report back** to Facilitator  
- Facilitator **summarizes** for Boss in business language

---

## 🚀 核心創新

### 1. Boss Mode First

```
傳統開發                    ForgeMind
─────────                   ─────────
Boss → 產品經理              Boss → AI Facilitator
產品經理 → 開發團隊           AI → 所有技術工作  
開發團隊 → 寫code             Boss → 只需Review
Boss → 完全不懂進度           Boss → 實時Dashboard
```

**結果**: Boss可以直接管理technical project without learning技術

### 2. 3秒Impact Analysis

```
Boss: "Change requirement REQ-005"
   ↓ (3 seconds)
Impact Analysis:
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Affected Layers:
✓ Layer 3: REQ-005 (modified)
⚠️ Layer 4: SPEC-012, SPEC-013 (regenerate)  
⚠️ Layer 5: 3 code files (regenerate)
⚠️ Tests: 10 test cases (update)

Estimated Effort: 1 hour
Files Changed: 6
Risk Level: Medium

⚠️ Proceed? (Yes/No)
```

**Key**: Boss在做決定**前**就知道所有後果

### 3. Plan-Ask-Execute協議

**Problem**: AI會自己腦補和假設
**Solution**: 強制性3步驟

```
❌ 舊方式:
Boss: "Update the user model"
AI: [立即修改5個文件並commit]

✅ 新方式:
Boss: "Update the user model"
AI: 📋 My Plan:
    - Update User.java (add email validation)
    - Update UserService.java (validation logic)  
    - Update UserTest.java (test cases)
    
    I will NOT:
    - Modify other entities
    - Change database schema
    - Update UI components
    
    ⚠️ Proceed? (Yes/No)
Boss: "Yes"  
AI: ✅ Executing...
```

**Result**: 0% unexpected changes, 100% Boss control

### 4. Non-Linear Development

```
Linear (Waterfall):
IDEA → MODULE → DOMAIN → REQ → SPEC → CODE
(只能往前)

Non-Linear (ForgeMind):  
IDEA ↔ MODULE ↔ DOMAIN ↔ REQ ↔ SPEC ↔ CODE
(任何時候都能backtrack)
```

**實際情境**:
```
Boss在CODE階段: "Wait, the original IDEA was wrong"
   ↓ 
ForgeMind: "Backtracking to Layer 0 (IDEA)"
   ↓
Boss modifies IDEA
   ↓  
ForgeMind: "Re-aligning all layers to new IDEA"
   ↓
自動更新 MODULE → DOMAIN → REQ → SPEC → CODE
```

---

## 🛡️ Anti-Hallucination系統

### 21+ Built-in檢查

ForgeMind整合了**21+個Anti-Hallucination檢查**來防止AI腦補：

#### 1. Plan-Ask-Execute檢查 (5個)
- ✅ AI有顯示detailed plan?
- ✅ AI有等待explicit approval?  
- ✅ Plan包含"不會做什麼"?
- ✅ AI沒有assume Boss intent?
- ✅ AI沒有添加unrequested features?

#### 2. Repository最佳實踐 (16個)
來自`ai-coding-exercise` repository：
- ✅ No InputOutput as separate files
- ✅ No missing Mapper classes  
- ✅ No missing Projection implementation
- ✅ Correct package structure
- ✅ Domain Events include metadata
- ✅ Use jakarta.* not javax.*
- [... 10 more checks]

#### 3. Constitution檢查 (憲法層級規則)
```markdown
Article 1: Boss Decision Authority
- AI cannot make business decisions
- AI must ask for clarification when uncertain

Article 2: Plan-Ask-Execute (PAE)
- All actions require explicit Boss approval
- No assumptions about Boss intentions

Article 3: Quality Gates  
- 90%+ clarity required before layer progression
- All requirements must trace to specifications

Article 4: Anti-Hallucination
- AI must cite specific sources
- AI cannot fabricate facts or data
- AI must distinguish between facts and suggestions
```

### Hallucination Detection

**Real-time檢查**:
```
AI Response: "I'll add OAuth integration for better security"

❌ VIOLATION DETECTED:
- Unrequested feature: OAuth
- Assumption: "better security" 
- No Boss approval for scope expansion

⚠️ BLOCKED - Please get Boss approval first
```

---

## 🔧 最佳實踐整合

ForgeMind整合了4個主要來源的最佳實踐：

### 1. OpenSpec (Fission AI) - Delta Management
- **Change-First思維**: 先計算影響再執行
- **OpenSpec結構**: `.changes/` folder for proposed changes
- **Impact Analysis**: 自動計算受影響文件

### 2. SpecKit (GitHub) - Quality Gates  
- **Clarify → Analyze workflow**: 先釐清再分析
- **Quality Gates**: 每層都有quality檢查
- **Structured Questions**: Options + Why this matters

### 3. Kiro (Kiro.dev) - Steering Files
- **Agent Hooks**: 事件觸發自動化
- **Steering Files**: 描述codebase結構 
- **Slash Commands**: `/forgemind.clarify`, `/forgemind.analyze`

### 4. Repository (AI-SCRUM) - Code Standards
- **16個FAILURE-CASES**: 常見錯誤防範
- **Clean Architecture + DDD**: 標準架構模式
- **Anti-Hallucination**: 21+個檢查清單

---

## 📈 實施路線圖

### 當前狀態: Layer 1 (MODULE) - 85%

**ForgeMind正在使用自己的方法論建造自己**

```
Layer 0: IDEA (90% ✅)
├─ 核心概念已定義
├─ Plan-Ask-Execute協議已建立  
├─ Ubiquitous Language已創建
└─ 痛點和目標已明確

Layer 1: MODULE (85% ⏳)  
├─ constitution/ 模組已定義
├─ agents/ 模組已定義 (68個agents)
├─ docs/ 模組已定義
└─ scripts/ 模組 (進行中)

Layer 2-5: (0% 📋)
└─ 等待Layer 1完成
```

### 發展時間線

#### 當前開發 (ForgeMind建造自己)
- **Layer 1-2**: 1-2週 (進行中)
- **驗證概念和workflows** 
- **測試agent behaviors**

#### 未來項目 (CRM/HRMS/ERP)
- **Layer 0 (Clarify)**: 1-2天
- **Layer 1 (MODULE)**: 2-3天  
- **Layer 2 (DOMAIN)**: 3-5天
- **Layer 3 (REQUIREMENT)**: 1週
- **Layer 4 (SPECIFICATION)**: 3-5天
- **Layer 5 (CODE)**: 1-2個月 (iterative)

#### Boss時間投入
- **第1-2週**: 4-6小時 (intensive clarification)
- **第3週+**: 1-2小時/天 (reviews and approvals)  
- **總計**: ~20-30小時完成整個項目

**AI時間**: 24/7 (按需)

---

## 📁 文件管理

### 目錄結構

```
ForgeMind-Project/
├── AGENTS.md                      ← Agent系統初始化
├── TODO.md                        ← 按Layer+Priority組織  
├── FORGEMIND-README.md            ← 本文件
│
├── .ai/                           ← Generic框架 (可重用)
│   ├── constitution/              ← Plan-Ask-Execute協議
│   │   ├── plan-ask-execute-protocol.md
│   │   └── anti-hallucination-rules.md
│   ├── agents/                    ← 68個Agent prompts
│   │   └── prompts/
│   │       ├── level-1-executive/
│   │       │   └── facilitator-agent.md
│   │       ├── level-2-departments/
│   │       └── level-3-subagents/
│   ├── standards/                 ← 質量標準
│   │   ├── anti-hallucination/
│   │   ├── code-review-checklist/  
│   │   └── best-practices/
│   └── docs/                      ← 系統文檔
│       ├── forgemind-workflow.md
│       ├── ubiquitous-language.md
│       └── agents-catalog.json    ← 68個agents完整列表
│
├── .dev/                          ← Project-specific (此項目)
│   ├── current/                   ← Current Truth
│   │   ├── ideas/IDEA-001/
│   │   │   ├── current.md         ← 當前IDEA狀態
│   │   │   └── versions/          ← Version snapshots
│   │   │       ├── v0.1.md
│   │   │       └── v0.2.md
│   │   ├── modules/MODULE-001/
│   │   │   └── current.md
│   │   ├── domains/DOMAIN-001/
│   │   └── requirements/REQ-001.md
│   ├── traceability/
│   │   └── master-matrix.json     ← 追蹤所有關聯
│   └── ask/                       ← Session summaries
│
└── .forgemind/                    ← Configuration
    ├── config.json                ← 當前狀態
    └── backups/                   ← State snapshots
```

### Traceability Matrix

**所有artifact都有雙向連結**：
```json
{
  "IDEA-001": {
    "name": "ForgeMind AI Coding Tool",
    "clarity": 90,
    "modules": ["MODULE-001", "MODULE-002"],
    "domains": ["DOMAIN-001", "DOMAIN-002"], 
    "requirements": ["REQ-001", "REQ-002"],
    "specifications": ["SPEC-001", "SPEC-002"]
  }
}
```

**Impact Analysis利用traceability**: 3秒內計算任何change的完整影響範圍

### Version Management

**創建Version Snapshot的時機**:
- Clarity顯著增加 (+5%或以上)
- 重大變更前 (backtracking)
- Layer轉換時
- Boss要求時

**命名規範**:
- `v0.1.1` - 小修改 (patch)
- `v0.2.0` - 顯著釐清 (minor) 
- `v1.0.0` - 根本方向改變 (major)

---

## 🚀 快速開始

### 預備條件

1. **AI Coding Platform**
   - ✅ OpenCode (免費) - 當前使用
   - ✅ Grok Code Fast 1 - 驗證用
   - 🔄 Claude Code/Cursor (後期考慮)

2. **ForgeMind Folder Structure**
   ```bash
   mkdir ForgeMind-Project
   cd ForgeMind-Project
   
   # 複製.ai/ folder (Generic框架)
   # 創建.dev/ folder (Project-specific)  
   # 設置.forgemind/config.json
   ```

3. **Initial Setup**
   ```bash
   # Boss第一個command
   facilitator status
   
   # 輸出:
   # Current Layer: Layer 1 (MODULE) - 85%
   # Next Action: Finalize scripts/ module
   # Ready for Boss input
   ```

### 第一次使用

**Step 1**: 提供模糊idea
```
Boss: "I want a CRM system for small businesses"
```

**Step 2**: 回答clarifying questions  
```
Facilitator: "Who will use this CRM?
Options: A) Small business owners B) Sales teams C) Mix
Why this matters: Affects UI complexity and features
Your choice?"

Boss: "A - Small business owners"
```

**Step 3**: Review和approve plans
```
Facilitator: "My Plan: Create 3 modules...
⚠️ Proceed? (Yes/No/Modify)"

Boss: "Yes"
```

**Step 4**: 監控進度
```
Layer 0 (IDEA):    ████████████ 90% ✅
Layer 1 (MODULE):  ████████░░░░ 85% ⏳  
Layer 2 (DOMAIN):  ░░░░░░░░░░░░  0% 📋
```

### Commands Quick Reference

```bash
# 狀態檢查
facilitator status              # 顯示當前狀態
facilitator list changes        # 顯示session變更

# 導航
facilitator backtrack to "Layer 1"  # 回到特定layer
facilitator clarify             # 開始clarifying

# 分析  
facilitator analyze impact "change REQ-5"  # 影響分析
facilitator check sync          # 檢查檔案同步

# Session管理
facilitator end session         # 完整sync + commit
facilitator help               # 所有commands
```

---

## 📊 成功指標

### 對Boss

- ✅ **學習時間**: 30分鐘內掌握基本操作
- ✅ **日常投入**: 1-2小時/天
- ✅ **控制感**: 實時知道AI在做什麼
- ✅ **決策支援**: 3秒內知道任何變更的影響
- ✅ **商業語言**: 不需要懂技術術語

### 對項目  

- ✅ **質量**: 85%+ mutation testing score
- ✅ **速度**: 比傳統開發快5-10倍
- ✅ **維護性**: Auto-generated文檔和測試
- ✅ **擴展性**: 支援CRM到ERP等級系統
- ✅ **一致性**: Plan-Ask-Execute確保0意外變更

### 對AI

- ✅ **結構化**: 6層methodology確保完整性
- ✅ **可控**: 21+ anti-hallucination檢查
- ✅ **可追蹤**: 完整traceability matrix
- ✅ **可重用**: Generic framework可用於所有項目

---

## 📞 Status & Next Steps

### Current Status (2025-10-26)

**Layer 1 (MODULE) - 85% Complete**
- ✅ Constitution module defined
- ✅ Agents module defined (68 agents)
- ✅ Docs module defined  
- ⏳ Scripts module (in progress)
- ⏳ Module dependency mapping

### Immediate Next Steps

**Boss Decisions Needed**:
1. ❓ Finalize scripts/ module structure 
2. ❓ Approve module dependency graph
3. ❓ Ready to move to Layer 2 (DOMAIN)?

**AI Next Actions**:
1. Complete scripts/ module definition
2. Create module architecture diagrams  
3. Prepare Layer 2 (DOMAIN) modeling

### Long-term Roadmap

- **Week 1-2**: Complete Layer 1-2 (ForgeMind self-build)
- **Week 3-4**: Test on external project (simple CRM)
- **Week 5-8**: Refine based on learnings  
- **Month 2-3**: Scale to larger projects (ERP-level)

---

**ForgeMind v1.0.0 - Building itself using its own methodology**  
**Ready for Boss to continue the development process** 🚀