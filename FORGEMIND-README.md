# ForgeMind - AI-Driven Software Development System

> **Version**: 0.2.1 (Updated Implementation Plan)
> **Last Updated**: 2025-10-23 22:00 HKT
> **Status**: 🚧 Phase 0 - Ready to Start  
> **Project ID**: PROJ-FORGEMIND-001

---

## 📋 目錄

- [願景](#-願景)
- [系統架構](#-系統架構)
- [五層結構](#-五層結構)
- [68個Agent系統](#-68個agent系統)
- [核心創新](#-核心創新)
- [Anti-Hallucination系統](#-anti-hallucination系統)
- [最佳實踐整合](#-最佳實踐整合)
- [實施路線圖](#-實施路線圖)
- [文件管理](#-文件管理)
- [待決定事項](#-待決定事項)
- [快速開始](#-快速開始)

---

## 🎯 願景

**ForgeMind**是一個創新的AI驅動軟件開發系統，旨在讓**Boss（非技術背景）**每天只需1-2小時決策，AI處理所有複雜性，實現從Idea到Production的完整自動化流程。

### 核心價值主張

1. **Boss模式** - Boss提供商業決策，AI執行一切技術細節
2. **非線性開發** - 隨時回溯任何階段，3秒完成Impact Analysis
3. **零技術債** - AI自動維護一致性，雙向追溯
4. **質量保證** - 21+個Anti-Hallucination檢查
5. **漸進投資** - $0 → $80 → $960 → 按需擴展

### 解決的問題

| 傳統開發問題 | ForgeMind解決方案 |
|------------|-----------------|
| 需求模糊不清 | Clarity Level追蹤 (10% → 95%) |
| 頻繁返工 | 非線性回溯 + Delta格式 |
| 文檔過期 | Spec與Code雙向同步 |
| AI編造內容 | 21+個Anti-Hallucination檢查 |
| Boss看不懂代碼 | Boss Dashboard + 自然語言 |
| 開發成本高 | AI處理100%複雜性 |

---

## 🏗️ 系統架構

### 完整文件結構

```
ForgeMind-v0.2.0/
├── README.md                                    ← 快速入門
├── FORGEMIND-README.md                          ← 本文件
├── CHANGELOG.md                                 ← 版本歷史
│
├── .ai/                                         ← Generic Framework (通用)
│   ├── constitution/                            ← 項目憲法
│   │   ├── project-principles.md               ← 核心原則
│   │   ├── development-guidelines.md           ← 開發指南
│   │   ├── security-requirements.md            ← 安全要求
│   │   └── design-system.md                    ← 設計系統
│   │
│   ├── agents/                                  ← 68個Agent
│   │   └── prompts/
│   │       ├── level-1-executive/              ← 4個Executive
│   │       │   ├── facilitator-agent.md        ← Boss模式核心
│   │       │   ├── product-owner-agent.md
│   │       │   ├── scrum-master-agent.md
│   │       │   └── qa-manager-agent.md
│   │       │
│   │       ├── level-2-departments/            ← 38個Department
│   │       │   ├── ba-agent.md                 ← 需求收集
│   │       │   ├── architect-agent.md          ← 架構設計
│   │       │   ├── requirements-engineer.md    ← 規格撰寫
│   │       │   ├── domain-expert-agent.md      ← DDD專家
│   │       │   ├── qa-agent.md                 ← 質量保證
│   │       │   └── [33 more agents].md
│   │       │
│   │       └── level-3-subagents/              ← 26個Sub-agent
│   │           ├── command-agent.md            ← CQRS Command
│   │           ├── query-agent.md              ← CQRS Query
│   │           ├── aggregate-agent.md          ← DDD Aggregate
│   │           ├── controller-agent.md         ← REST API
│   │           ├── test-agent.md               ← 測試生成
│   │           ├── review-agent.md             ← Code Review
│   │           ├── impact-analysis-agent.md    ← Impact分析
│   │           ├── traceability-agent.md       ← 追溯管理
│   │           └── [18 more agents].md
│   │
│   ├── standards/                               ← 標準與規範
│   │   ├── anti-hallucination/
│   │   │   ├── 5-patterns.md                   ← ForgeMind原創
│   │   │   ├── FAILURE-CASES.md                ← Repository 16案例
│   │   │   └── anti-hallucination-checks.md    ← 21+檢查清單
│   │   │
│   │   ├── domain-theory/
│   │   │   ├── three-layers.md                 ← Domain三層理論
│   │   │   ├── clarity-spectrum.md             ← Clarity追蹤
│   │   │   └── five-layer-structure.md         ← 5層結構詳解
│   │   │
│   │   └── output-formats/
│   │       ├── executable-spec-format.md       ← ezSpec (BDD)
│   │       ├── machine-readable-format.md      ← JSON格式
│   │       └── ears-notation.md                ← EARS需求格式
│   │
│   ├── templates/                               ← Code Templates
│   │   ├── aggregate/
│   │   │   ├── aggregate-template.java         ← Aggregate Root
│   │   │   ├── domain-event-template.java      ← Domain Event
│   │   │   └── value-object-template.java      ← Value Object
│   │   ├── usecase/
│   │   │   ├── command-template.java           ← Command UseCase
│   │   │   ├── query-template.java             ← Query UseCase
│   │   │   └── usecase-interface-template.java ← Interface
│   │   ├── controller/
│   │   │   ├── controller-template.java        ← REST Controller
│   │   │   └── api-error-template.java         ← Error Handling
│   │   └── test/
│   │       ├── ezspec-test-template.java       ← ezSpec BDD
│   │       ├── mockmvc-test-template.java      ← MockMvc
│   │       └── rest-assured-template.java      ← REST Assured
│   │
│   ├── steering/                                ← 項目上下文 (Kiro)
│   │   ├── structure.md                        ← Codebase結構 (自動生成)
│   │   ├── tech.md                             ← Tech Stack (自動生成)
│   │   └── product.md                          ← Business Context (自動生成)
│   │
│   ├── scripts/                                 ← 自動化腳本
│   │   ├── auto-commit.py                      ← 自動Git commit
│   │   ├── analyze-impact.py                   ← Impact Analysis
│   │   ├── check-traceability.py               ← 追溯性檢查
│   │   ├── update-dashboard.py                 ← Dashboard更新
│   │   └── generate-steering.py                ← Steering生成
│   │
│   ├── hooks/                                   ← Agent Hooks (Kiro)
│   │   ├── on-idea-updated.hook                ← Idea變更時觸發
│   │   ├── on-requirement-created.hook         ← Requirement新增時
│   │   ├── on-spec-approved.hook               ← Spec批准時
│   │   └── on-code-generated.hook              ← Code生成時
│   │
│   └── docs/                                    ← AI文檔
│       ├── ARCHITECTURE.md                     ← 架構說明
│       ├── AGENT-CATALOG.md                    ← 68個Agent目錄
│       ├── WORKFLOW.md                         ← 工作流程
│       ├── ANTI-HALLUCINATION-GUIDE.md         ← 防腦補指南
│       └── BEST-PRACTICES.md                   ← 最佳實踐
│
├── .dev/                                        ← Project Specific (項目)
│   ├── current/                                ← Current Truth (OpenSpec)
│   │   ├── ideas/
│   │   │   └── IDEA-001/
│   │   │       ├── current.md                  ← 當前Idea
│   │   │       ├── versions/                   ← 歷史版本
│   │   │       │   ├── v0.1-initial.md
│   │   │       │   ├── v0.2-refined.md
│   │   │       │   └── v0.3-validated.md
│   │   │       └── CHANGELOG.md                ← 變更日誌
│   │   │
│   │   ├── modules/
│   │   │   ├── MODULE-001-core-framework/
│   │   │   │   ├── current.md                  ← 模組定義
│   │   │   │   └── dependency-graph.json       ← 依賴圖
│   │   │   ├── MODULE-002-agent-system/
│   │   │   └── MODULE-003-boss-dashboard/
│   │   │
│   │   ├── domains/
│   │   │   ├── DOMAIN-001-five-layer/
│   │   │   │   └── bounded-context.md          ← Bounded Context
│   │   │   ├── DOMAIN-002-traceability/
│   │   │   ├── DOMAIN-003-anti-hallucination/
│   │   │   ├── DOMAIN-004-agent-orchestration/
│   │   │   ├── DOMAIN-005-prompt-management/
│   │   │   └── DOMAIN-006-dashboard-ui/
│   │   │
│   │   ├── requirements/
│   │   │   ├── REQ-001-idea-management/
│   │   │   │   ├── current.md                  ← EARS Notation
│   │   │   │   └── versions/
│   │   │   ├── REQ-002-module-management/
│   │   │   ├── REQ-003-impact-analysis/
│   │   │   ├── REQ-004-facilitator-agent/
│   │   │   └── REQ-005-traceability-matrix/
│   │   │
│   │   └── specs/
│   │       ├── SPEC-001-idea-crud/
│   │       │   ├── executable/
│   │       │   │   └── spec.spec               ← ezSpec (BDD)
│   │       │   └── json/
│   │       │       └── spec.json               ← JSON格式
│   │       ├── SPEC-002-impact-analysis/
│   │       └── SPEC-003-facilitator-workflow/
│   │
│   ├── changes/                                ← Proposed Changes (OpenSpec)
│   │   └── CHANGE-001-example/
│   │       ├── proposal.md                     ← Why (為什麼改)
│   │       ├── impact.md                       ← Impact Analysis
│   │       ├── tasks.md                        ← How (怎麼實施)
│   │       └── deltas/                         ← What changed (Delta)
│   │           ├── ideas/
│   │           │   └── IDEA-001-delta.md
│   │           ├── requirements/
│   │           │   └── REQ-001-delta.md
│   │           └── specs/
│   │               └── SPEC-001-delta.md
│   │
│   ├── traceability/                           ← 追溯性系統
│   │   ├── master-matrix.json                  ← 追溯矩陣
│   │   ├── impact-cache.json                   ← Impact緩存
│   │   └── dependency-graph.json               ← 依賴圖
│   │
│   ├── dashboards/                             ← Boss Dashboard
│   │   └── boss-dashboard.md                   ← Boss每天必看
│   │
│   ├── ask/                                    ← 對話記錄
│   │   └── 2025-10-22-initial-design.md
│   │
│   └── lessons/                                ← 項目經驗
│       ├── phase-0-learnings.md
│       └── hallucination-incidents.md
│
├── research/                                    ← 研究資料
│   ├── tools-analysis/
│   │   ├── openspec-analysis.md                ← OpenSpec研究
│   │   ├── speckit-analysis.md                 ← SpecKit研究
│   │   ├── kiro-analysis.md                    ← Kiro研究
│   │   └── repository-analysis.md              ← Repository研究
│   │
│   ├── platform-evaluation/
│   │   ├── claude-code-evaluation.md
│   │   ├── cursor-evaluation.md
│   │   ├── opencode-evaluation.md
│   │   └── comparison-matrix.md                ← 6平台對比
│   │
│   └── reference-materials/                    ← 參考資料
│       ├── SUB-AGENT-SYSTEM.md                 ← From Repository
│       ├── FAILURE-CASES.md                    ← From Repository
│       ├── CODE-TEMPLATES.md                   ← From Repository
│       ├── DIRECTORY-RULES.md                  ← From Repository
│       └── COMMON-PITFALLS.md                  ← From Repository
│
├── plans/                                       ← 計劃文檔
│   ├── phase-0-plan.md                         ← Phase 0詳細
│   ├── phase-1-plan.md                         ← Phase 1詳細
│   ├── phase-2-plan.md                         ← Phase 2詳細
│   ├── phase-3-plan.md                         ← Phase 3詳細
│   └── roadmap.md                              ← 完整路線圖
│
└── exports/                                     ← 導出資料 (JSON)
    ├── forgemind_knowledge_base.json           ← 完整知識庫
    ├── forgemind_integration_complete.json     ← 整合策略
    ├── forgemind_platform_evaluation.json      ← 平台評估
    ├── forgemind_phase0_opencode_grok.json     ← Phase 0計劃
    ├── spec_driven_tools_analysis.json         ← Spec-Driven研究
    ├── forgemind_summary.json                  ← 項目總結
    └── forgemind_file_manifest.json            ← 文件清單
```

---

## 🧬 五層結構

ForgeMind的核心是**五層結構**，每層獨立管理，支持非線性回溯。

### Layer 0: Idea (商業想法)

**目的**: 捕捉商業願景，追蹤Clarity Level

**ID格式**: `IDEA-{3位數字}`

**文件位置**: `.dev/current/ideas/IDEA-{ID}/`

**內容**:
```markdown
# IDEA-001: ForgeMind System

## Vision
AI-driven software development system enabling non-technical Boss 
to manage entire development process with 1-2 hours daily.

## Clarity Level
Current: 85%
- Core concepts: 100%
- Agent system: 90%
- Dashboard UX: 60%

## Goals
- Enable Boss mode
- Support non-linear development
- 3-second Impact Analysis
- Zero technical debt

## Modules
- MODULE-001: Core Framework
- MODULE-002: Agent System
- MODULE-003: Boss Dashboard
```

**Clarity追蹤**:
- 初始: 10% (模糊想法)
- Discovery後: 40%
- Modules識別: 50%
- Requirements收集: 70%
- Specifications完成: 90%
- Implementation後: 95%+

### Layer 1: Module (功能模組)

**目的**: Package-level組織，管理依賴

**ID格式**: `MODULE-{3位數字}`

**文件位置**: `.dev/current/modules/MODULE-{ID}-{name}/`

**內容**:
```markdown
# MODULE-001: Core Framework

## Purpose
5層結構管理、追溯性系統、Anti-Hallucination

## Package Structure
tw.forgemind.core/
├── fivelayer/
├── traceability/
└── hallucination/

## Domains
- DOMAIN-001: Five Layer Management
- DOMAIN-002: Traceability System
- DOMAIN-003: Anti-Hallucination

## Dependencies
(none - 基礎Module)

## Depended By
- MODULE-002 (Agent System)
- MODULE-003 (Boss Dashboard)
```

**依賴管理**:
- 自動生成依賴圖
- 檢測循環依賴
- Impact Analysis基礎

### Layer 2: Domain (DDD Bounded Context)

**目的**: 定義Bounded Context，領域邊界

**ID格式**: `DOMAIN-{3位數字}`

**文件位置**: `.dev/current/domains/DOMAIN-{ID}-{name}/`

**內容**:
```markdown
# DOMAIN-001: Five Layer Management

## Bounded Context

### Entities
- Idea (Aggregate Root)
- Module
- Domain
- Requirement
- Specification

### Value Objects
- ClarityLevel
- LayerType
- Status

### Domain Events
- IdeaCreated
- IdeaClarityIncreased
- ModuleIdentified
- DomainDefined
- RequirementCollected
- SpecificationApproved

### Aggregates
- Idea Aggregate (manages entire 5-layer structure)

### Relationships
- Idea 1:N Module
- Module 1:N Domain
- Domain 1:N Requirement
- Requirement 1:N Specification
```

**DDD原則**:
- Ubiquitous Language
- Bounded Context隔離
- Aggregate一致性邊界
- Domain Events溝通

### Layer 3: Requirement (功能需求)

**目的**: 用戶故事 + EARS Notation

**ID格式**: `REQ-{3位數字}`

**文件位置**: `.dev/current/requirements/REQ-{ID}-{name}/`

**EARS Notation**:
```markdown
# REQ-001: Idea Management

## User Story
As a Boss
I want to create and refine ideas
So that I can clarify my vision progressively

## Acceptance Criteria (EARS)

### AC-1: Create Idea
WHEN Boss submits a new idea description
THE SYSTEM SHALL create an IDEA record with 10% clarity
AND THE SYSTEM SHALL assign a unique IDEA-ID

### AC-2: Update Idea
WHEN Boss refines an idea
THE SYSTEM SHALL update the idea content
AND THE SYSTEM SHALL increase clarity level
AND THE SYSTEM SHALL create a new version

### AC-3: Track Clarity
WHEN Boss views an idea
THE SYSTEM SHALL display current clarity percentage
AND THE SYSTEM SHALL show clarity breakdown by aspect

## Dependencies
(none)

## Depended By
- REQ-002 (Module Management)
```

**為什麼用EARS**:
- 清晰、可測試
- 無歧義
- 易於轉換成BDD tests

### Layer 4: Specification (詳細規格)

**目的**: Executable (ezSpec) + Machine-Readable (JSON)

**ID格式**: `SPEC-{3位數字}`

**文件位置**: `.dev/current/specs/SPEC-{ID}-{name}/`

**Executable Format (ezSpec)**:
```gherkin
# SPEC-001: Create Idea

Scenario: Boss creates a new idea
  Given Boss is logged in
  When Boss submits idea with description "AI development system"
  Then system creates IDEA-001
  And clarity level is 10%
  And status is "Draft"

Scenario: Boss refines idea
  Given IDEA-001 exists with clarity 10%
  When Boss adds module breakdown
  Then clarity level increases to 50%
  And version v0.2 is created
```

**Machine-Readable Format (JSON)**:
```json
{
  "spec_id": "SPEC-001",
  "requirement_id": "REQ-001",
  "title": "Create Idea",
  "scenarios": [
    {
      "name": "Boss creates a new idea",
      "given": ["Boss is logged in"],
      "when": ["Boss submits idea with description"],
      "then": [
        "system creates IDEA-001",
        "clarity level is 10%",
        "status is Draft"
      ]
    }
  ],
  "anti_hallucination_checks": [
    "Verify IDEA-ID format",
    "Verify clarity calculation",
    "Verify version creation"
  ]
}
```

---

## 🤖 68個Agent系統

ForgeMind的核心是**68個專門Agent**的協作系統。

### Level 1: Executive Agents (4個)

#### 1. Facilitator Agent (最重要！)
**角色**: Boss模式的核心，主持所有對話

**職責**:
- 理解Boss的商業想法
- 主持結構化Discovery對話
- 協調其他Agent工作
- 生成Boss Dashboard
- 決策點提示

**Prompt核心**:
```markdown
You are the Facilitator Agent, the core of ForgeMind's Boss Mode.

Your role:
1. Understand Boss's business idea (non-technical language)
2. Break down into 5-layer structure
3. Coordinate other agents
4. Ask clarifying questions (Clarify phase from SpecKit)
5. Track clarity level
6. Generate Boss Dashboard

Remember:
- Boss is non-technical
- Use business language
- Ask ONE question at a time
- Validate clarity before moving to next layer
- Run Analyze phase before implementation
```

#### 2. Product Owner Agent
**角色**: 產品願景，優先級管理

#### 3. Scrum Master Agent
**角色**: 流程管理，移除障礙

#### 4. QA Manager Agent
**角色**: 質量策略，測試計劃

### Level 2: Department Agents (38個)

#### 核心5個:

1. **BA Agent** - 需求收集，EARS Notation
2. **Architect Agent** - 系統架構，DDD設計
3. **Requirements Engineer** - 規格撰寫，ezSpec
4. **Domain Expert Agent** - Bounded Context定義
5. **QA Agent** - Quality Gates，Analyze階段

#### 其他33個:
- Security Expert Agent
- Performance Expert Agent
- UX Designer Agent
- Database Expert Agent
- API Designer Agent
- Infrastructure Agent
- DevOps Agent
- ... (等26個)

### Level 3: Sub-agents (26個)

從Repository學習的18個 + ForgeMind新增8個:

#### Repository的18個:
1. **Command Agent** - CQRS Command UseCase
2. **Query Agent** - CQRS Query UseCase
3. **Aggregate Agent** - DDD Aggregate Code
4. **Controller Agent** - REST API Controller
5. **Test Agent** - ezSpec Test Generation
6. **Review Agent** - Code Review
... (等12個)

#### ForgeMind新增8個:
1. **Impact Analysis Agent** - 3秒Impact Analysis
2. **Traceability Agent** - 追溯矩陣管理
3. **Clarity Tracker Agent** - Clarity Level追蹤
4. **Delta Generator Agent** - Delta格式生成
5. **Dashboard Agent** - Boss Dashboard更新
6. **Steering Agent** - Steering Files生成
7. **Hook Manager Agent** - Agent Hooks管理
8. **Constitution Agent** - Constitution檢查

---

## 🔧 核心創新

### 1. 從OpenSpec學習 (Fission AI)

#### 雙文件夾模式
```
.dev/
├── current/              ← Current Truth (當前狀態)
│   └── [所有5層artifacts]
│
└── changes/              ← Proposed Changes (變更提案)
    └── CHANGE-001/
        ├── proposal.md   ← Why
        ├── impact.md     ← Impact
        ├── tasks.md      ← How
        └── deltas/       ← What (Delta格式)
```

**為什麼重要**:
- 完美支持非線性回溯
- 清晰分離現狀和計劃
- 多個changes可以並行
- Archive後merge回current/

#### Delta格式
```markdown
# REQ-001 Delta

## ADDED Requirements

### Requirement: Customer Scoring
WHEN customer makes a purchase
THE SYSTEM SHALL update customer score
...

## MODIFIED Requirements

### Requirement: Create Customer
- Old: THE SYSTEM SHALL accept name and email
- New: THE SYSTEM SHALL accept name, email, and initial score

## REMOVED Requirements

### Requirement: Manual Score Entry
(Removed because automated)
```

**為什麼重要**:
- Git-like的diff思維
- 清楚看到變更
- 易於review
- 可以逐項批准/拒絕

### 2. 從SpecKit學習 (GitHub)

#### Constitution (項目憲法)
```markdown
# Project Principles

## Architecture
- USE Clean Architecture + DDD
- USE Repository pattern (Generic)
- USE Event Sourcing for Aggregates

## Security
- ALL user inputs MUST be validated
- ALL passwords MUST be hashed with bcrypt
- ALL API endpoints MUST have rate limiting

## Design System
- USE Tailwind CSS for styling
- USE Shadcn UI components
- FOLLOW Apple HIG for mobile

## Anti-Hallucination
- NO Input/Output as separate files
- NO Missing Mapper classes
- NO javax.* packages (use jakarta.*)
```

**為什麼重要**:
- 所有約束在一個地方
- AI可以直接讀取使用
- 不用每次重複說明
- 團隊共識文檔化

#### Clarify階段 (防AI猜測)
```
Facilitator Agent workflow:

Step 1: Boss提出Idea
Step 2: Facilitator生成initial spec
Step 3: Clarify階段 ← 新增！
  • 識別模糊的地方
  • 結構化提問
  • Boss回答
  • 更新spec
  • 重複直到清晰
Step 4: BA Agent收集Requirements
```

**Clarify問題示例**:
```markdown
🤔 Clarification Needed

I found 3 underspecified areas in your Idea:

1. Customer Classification
   Q: What are the criteria for classifying customers?
   Options:
   - By revenue?
   - By frequency?
   - By industry?
   - Other?
   
   Please specify.

2. Data Retention
   Q: How long should we keep customer data?
   Options:
   - 1 year?
   - 5 years?
   - Forever?
   - Comply with GDPR?
   
   Please specify.

3. Email Notifications
   Q: When should the system send emails?
   Options:
   - On every purchase?
   - Weekly digest?
   - On request only?
   
   Please specify.
```

**為什麼重要**:
- 主動識別模糊
- 防止AI猜測
- 提高Clarity Level
- 減少返工

#### Analyze階段 (Quality Gates)
```markdown
QA Agent workflow:

Before moving from Requirements → Specification:

Run Analyze:
✅ Cross-artifact consistency
   • Idea vs Requirements一致?
   • Module vs Domain一致?
   • Requirements vs Spec一致?

✅ Coverage analysis
   • 所有Idea的Goals都有Requirements?
   • 所有Requirements都有Spec?
   • 所有Spec都有Tests?

✅ Anti-Hallucination check
   • 有沒有編造的內容?
   • 有沒有不存在的API?
   • 有沒有違反Constitution?

Report:
┌─────────────────────────────────────┐
│ Quality Analysis Report             │
├─────────────────────────────────────┤
│ ✅ Consistency: PASS                │
│ ✅ Coverage: 95% (5% missing)       │
│ ⚠️  Hallucination: 2 warnings       │
│                                     │
│ Warnings:                           │
│ • REQ-003: References undefined API│
│ • SPEC-002: Violates security rule │
│                                     │
│ Missing Coverage:                   │
│ • Goal "Scalability" has no REQ    │
└─────────────────────────────────────┘

Boss: Fix before proceeding?
[Yes] [No, proceed anyway]
```

**為什麼重要**:
- 像"unit tests for English"
- Quality gate before implementation
- 自動檢查
- Boss有信心

#### Slash Commands
```bash
# 在OpenCode / Claude Code中使用

/forgemind.idea <description>
  → Facilitator Agent主持Idea Discovery

/forgemind.clarify
  → 識別並澄清模糊地方

/forgemind.modules
  → Architect Agent分解Modules

/forgemind.domains <module>
  → Domain Expert分析Bounded Contexts

/forgemind.requirements <domain>
  → BA Agent收集Requirements

/forgemind.spec <requirement>
  → Requirements Engineer寫Specification

/forgemind.analyze
  → QA Agent質量檢查

/forgemind.impact <change>
  → 分析變更影響

/forgemind.approve <item>
  → Boss批准

/forgemind.dashboard
  → 顯示Boss Dashboard
```

### 3. 從Kiro學習 (Kiro.dev)

#### Steering Files (自動理解Codebase)
```markdown
# structure.md (Auto-generated)

## Codebase Architecture

### Package Structure
tw.forgemind.core/
├── fivelayer/
│   ├── entity/
│   ├── usecase/
│   │   ├── port/in/
│   │   ├── port/out/
│   │   └── service/
│   └── adapter/
├── traceability/
└── hallucination/

### Key Components
- Idea.java (Aggregate Root)
- FiveLayerManager (Domain Service)
- ImpactAnalyzer (Domain Service)
- TraceabilityMatrix (Domain Service)

### Module Dependencies
core → (none)
agent → core
dashboard → core, agent
```

**生成時機**:
- 初次加入現有項目時
- AI掃描codebase
- 自動生成3個文件
- Boss review & approve
- 持續更新

**為什麼重要**:
- AI理解現有項目
- 不用手動解釋結構
- 自動生成，持續更新
- 新Agent加入快速了解

#### Agent Hooks (自動化)
```yaml
# on-requirement-created.hook

trigger:
  event: requirement.created
  layer: Layer 3

actions:
  - name: Check dependencies
    agent: BA Agent
    task: |
      Analyze if this requirement depends on other requirements.
      Update dependency graph.
    
  - name: Update traceability matrix
    script: .ai/scripts/update-traceability.py
    args:
      - requirement_id
      - parent_domain_id
    
  - name: Notify stakeholders
    if: priority == "P0"
    script: .ai/scripts/send-notification.py
    args:
      - requirement_id
      - stakeholders: ["boss", "architect"]
    
  - name: Generate initial spec template
    agent: Requirements Engineer
    task: |
      Create ezSpec template for this requirement.
      Include Given-When-Then scenarios based on EARS criteria.
```

**為什麼重要**:
- 自動化重複任務
- 響應變更
- 保持同步
- 減少人工工作

### 4. 從Repository學習 (AI-SCRUM)

#### Package結構 (Clean Architecture + DDD)
```
tw.forgemind.{aggregate}/
├── entity/              ← Domain objects
│   ├── Idea.java
│   ├── ClarityLevel.java
│   └── events/
│       ├── IdeaCreated.java
│       └── IdeaClarityIncreased.java
│
├── usecase/
│   ├── port/in/         ← Use case interfaces
│   │   ├── CreateIdeaUseCase.java
│   │   │   ├── Input (inner class)
│   │   │   └── Output (inner class)
│   │   └── GetIdeaUseCase.java
│   │
│   ├── port/out/        ← Repository, Projection
│   │   ├── IdeaRepository.java
│   │   ├── IdeaProjection.java
│   │   └── IdeaMapper.java
│   │
│   └── service/         ← Implementation
│       ├── CreateIdeaService.java
│       └── GetIdeaService.java
│
└── adapter/
    ├── in/controller/
    │   └── IdeaController.java
    └── out/
        ├── database/
        │   └── IdeaJpaEntity.java
        └── repository/
            └── IdeaRepositoryImpl.java
```

#### 16個FAILURE-CASES
1. ❌ Input/Output as separate files
2. ❌ Missing Mapper classes
3. ❌ Missing Projection implementation
4. ❌ Wrong package structure
5. ❌ Missing metadata in Domain Events
6. ❌ Using javax.* instead of jakarta.*
7. ❌ Custom Repository methods (use Generic)
8. ❌ Static factory method (use public constructor)
9. ❌ Missing ApiError handling
10. ❌ No try-catch in Service
... (等6個)

**為什麼重要**:
- 從真實錯誤學習
- 自動檢查腳本
- Anti-Hallucination基礎
- 持續改進

---

## 🛡️ Anti-Hallucination系統

ForgeMind的**21+個Anti-Hallucination檢查**來自兩個來源:

### ForgeMind原創的5大模式

1. **假設場景不存在**
   - 檢查: 所有場景都在Idea或Requirements中定義?
   - 例子: AI編造"管理員審批流程"但Idea沒提到

2. **過度簡化複雜度**
   - 檢查: 是否過度簡化業務邏輯?
   - 例子: "客戶分類"只用單一字段，實際需要多維度

3. **誤解業務術語**
   - 檢查: 業務術語定義在Constitution?
   - 例子: "Score"可能指信用分數、購買分數、活躍度等

4. **錯誤的因果關係**
   - 檢查: Domain Events的因果鏈正確?
   - 例子: CustomerScoreUpdated應該在PurchaseCompleted之後

5. **經驗性假設**
   - 檢查: 是否假設了沒有明確說明的功能?
   - 例子: 假設有"忘記密碼"功能但Requirements沒有

### Repository的16個技術案例

(見上面FAILURE-CASES列表)

### 自動檢查流程

```python
# .ai/scripts/check-anti-hallucination.py

def check_anti_hallucination(spec_id):
    """
    運行21+個Anti-Hallucination檢查
    """
    results = []
    
    # ForgeMind 5大模式
    results.append(check_undefined_scenarios(spec_id))
    results.append(check_oversimplification(spec_id))
    results.append(check_business_terms(spec_id))
    results.append(check_causality(spec_id))
    results.append(check_assumptions(spec_id))
    
    # Repository 16個案例
    results.append(check_input_output_structure(spec_id))
    results.append(check_mapper_exists(spec_id))
    results.append(check_projection_exists(spec_id))
    results.append(check_package_structure(spec_id))
    results.append(check_domain_event_metadata(spec_id))
    results.append(check_jakarta_packages(spec_id))
    results.append(check_generic_repository(spec_id))
    results.append(check_public_constructor(spec_id))
    results.append(check_api_error_handling(spec_id))
    results.append(check_try_catch_service(spec_id))
    # ... 等6個
    
    return generate_report(results)
```

---

## 🚀 實施路線圖

### Phase 0: 免費驗證 (1個月) 🟢 當前階段

**時間**: 2025-10 ~ 2025-11  
**成本**: $0 (完全免費)  
**平台**: OpenCode + Grok Code Fast 1

#### 目標
- [x] 研究Spec-Driven工具
- [x] 設計ForgeMind架構
- [x] 整合最佳實踐
- [ ] **Boss決定**: 何時開始?
- [ ] 安裝OpenCode
- [ ] 配置Grok Code Fast 1 (免費)
- [ ] 驗證核心Agent (Facilitator, BA, Architect)
- [ ] 測試非線性回溯
- [ ] 測試Anti-Hallucination能力
- [ ] 積累Agent prompts
- [ ] 寫驗證報告

#### Week-by-Week Plan

**Week 1**: 安裝與基礎設置
- Day 1-2: 安裝OpenCode
- Day 3-4: 配置Grok
- Day 5: 測試基本功能
- Day 6-7: 設置Project結構

**Week 2**: 驗證核心Agent
- 實驗1: Facilitator Agent
- 實驗2: BA Agent
- 實驗3: Architect Agent

**Week 3**: 測試非線性工作流
- 實驗4: 回溯到Idea階段
- 實驗5: 跨Module依賴
- 實驗6: Anti-Hallucination測試

**Week 4**: 評估與決策
- Day 22-24: 整理發現
- Day 25-26: 寫總結報告
- Day 27-28: Boss決定是否進入Phase 1

#### 成功指標
- [ ] AI能理解5層結構
- [ ] 能進行結構化對話
- [ ] 能處理簡單回溯
- [ ] Terminal工作流可接受

#### 決策點
- [ ] **Boss決定**: 是否進入Phase 1？

---

### Phase 1: 付費驗證 (2個月) ⏸️ 待Phase 0完成

**時間**: 預計2025-12 ~ 2026-01  
**成本**: $40/月 ($80 total)  
**平台**: Claude Code CLI + Cursor

#### 目標
- [ ] 使用Claude Code CLI (主力)
- [ ] 使用Cursor輔助開發
- [ ] 實現10個核心Agent
- [ ] 完整5層結構
- [ ] 基礎追溯性系統
- [ ] 簡單Boss Dashboard (Terminal)

#### Agent優先級

**P0 (必須實現)**:
1. Facilitator Agent
2. BA Agent
3. Architect Agent
4. Requirements Engineer
5. QA Agent
6. Impact Analysis Agent
7. Traceability Agent

**P1 (應該實現)**:
8. Domain Expert Agent
9. Security Expert Agent
10. Dashboard Agent

#### 待實現功能
- [ ] Facilitator Agent prompt
- [ ] BA Agent prompt
- [ ] Architect Agent prompt
- [ ] Requirements Engineer prompt
- [ ] QA Agent prompt
- [ ] Impact Analysis基礎功能
- [ ] Delta格式實現
- [ ] Clarify階段實現
- [ ] Analyze階段實現
- [ ] Traceability Matrix實現

#### 決策點
- [ ] **Boss決定**: CLI工作流是否滿意？
- [ ] **Boss決定**: 是否需要Web Dashboard？
- [ ] **Boss決定**: 是否進入Phase 2？

---

### Phase 2: 擴展實踐 (4個月) ⏸️ 待Phase 1完成

**時間**: 預計2026-02 ~ 2026-05  
**成本**: $240/月 ($960 total)  
**平台**: Claude Code + Cursor + Next.js Dashboard

#### 目標
- [ ] 20個核心Agent穩定運行
- [ ] 完整追溯性系統
- [ ] Web版Boss Dashboard
- [ ] Anti-Hallucination完整檢查
- [ ] Agent Hooks自動化
- [ ] MCP工具整合

#### 待實現
- [ ] Web Dashboard (Next.js)
  - Boss視圖 (5層結構)
  - Clarity儀表板
  - Impact Analysis視覺化
  - Change管理界面
- [ ] Agent Hooks系統
- [ ] Analyze階段 (Quality Gates)
- [ ] Steering Files自動生成
- [ ] 完整Impact Analysis
- [ ] Constitution系統
- [ ] Slash Commands整合

#### 技術棧 (Dashboard)
```typescript
// 前端
- Next.js 14 (App Router)
- React 18
- Tailwind CSS
- Shadcn UI

// 後端
- Next.js API Routes
- Prisma (metadata)
- PostgreSQL

// AI整合
- Claude API
- MCP Protocol
```

#### 決策點
- [ ] **Boss決定**: 是否商業化？
- [ ] **Boss決定**: 是否進入Phase 3 (自建系統)？

---

### Phase 3: 完整系統 (6-12個月) ⏸️ 待Phase 2完成

**時間**: 預計2026-06 ~ 2027-05  
**成本**: $10K-30K (開發) + $1K-3.5K/月 (運營)  
**平台**: 自建TypeScript系統

#### 目標
- [ ] 68個Agent完整實現
- [ ] 生產級Boss Dashboard
- [ ] 多模型智能路由
- [ ] 企業級部署
- [ ] 完全自動化
- [ ] 商業化準備

#### 完整技術棧
```typescript
forgemind-system/
├── packages/
│   ├── dashboard/          ← Boss Web UI
│   │   • Next.js 14
│   │   • React 18
│   │   • Tailwind CSS
│   │   • Shadcn UI
│   │
│   ├── agent-core/         ← 68個Agent
│   │   • Node.js 20+
│   │   • TypeScript 5
│   │   • Langchain
│   │
│   ├── ai-gateway/         ← 多模型整合
│   │   • Claude API
│   │   • GPT-4 API
│   │   • Gemini API
│   │   • 智能路由
│   │
│   ├── forge-engine/       ← 5層結構
│   │   • Idea Manager
│   │   • Module Manager
│   │   • Domain Manager
│   │   • Requirement Manager
│   │   • Spec Manager
│   │
│   ├── traceability/       ← 追溯系統
│   │   • Master Matrix
│   │   • Impact Analyzer
│   │   • Dependency Graph
│   │
│   ├── anti-hallucination/ ← 防腦補
│   │   • 21+ Patterns
│   │   • Auto Checker
│   │   • Lessons Learned
│   │
│   └── git-ops/            ← Git自動化
│       • Auto Commit
│       • Versioning
│       • Hooks
│
├── apps/
│   ├── cli/                ← Developer CLI
│   └── api/                ← REST API
│
└── infra/
    ├── database/           ← Prisma
    └── docker/             ← Deployment
```

#### 決策點
- [ ] **Boss決定**: 商業模式？
- [ ] **Boss決定**: 定價策略？
- [ ] **Boss決定**: 市場定位？

---

## 📁 文件管理

### ID體系

ForgeMind使用統一的ID體系:

| Layer | ID格式 | 示例 | 範圍 |
|-------|--------|------|------|
| Project | PROJ-{NAME}-{3位} | PROJ-FORGEMIND-001 | 全局唯一 |
| Idea | IDEA-{3位} | IDEA-001 | Project內唯一 |
| Module | MODULE-{3位} | MODULE-001 | Project內唯一 |
| Domain | DOMAIN-{3位} | DOMAIN-001 | Project內唯一 |
| Requirement | REQ-{3位} | REQ-001 | Project內唯一 |
| Specification | SPEC-{3位} | SPEC-001 | Project內唯一 |
| Change | CHANGE-{3位} | CHANGE-001 | Project內唯一 |
| Document | DOC-{3位} | DOC-001 | 文檔類 |
| JSON | JSON-{3位} | JSON-001 | 數據類 |
| Reference | REF-{3位} | REF-001 | 參考資料 |

### 文件命名規範

**Current Files**:
```
.dev/current/{layer}/{ID}-{name}/current.md
```

**Version Files**:
```
.dev/current/{layer}/{ID}-{name}/versions/v{major}.{minor}.md
```

**Delta Files**:
```
.dev/changes/{CHANGE-ID}/deltas/{layer}/{ID}-delta.md
```

**Agent Prompts**:
```
.ai/agents/prompts/{level}/{agent-name}.md
```

### Artifacts清單

**總計**: 41個文件

**按狀態**:
- ✅ 已生成: 19個
- 📦 從Repository: 4個
- ⏳ 待生成: 18個

**按Layer**:
- Root: 3個
- Layer 0: 2個
- Layer 1: 3個
- Layer 2: 3個
- Layer 3: 3個
- Layer 4: 2個
- AI Framework: 9個
- Research: 8個
- Plans: 2個
- Exports: 6個

**完整清單**: 見 `exports/forgemind_file_manifest.json`

### 追溯矩陣

```json
{
  "IDEA-001": {
    "modules": ["MODULE-001", "MODULE-002", "MODULE-003"],
    "domains": ["DOMAIN-001", "DOMAIN-002", "DOMAIN-003", 
                "DOMAIN-004", "DOMAIN-005", "DOMAIN-006"],
    "requirements": ["REQ-001", "REQ-002", "REQ-003", 
                     "REQ-004", "REQ-005"],
    "specifications": ["SPEC-001", "SPEC-002", "SPEC-003"],
    "clarity": "85%"
  },
  "MODULE-001": {
    "parent": "IDEA-001",
    "domains": ["DOMAIN-001", "DOMAIN-002", "DOMAIN-003"],
    "dependencies": [],
    "depended_by": ["MODULE-002", "MODULE-003"]
  },
  "REQ-001": {
    "parent": "DOMAIN-001",
    "specifications": ["SPEC-001"],
    "dependencies": [],
    "depended_by": ["REQ-002"]
  }
}
```

---

## 🤔 待Boss決定的事項

### 立即需要決定 (Phase 0) ⚡

1. **何時開始Phase 0驗證？**
   - 建議: 本週內開始
   - 行動: 安裝OpenCode
   - 時間: 10分鐘設置

2. **Phase 0驗證週期？**
   - 建議: 1個月
   - 可調整: 根據實際進度
   - 最短: 2週 (快速驗證)
   - 最長: 6週 (深度探索)

3. **驗證成功標準？**
   - 必須: AI能理解5層結構
   - 必須: 能處理簡單回溯
   - 可選: Terminal工作流滿意
   - 可選: Agent prompt質量高

### 近期需要決定 (Phase 0完成後) 📅

4. **是否進入Phase 1？**
   - 條件: Phase 0驗證成功
   - 成本: $40/月
   - 時間: 2個月
   - 回報: 10個核心Agent實現

5. **是否需要Web Dashboard？**
   - 如需要: Phase 2 ($240/月)
   - 如不需要: 繼續CLI
   - 可以: Phase 1結束後再決定

6. **Agent優先級？**
   - 哪些Agent最重要？
   - 哪些可以延後？
   - 自定義Agent需求？

### 中期需要決定 (Phase 1完成後) 📆

7. **是否商業化？**
   - 自用 vs 服務其他公司
   - 定價模式
   - 市場定位

8. **是否自建系統？**
   - 進入Phase 3
   - 投資$10K-30K
   - 完全控制

9. **團隊擴展？**
   - 是否需要開發人員？
   - 是否需要PM？
   - 是否需要Designer？

### 長期需要決定 (Phase 2完成後) 🗓️

10. **市場定位？**
    - 目標客戶 (中小企業? 大企業?)
    - 競爭優勢 (Boss模式? 非線性?)
    - 差異化策略

11. **商業模式？**
    - SaaS訂閱
    - 按項目收費
    - 企業授權
    - 混合模式

12. **擴展方向？**
    - 支援更多語言 (Python, Go, Rust?)
    - 支援更多架構 (Microservices, Serverless?)
    - 垂直行業定制 (金融, 醫療, 電商?)

---

## 🚀 快速開始

### 今天就可以開始 (10分鐘)

#### Step 1: 安裝OpenCode (2分鐘)
```bash
# Mac/Linux
curl -fsSL https://opencode.ai/install | bash

# 或用Homebrew
brew install opencode

# 驗證安裝
opencode --version
```

#### Step 2: 配置Grok (3分鐘)
```bash
# 1. 訪問 x.ai/api
# 2. 註冊帳號
# 3. 獲取API key (目前免費)

# 配置OpenCode
opencode auth login
# 選擇 "xai"
# 輸入API key
```

#### Step 3: 創建ForgeMind項目 (3分鐘)
```bash
mkdir forgemind-demo
cd forgemind-demo

# 創建基礎結構
mkdir -p .dev/current/{ideas,modules,domains,requirements,specs}
mkdir -p .dev/changes
mkdir -p .dev/traceability
mkdir -p .ai/{constitution,agents,standards,templates}

# 創建第一個Idea
cat > .dev/current/ideas/IDEA-001/current.md << 'EOF'
# IDEA-001: [Your Project Name]

## Vision
[Describe your vision in 2-3 sentences]

## Goals
- Goal 1
- Goal 2
- Goal 3

## Status
Draft (Clarity: 10%)
EOF

# 初始化Git
git init
git add .
git commit -m "feat: initial ForgeMind structure"
```

#### Step 4: 第一個Agent對話 (2分鐘)
```bash
opencode

# 初始化
/init

# 開始Facilitator Agent對話
"I want you to act as the Facilitator Agent from ForgeMind.

Your role:
1. Help me refine my Idea (IDEA-001)
2. Ask structured questions to improve clarity
3. Break down into Modules
4. Identify Domains for each Module

The Idea is in .dev/current/ideas/IDEA-001/current.md.
Please read it and start the discovery process.

Ask me 3-5 key questions to clarify the vision."
```

### 下一步

完成快速開始後:
1. ✅ 繼續Week 1的實驗
2. ✅ 積累Agent prompts
3. ✅ 記錄發現和pain points
4. ✅ 1個月後寫驗證報告
5. ✅ Boss決定是否進入Phase 1

---

## 📊 關鍵指標

### Phase 0: 驗證指標 (當前)
- **時間**: 1個月
- **成本**: $0
- **焦點**: 驗證ForgeMind概念
- **Agent數量**: 3-4個 (驗證)
- **Clarity提升**: 10% → 40%
- **Artifacts**: 10-15個
- **成功率**: 待測試

### Phase 1: MVP建置指標
- **時間**: 2個月
- **成本**: $80 total
- **焦點**: 實現最小可行ForgeMind
- **Agent數量**: 10個
- **Clarity提升**: 40% → 70%
- **Artifacts**: 30-40個
- **成功率**: 目標80%

### Phase 2: 功能擴展指標
- **時間**: 3個月
- **成本**: $960 total
- **焦點**: 增加進階功能
- **Agent數量**: 20個
- **Clarity提升**: 70% → 90%
- **Artifacts**: 60-80個
- **成功率**: 目標90%

### Phase 3: 生產使用指標
- **時間**: 持續
- **成本**: 按項目收費
- **焦點**: 使用ForgeMind開發客戶項目
- **Agent數量**: 68個 (完整)
- **Clarity提升**: 90% → 95%+
- **Artifacts**: 200+ (生產級)
- **成功率**: 目標95%+

---

## 🔗 相關資源

### 已生成的文檔 (JSON)

1. **forgemind_knowledge_base.json** - 完整知識庫
   - 所有討論內容
   - 核心概念
   - Agent系統
   - 工具學習
   - 決策記錄

2. **forgemind_integration_complete.json** - 整合策略
   - Repository整合
   - Package結構
   - Sub-agent系統

3. **forgemind_platform_evaluation.json** - 平台評估
   - 6個平台對比
   - Benchmark數據
   - 推薦策略

4. **forgemind_phase0_opencode_grok.json** - Phase 0計劃
   - 詳細週計劃
   - 實驗設計
   - 成功指標

5. **spec_driven_tools_analysis.json** - Spec-Driven研究
   - OpenSpec分析
   - SpecKit分析
   - Kiro分析
   - 學習要點

6. **forgemind_summary.json** - 項目總結
   - 當前狀態
   - 完成事項
   - 待辦事項
   - 決策點

7. **forgemind_file_manifest.json** - 文件清單
   - 41個artifacts
   - 文件位置
   - 狀態追蹤
   - Priority標記

### 參考的Repository

1. **AI-SCRUM Repository** (Clean Architecture + DDD)
   - SUB-AGENT-SYSTEM.md (18個Sub-agent)
   - FAILURE-CASES.md (16個錯誤案例)
   - CODE-TEMPLATES.md (標準模板)
   - DIRECTORY-RULES.md (目錄規則)
   - COMMON-PITFALLS.md (常見錯誤)

### 參考的工具

1. **OpenSpec** (Fission AI)
   - GitHub: Fission-AI/OpenSpec
   - 學習: 雙文件夾模式, Delta格式, Change管理

2. **SpecKit** (GitHub)
   - GitHub: github/spec-kit
   - 學習: Constitution, Clarify, Analyze, Slash Commands

3. **Kiro** (Kiro.dev)
   - GitHub: kirodotdev/Kiro
   - 學習: Steering Files, EARS Notation, Hooks, 雙向同步

### 平台工具

1. **OpenCode** (Phase 0)
   - GitHub: opencode-ai/opencode
   - 免費開源Terminal Agent
   - 75+ LLM providers

2. **Grok Code Fast 1** (Phase 0)
   - xAI, 限時免費
   - 92 tokens/sec, 256K context
   - SWE-bench: 70.8%

3. **Claude Code** (Phase 1+)
   - Anthropic
   - 200K context, MCP支持
   - SWE-bench: 95.1%

4. **Cursor** (Phase 1+)
   - AI-native IDE
   - Background Agents
   - 多模型支持

---

## 📝 版本歷史

### v0.2.1 (2025-10-23) - Updated Implementation Plan
- ✅ 更新實施計劃 (從工具驗證到ForgeMind建置)
- ✅ 更新關鍵指標 (反映新4階段計劃)
- ✅ 更新Agent目錄狀態 (已生成agents-catalog.md)

### v0.2.0 (2025-10-22) - Complete Knowledge Integration
- ✅ 整合所有討論內容
- ✅ 41個Artifacts清單
- ✅ 完整文件結構
- ✅ ID體系定義
- ✅ 追溯矩陣設計
- ✅ 文件管理規範

### v0.1.0 (2025-10-22) - Initial Design
- ✅ 核心理念確立
- ✅ 5層結構設計
- ✅ 68個Agent定義
- ✅ 工具研究完成
- ✅ 最佳實踐整合
- ✅ 平台選擇完成
- ✅ Phase 0計劃制定

### 未來版本
- v0.3.0 - Phase 0驗證完成
- v0.4.0 - Phase 1核心Agent實現
- v1.0.0 - Phase 2完整功能
- v2.0.0 - Phase 3自建系統

---

## 💡 核心優勢總結

### 為什麼ForgeMind與眾不同？

1. **完整的5層結構**
   - 不只是Spec-Driven
   - 從Idea到Code全覆蓋
   - 每層獨立管理

2. **真正的非線性支持**
   - OpenSpec的雙文件夾模式
   - Delta格式清晰變更
   - 3秒Impact Analysis
   - 隨時回溯任何階段

3. **68個Agent協作**
   - 不是單一AI
   - 分工明確
   - 自動化協調
   - Level 1/2/3三層

4. **Boss模式**
   - 非技術背景可用
   - 每天1-2小時
   - AI處理100%複雜性
   - 自然語言交互

5. **Anti-Hallucination**
   - 21+個檢查模式
   - 從實際錯誤學習
   - 持續改進
   - 自動檢查腳本

6. **最佳實踐整合**
   - OpenSpec (Change管理)
   - SpecKit (Quality Gates)
   - Kiro (自動化)
   - Repository (技術標準)

7. **漸進式投資**
   - Phase 0: $0
   - Phase 1: $80
   - Phase 2: $960
   - Phase 3: 看需求
   - 隨時調整

8. **雙向追溯**
   - Idea → Code
   - Code → Idea
   - 3秒Impact Analysis
   - 自動維護一致性

9. **質量保證**
   - Clarify階段 (防猜測)
   - Analyze階段 (Quality Gates)
   - Constitution (約束)
   - Lessons Learned (持續改進)

10. **完全透明**
    - 所有Artifact可見
    - 所有決策有記錄
    - 所有變更可追溯
    - Boss完全掌控

---

## 📞 聯繫方式

**項目負責人**: Boss  
**當前階段**: Phase 0 - Ready to Start  
**版本**: v0.2.0  
**最後更新**: 2025-10-22 22:00 HKT

---

## 📄 附錄

### A. 完整Agent目錄

見 `.ai/docs/agents-catalog.md` (已生成)

### B. 完整Workflow說明

見 `.ai/docs/WORKFLOW.md` (待生成)

### C. Anti-Hallucination指南

見 `.ai/docs/ANTI-HALLUCINATION-GUIDE.md` (待生成)

### D. 最佳實踐

見 `.ai/docs/BEST-PRACTICES.md` (待生成)

---

**© 2025 ForgeMind. All rights reserved.**

---

## 🎉 下一步

Boss準備好了嗎？

1. ✅ **過目本README** - 確認所有知識點
2. ✅ **查看文件清單** - `exports/forgemind_file_manifest.json`
3. ✅ **決定開始時間** - Phase 0何時啟動？
4. ✅ **安裝OpenCode** - 10分鐘設置
5. ✅ **第一個對話** - Facilitator Agent

**ForgeMind - 從想法到現實，AI陪你一起走！** 🚀
