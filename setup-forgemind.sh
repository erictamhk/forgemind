# ForgeMind Project Initialization Script

# 創建這個腳本後，在Terminal執行:
# chmod +x setup-forgemind.sh
# ./setup-forgemind.sh

#!/bin/bash

echo "=================================="
echo "ForgeMind Project Initialization"
echo "Version: v0.2.0"
echo "Phase: 0 - Validation"
echo "=================================="
echo ""

# 創建根目錄結構
echo "📁 Creating root folders..."

mkdir -p .ai
mkdir -p .dev
mkdir -p research
mkdir -p plans
mkdir -p exports
mkdir -p .git

echo "✅ Root folders created"
echo ""

# =============================================
# .ai/ - Generic Framework (通用AI系統)
# =============================================

echo "📁 Creating .ai/ structure (Generic Framework)..."

# Constitution (項目憲法)
mkdir -p .ai/constitution
cat > .ai/constitution/.gitkeep << 'EOF'
# Constitution (項目憲法)
這裡存放項目的核心原則、開發指南、安全要求等
EOF

# Agents
mkdir -p .ai/agents/prompts/level-1-executive
mkdir -p .ai/agents/prompts/level-2-departments
mkdir -p .ai/agents/prompts/level-3-subagents

cat > .ai/agents/prompts/.gitkeep << 'EOF'
# Agent Prompts
68個Agent的prompt存放在這裡，按3個Level組織
EOF

# Standards
mkdir -p .ai/standards/anti-hallucination
mkdir -p .ai/standards/domain-theory
mkdir -p .ai/standards/output-formats

cat > .ai/standards/.gitkeep << 'EOF'
# Standards (標準與規範)
Anti-Hallucination檢查、Domain理論、輸出格式規範
EOF

# Templates
mkdir -p .ai/templates/aggregate
mkdir -p .ai/templates/usecase
mkdir -p .ai/templates/controller
mkdir -p .ai/templates/test

cat > .ai/templates/.gitkeep << 'EOF'
# Code Templates
從Repository學習的標準Code模板
EOF

# Steering (從Kiro學習)
mkdir -p .ai/steering

cat > .ai/steering/.gitkeep << 'EOF'
# Steering Files (項目上下文)
自動生成的項目結構、技術棧、業務上下文
EOF

# Scripts
mkdir -p .ai/scripts

cat > .ai/scripts/.gitkeep << 'EOF'
# Automation Scripts
自動化腳本: auto-commit, analyze-impact, check-traceability等
EOF

# Hooks (從Kiro學習)
mkdir -p .ai/hooks

cat > .ai/hooks/.gitkeep << 'EOF'
# Agent Hooks
自動響應文件變更的hooks
EOF

# Docs
mkdir -p .ai/docs

cat > .ai/docs/.gitkeep << 'EOF'
# AI Documentation
架構文檔、Agent目錄、工作流程、最佳實踐
EOF

echo "✅ .ai/ structure created"
echo ""

# =============================================
# .dev/ - Project Specific (項目特定)
# =============================================

echo "📁 Creating .dev/ structure (Project Specific)..."

# Current (當前狀態 - OpenSpec)
mkdir -p .dev/current/ideas/IDEA-001/versions
mkdir -p .dev/current/modules
mkdir -p .dev/current/domains
mkdir -p .dev/current/requirements
mkdir -p .dev/current/specs

cat > .dev/current/.gitkeep << 'EOF'
# Current Truth (當前狀態)
這是ForgeMind的Current Truth，包含5層結構的當前狀態
從OpenSpec學習的雙文件夾模式
EOF

# Changes (變更提案 - OpenSpec)
mkdir -p .dev/changes

cat > .dev/changes/.gitkeep << 'EOF'
# Proposed Changes (變更提案)
OpenSpec的雙文件夾模式: changes/存放變更提案
每個變更包含: proposal.md, impact.md, tasks.md, deltas/
EOF

# Traceability (追溯性)
mkdir -p .dev/traceability

cat > .dev/traceability/.gitkeep << 'EOF'
# Traceability System
追溯矩陣、Impact緩存、依賴圖
實現3秒Impact Analysis
EOF

# Dashboards
mkdir -p .dev/dashboards

cat > .dev/dashboards/.gitkeep << 'EOF'
# Boss Dashboard
Boss每天必看的Dashboard
EOF

# Ask (對話記錄)
mkdir -p .dev/ask

cat > .dev/ask/.gitkeep << 'EOF'
# Conversation History
與AI的對話記錄
EOF

# Lessons (項目經驗)
mkdir -p .dev/lessons

cat > .dev/lessons/.gitkeep << 'EOF'
# Lessons Learned
項目經驗、Hallucination事件記錄
EOF

echo "✅ .dev/ structure created"
echo ""

# =============================================
# research/ - 研究資料
# =============================================

echo "📁 Creating research/ structure..."

mkdir -p research/tools-analysis
mkdir -p research/platform-evaluation
mkdir -p research/reference-materials

cat > research/.gitkeep << 'EOF'
# Research Materials
工具分析、平台評估、參考資料
EOF

echo "✅ research/ structure created"
echo ""

# =============================================
# plans/ - 計劃文檔
# =============================================

echo "📁 Creating plans/ structure..."

cat > plans/.gitkeep << 'EOF'
# Plans
Phase 0-3計劃、路線圖
EOF

echo "✅ plans/ structure created"
echo ""

# =============================================
# exports/ - 導出資料
# =============================================

echo "📁 Creating exports/ structure..."

cat > exports/.gitkeep << 'EOF'
# Exports (JSON Data)
知識庫、文件清單、各種分析報告的JSON導出
EOF

echo "✅ exports/ structure created"
echo ""

# =============================================
# 創建初始文件
# =============================================

echo "📄 Creating initial files..."

# README.md
cat > README.md << 'EOF'
# ForgeMind Project

> **Version**: v0.2.0  
> **Phase**: 0 - Validation  
> **Started**: 2025-10-23

## Quick Start

1. 查看完整文檔: `FORGEMIND-README.md`
2. 查看文件清單: `ARTIFACT-MANIFEST.md`
3. 開始第一個對話: `opencode`

## Project Structure

- `.ai/` - Generic Framework (通用AI系統)
- `.dev/` - Project Specific (項目特定)
- `research/` - 研究資料
- `plans/` - 計劃文檔
- `exports/` - 導出資料

## Phase 0 Goals

- [ ] 驗證Facilitator Agent
- [ ] 驗證BA Agent
- [ ] 驗證Architect Agent
- [ ] 測試非線性回溯
- [ ] 積累Agent prompts

## Documentation

See `FORGEMIND-README.md` for complete documentation.
EOF

# .gitignore
cat > .gitignore << 'EOF'
# ForgeMind .gitignore

# IDE
.vscode/
.idea/
*.swp
*.swo

# OS
.DS_Store
Thumbs.db

# Temp files
*.tmp
*.temp

# Node modules (if used later)
node_modules/

# Python (if used)
__pycache__/
*.pyc

# Logs
*.log

# Secrets
.env
*.key
*.pem
EOF

# Git initialization
cat > .dev/current/ideas/IDEA-001/current.md << 'EOF'
# IDEA-001: ForgeMind System

> **Version**: v0.2.0  
> **Status**: Planning Complete  
> **Clarity**: 85%

## Vision

ForgeMind is an AI-driven software development system that enables **non-technical Boss** to manage entire development process with only 1-2 hours daily investment.

## Goals

1. **Boss Mode** - Boss provides business decisions, AI handles all technical complexity
2. **Non-Linear Development** - Backtrack any layer anytime, 3-second Impact Analysis
3. **Zero Technical Debt** - AI auto-maintains consistency, bidirectional traceability
4. **Quality Assurance** - 21+ Anti-Hallucination checks
5. **Progressive Investment** - $0 → $80 → $960 → as needed

## Modules

- **MODULE-001**: Core Framework (5-layer, traceability, anti-hallucination)
- **MODULE-002**: Agent System (68 agents collaboration)
- **MODULE-003**: Boss Dashboard (UI, decision interface)

## Current Status

- Layer 0 (Idea): 85% clarity ← **We are here!**
- Planning phase: ✅ Complete
- Ready for: Phase 0 Validation

## Next Steps

1. Verify Facilitator Agent
2. Verify BA Agent  
3. Verify Architect Agent
4. Test non-linear backtracking
5. Accumulate Agent prompts

## References

- Full documentation: `FORGEMIND-README.md`
- Artifact manifest: `ARTIFACT-MANIFEST.md`
- Knowledge base: `exports/forgemind_knowledge_base.json`
EOF

# CHANGELOG.md
cat > CHANGELOG.md << 'EOF'
# Changelog

All notable changes to ForgeMind will be documented in this file.

## [v0.2.0] - 2025-10-22

### Added
- Complete 5-layer structure design
- 68 Agent system definition
- Integration of 4 tools' best practices (OpenSpec, SpecKit, Kiro, Repository)
- 21+ Anti-Hallucination checks
- 4-Phase implementation roadmap
- Complete documentation system

### Changed
- Evolved from v0.1's 4D workflow to 5-layer lifecycle
- Step 2 (Define) expanded into 3 layers (Module, Domain, Requirement)
- Enhanced from documentation output to working code

## [v0.1.0] - 2025-10-22 (Morning)

### Added
- Initial Idea→Spec discovery protocol
- 4D workflow (Discover, Define, Develop, Delivery)
- Basic concept definition

## [Unreleased]

### To Do
- Phase 0 validation
- Agent prompts implementation
- Module/Domain/Requirement documentation
- Specification generation
EOF

echo "✅ Initial files created"
echo ""

# =============================================
# 創建Phase 0的待辦文檔
# =============================================

echo "📄 Creating Phase 0 TODO..."

cat > .dev/PHASE-0-TODO.md << 'EOF'
# Phase 0 Validation TODO

**Duration**: 1 month (2025-10-23 ~ 2025-11-23)  
**Cost**: $0 (Free)  
**Platform**: OpenCode + Grok Code Fast 1

## Week 1 (2025-10-23 ~ 2025-10-29)

### Setup & Initial Validation
- [x] Install OpenCode
- [x] Configure Grok Code Fast 1
- [x] Create ForgeMind folder structure
- [ ] First Facilitator Agent conversation
- [ ] Test basic Idea→Module flow
- [ ] Document initial findings

### Experiments
- [ ] Experiment 1: Facilitator Agent - Can it understand 5-layer structure?
- [ ] Experiment 2: Discovery conversation - Can it ask right questions?
- [ ] Experiment 3: Clarify phase - Can it identify ambiguities?

## Week 2 (2025-10-30 ~ 2025-11-05)

### Core Agent Validation
- [ ] Verify BA Agent capabilities
- [ ] Verify Architect Agent capabilities
- [ ] Test Module identification
- [ ] Test Domain identification
- [ ] Document pain points

### Experiments
- [ ] Experiment 4: BA Agent - Can it collect requirements in EARS format?
- [ ] Experiment 5: Architect Agent - Can it design module structure?
- [ ] Experiment 6: Cross-layer navigation - Can it move between layers?

## Week 3 (2025-11-06 ~ 2025-11-12)

### Non-Linear Testing
- [ ] Test backtracking from Requirement to Idea
- [ ] Test Module dependency management
- [ ] Test simple Impact Analysis
- [ ] Accumulate Agent prompts
- [ ] Test Anti-Hallucination checks

### Experiments
- [ ] Experiment 7: Non-linear backtrack - Can it handle changes?
- [ ] Experiment 8: Impact Analysis - Can it identify impacts?
- [ ] Experiment 9: Anti-Hallucination - Does it prevent fabrication?

## Week 4 (2025-11-13 ~ 2025-11-23)

### Evaluation & Decision
- [ ] Compile findings
- [ ] Write Phase 0 validation report
- [ ] Identify improvements needed
- [ ] Boss decision: Proceed to Phase 1?

### Success Criteria
- [ ] ✅ AI understands 5-layer structure
- [ ] ✅ Can handle simple backtracking
- [ ] ⭕ Terminal workflow acceptable
- [ ] ⭕ Agent prompt quality high

## Notes & Discoveries

### 2025-10-23
- Setup completed
- Ready to start first conversation
- ...

(Add more notes as we progress)
EOF

echo "✅ Phase 0 TODO created"
echo ""

# =============================================
# Git初始化
# =============================================

echo "🔧 Initializing Git repository..."

git init
git add .
git commit -m "feat: Initial ForgeMind project structure v0.2.0

- Created complete folder structure
- Added initial documentation
- Ready for Phase 0 validation
"

echo "✅ Git repository initialized"
echo ""

# =============================================
# 完成
# =============================================

echo "=================================="
echo "✅ ForgeMind Project Initialized!"
echo "=================================="
echo ""
echo "📊 Project Structure:"
echo "  • .ai/          Generic Framework"
echo "  • .dev/         Project Specific"
echo "  • research/     Research Materials"
echo "  • plans/        Plans & Roadmaps"
echo "  • exports/      JSON Exports"
echo ""
echo "📄 Initial Files:"
echo "  • README.md"
echo "  • CHANGELOG.md"
echo "  • .gitignore"
echo "  • IDEA-001/current.md"
echo "  • PHASE-0-TODO.md"
echo ""
echo "🚀 Next Steps:"
echo "  1. Copy documentation files to project"
echo "  2. Copy JSON exports to exports/"
echo "  3. Start OpenCode: opencode"
echo "  4. Begin first Facilitator Agent conversation"
echo ""
echo "📖 See FORGEMIND-README.md for complete guide"
echo ""
