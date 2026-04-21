---
name: knowledge-update
description: 触发知识库更新流程
---

# knowledge-update

## 触发条件

- `raw/` 目录下有新增或更新的原始资料（文章、论文、网页剪藏等）
- 用户明确要求"更新知识库"或"处理 raw/ 新资料"

## 核心动作

1. **Git 同步**：`git pull origin main`
2. **检查变更**：`git diff HEAD -- raw/` 或 `git status --short raw/` 确认有未提交的变更
   - 若无变更 → 退出
3. **识别文件**：列出 `raw/` 下新增/更新的文件
4. **调用主流程**：按 `CLAUDE.md` 中"知识录入"工作流程执行
5. **Git 提交**：变更完成后执行 `git add . && git commit -m "..." && git push`

> 详细的更新规则、命名规范、元数据格式等参见 `CLAUDE.md`。
