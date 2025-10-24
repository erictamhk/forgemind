# ForgeMind Git Commit Guidelines

**Version**: 1.0  
**基於**: `exports/forgemind_change_management.json`  
**適用於**: ForgeMind 項目  
**原則**: 變更是常態，追溯是關鍵

## 📝 Commit 類型 (Commit Types)

使用以下精確的 commit 類型來分類變更：

### Idea 層次
- `idea:new` - 新增 Idea
- `idea:update` - 更新現有 Idea
- `idea:discovery` - 完成探索階段
- `idea:status` - 變更 Idea 狀態

### Requirements 層次  
- `req:new` - 新增需求
- `req:update` - 更新需求
- `req:cr` - 變更請求 (Change Request)
- `req:baseline` - 建立基準
- `req:review` - 完成需求審查

### Specification 層次
- `spec:draft` - 建立規格草稿
- `spec:review` - 開始規格審查
- `spec:revision` - 修訂規格
- `spec:approved` - 規格通過
- `spec:baseline` - 建立規格基準
- `spec:deprecated` - 棄用規格

### Agent 相關
- `agent:prompt` - 更新 Agent 提示詞
- `agent:workflow` - 修改 Agent 工作流程
- `agent:checklist` - 更新 Agent 檢查清單

### 文件與配置
- `docs:update` - 更新文檔
- `docs:new` - 新增文檔
- `config:update` - 更新配置
- `ask:record` - 記錄對話

## 🔄 Commit 頻率 (Commit Frequency)

**原則**: 小步快跑，頻繁提交

- 每個重要變更後立即提交
- 保持 commit 粒度適中，避免過大或過小的提交
- 確保每次 commit 都有明確的目的

## 🌿 分支策略 (Branch Strategy)

雖然項目保持 Git 簡單，但定義的分支策略如下：

- `main` - 穩定發佈版本
- `develop` - 開發主線
- `feature/*` - 功能開發分支
- `hotfix/*` - 緊急修復分支  
- `release/*` - 發佈準備分支

## 🏷️ 標籤策略 (Tagging Strategy)

使用語意化版本標籤：
- `vMAJOR.MINOR.PATCH` 格式
- 用於里程碑和重要發佈

## ⚡ Commit 觸發條件 (Commit Triggers)

### Idea 層次觸發
- 新 Idea 註冊
- Idea 版本更新
- Idea 狀態變更
- DISCOVER 階段完成

### Requirements 層次觸發
- 新需求新增
- 需求版本更新
- 變更請求提交/通過
- 基準建立
- 需求審查完成

### Specification 層次觸發
- 規格草稿建立
- 規格審查開始
- 規格修訂
- 規格通過
- 規格基準建立
- 規格棄用
- 可執行/JSON 規格更新

## 🔍 自動化檢查 (Automated Checks)

### Pre-commit 檢查
- **Traceability** - 追溯性檢查
- **Impact Analysis** - 影響分析
- **Anti-Hallucination** - 反幻覺檢查
- **Version Consistency** - 版本一致性檢查

### Post-commit 檢查
- **Update Dashboard** - 更新儀表板
- **Send Notifications** - 發送通知
- **Update Traceability** - 更新追溯
- **Log Change** - 記錄變更

## 📋 Commit 訊息格式 (Commit Message Format)

```
<type>: <簡潔摘要>

<詳細描述>
- 變更細節 1
- 變更細節 2
- 變更細節 3

Phase {X} Week {W} Day {D}
```

**範例**:
```
idea:update: 完善 ForgeMind 核心概念

- 新增兩層代理系統架構
- 定義 5 層結構 (Idea→Module→Domain→Req→Spec)
- 增加反幻覺檢查機制

Phase 0 Week 1 Day 3
```

## 🔧 多行訊息處理 (Multi-line Message Handling)

由於工具環境限制，多行 commit 訊息使用臨時文件：

1. **創建臨時文件**: `temp_commit.txt` (已加入 .gitignore)
2. **寫入訊息**: 使用正確的 Windows 行分隔符 (CRLF)
3. **執行 commit**: `git commit -F temp_commit.txt`
4. **清理文件**: 自動刪除臨時文件

**注意**: 臨時文件不會被 commit 到版本控制。

## 🎯 最佳實踐 (Best Practices)

1. **精確分類**: 使用最合適的 commit 類型
2. **詳細描述**: 說明變更的原因和影響
3. **階段標記**: 包含當前階段資訊
4. **頻繁提交**: 保持小步快跑的節奏
5. **追溯友好**: 確保 commit 訊息有助於未來追溯

## 📊 通知系統 (Notification System)

- **變更通知矩陣**: 基於變更類型自動發送通知
- **變更儀表板**: 即時查看近期變更和待批准項目
- **自動化檢查**: Pre/Post commit 自動執行品質檢查

---

**注意**: 雖然項目保持 Git 簡單，但這些指南提供了完整的變更管理框架，確保變更是常態而追溯是關鍵。