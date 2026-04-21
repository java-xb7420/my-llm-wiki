---
created: 2026-04-21
last_verified: 2026-04-21
valid_until: 2026-12-31
status: active
source: raw/articles/llm-wiki.md + raw/articles/大语言模型知识库-CN.md
---

# LLM Wiki 原始文献摘要

## 来源

| 文件 | 语言 |
|------|------|
| `raw/articles/llm-wiki.md` | 英文原文 |
| `raw/articles/大语言模型知识库-CN.md` | 中文译本 |

## 核心观点

1. **RAG 的局限**：传统 RAG 每次查询都从零检索，无知识积累；NotebookLM、ChatGPT 文件上传均属此类。

2. **LLM Wiki 模式**：LLM 增量构建并维护一份持久化的结构化 Markdown Wiki，位于用户与原始资料之间。新资料录入时，LLM 阅读、提取、整合——更新实体页、修订摘要、标注矛盾。

3. **三层架构**：原始资料层（不可变）→ Wiki 层（LLM 生成维护）→ 规范层（CLAUDE.md/AGENTS.md 定义规则）。

4. **三大操作**：
   - **Ingest（录入）**：LLM 阅读资料，写摘要、更新索引和相关页面、记日志
   - **Query（查询）**：LLM 基于 Wiki 生成答案，优质答案可回存为 Wiki 新页面
   - **Lint（校验）**：定期检查矛盾、过时、孤立页面、缺失概念和交叉引用

5. **索引与日志**：`index.md` 为内容目录（按分类），`log.md` 为时间顺序操作日志。中等规模（~100 资料、~数百页面）下索引文件即可，无需向量检索。

6. **适用场景**：个人成长、学术研究、书籍阅读、企业内部 Wiki、竞品分析等。

7. **为何有效**：维护知识库的瓶颈是日常管理（更新引用、同步摘要、标注矛盾），LLM 不厌其烦，维护成本趋近于零。人类负责筛选资料、提问、思考；LLM 负责所有繁琐的维护工作。

8. **历史渊源**：与 Vannevar Bush 1945 年提出的 Memex 概念精神相通——个人化知识存储与关联路径，LLM 解决了 Bush 未能解决的维护问题。

## 关键工具推荐

- Obsidian（查看/编辑 Wiki）+ Web Clipper（网页剪藏）
- qmd（本地 Markdown 搜索引擎，BM25/向量混合检索 + LLM 重排序）
- Marp（幻灯片）、Dataview（元数据查询）
- Git（版本控制）

---

*录入日期：2026-04-21*
