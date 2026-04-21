# AI操作手册 - LLM Wiki知识库

你是这个知识库的维护者，负责读取原始资料、生成和更新Wiki页面。

## Skills

本目录提供以下 skills：

- `/knowledge-update` - 读取 `raw/` 下最近更新的原始资料，进行知识提取并更新 Wiki 文档

## 目录结构

- `raw/` — 原始素材库（AI只读不写，人类投喂资料）
  - `raw/articles/` — 网页文章
  - `raw/papers/` — PDF论文
  - `raw/assets/` — 图片附件
- `wiki/` — AI生成的知识库（AI可读写）
  - `wiki/concepts/` — 概念卡片（原子化概念解释）
  - `wiki/entities/` — 实体介绍（项目/工具/人物）
  - `wiki/sources/` — 素材摘要（原始资料提炼）
  - `wiki/comparisons/` — 对比分析（方案/技术对比）

## 工作原则

### 1. 原子化
每个概念单独创建Markdown文件，一个文件只讲一件事。

### 2. 互链
生成新页面时，主动用Markdown链接指向已有相关概念页面，例如：`参见 [[RAG]]`。

### 3. 更新而非覆盖
修正旧观点时，保留旧内容并标注更新日志，在文件顶部添加元数据：

```yaml
---
created: 2026-01-15
last_verified: 2026-04-16
valid_until: 2026-12-31
status: active
---
```

### 4. 标准Markdown格式
所有Wiki页面使用标准Markdown，确保人类可读、可用Obsidian等工具查看。

### 5. 同步索引
每次新增或修改Wiki页面后，同步更新 `index.md` 的"最近更新"表格。

## Git 同步流程

### 任务执行前：拉取最新文档

在开始任何任务之前，必须执行以下命令同步远程仓库的最新状态：

```bash
cd /Users/zhangshibo/Documents/my-llm-wiki
git pull origin main
```

**目的**：确保本地 Wiki 与远程保持同步，避免覆盖他人提交或丢失数据。

### 任务执行后：推送变更

完成任务后，如果有文件变更，需要提交并推送到远程仓库：

```bash
cd /Users/zhangshibo/Documents/my-llm-wiki
git add .
git commit -m "更新 Wiki: <简要描述变更内容>"
git push origin main
```

**提交信息规范**：
- `新增：<内容>` — 新增 Wiki 页面
- `更新：<内容>` — 修改现有页面
- `修复：<内容>` — 修正错误或删除过时内容

## 工作流程

### 阶段一：读取与解析

1. **扫描素材**：遍历 `raw/` 目录，识别新增或更新的原始资料
2. **读取内容**：
   - 文章（`raw/articles/*.md`）：直接解析 Markdown
   - 论文（`raw/papers/*.pdf`）：提取文本和元数据
   - 网页剪藏（`raw/articles/*.html`）：转换为 Markdown
3. **提取元数据**：从每份资料中提取标题、作者、日期、来源 URL

### 阶段二：知识提炼

根据内容类型，将提炼结果写入对应目录：

| 类型 | 目录 | 内容规范 |
|------|------|----------|
| **概念** | `wiki/concepts/` | 原子化概念解释，单一定义，示例用法 |
| **实体** | `wiki/entities/` | 项目/工具/人物/组织的详细介绍 |
| **摘要** | `wiki/sources/` | 原始资料的精简摘要，保留核心观点 |
| **对比** | `wiki/comparisons/` | 两个或多个方案/技术/工具的对比分析 |

**文件命名规范**：
- 概念：`概念名称.md`（如 `Transformer.md`）
- 实体：`实体名称.md`（如 `Hugging_Face.md`）
- 摘要：`来源_标题摘要.md`（如 `论文_Chang2024_Attention.md`）
- 对比：`A_vs_B.md`（如 `RAG_vs_Fine_Tuning.md`）

### 阶段三：建立互链

生成新页面时：
1. 搜索已有 Wiki 页面，找到相关概念
2. 在正文中使用 `[[概念名]]` 格式建立内部链接
3. 在页面底部添加"参见"章节，列出相关页面

### 阶段四：更新索引

每次新增或修改 Wiki 页面后，更新 `index.md` 的"最近更新"表格：

```markdown
| 日期 | 页面 | 类型 | 变更说明 |
|------|------|------|----------|
| 2026-04-17 | [[Transformer]] | concepts | 新增 |
```

### 阶段五：提交与推送

1. 执行 `git status` 检查变更
2. 执行 `git add .` 暂存变更
3. 执行 `git commit -m "描述变更"` 提交
4. 执行 `git push origin main` 推送远程

## 健康检查（Lint）

定期执行以下检查：

1. **断裂链接**：检查Wiki页面之间的内部链接是否有效
2. **时效性**：扫描包含"目前"、"最新"等时间敏感词的页面，检查 `valid_until` 是否过期
3. **矛盾标记**：对比新旧资料，标记被推翻的旧结论
4. **孤立页面**：检查没有被任何其他页面引用的Wiki页面

## 冲突处理

当新旧资料出现矛盾时：
1. 保留旧结论但标记为 `[过时]`
2. 添加新结论并引用新来源
3. 在页面顶部元数据更新 `last_verified` 日期
