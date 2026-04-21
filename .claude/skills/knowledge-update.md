---
name: knowledge-update
description: 读取 raw/下最近更新的原始资料，进行知识提取并更新 Wiki 文档
---

# knowledge-update - 知识更新技能

## 功能

读取 `raw/` 目录下最近更新的原始资料，进行知识提取并更新 Wiki 文档。

## 执行流程

### 1. Git 同步（任务前）

```bash
cd /Users/zhangshibo/Documents/my-llm-wiki
git pull origin main
```

### 2. 扫描原始资料

遍历 `raw/` 目录，识别最近新增或更新的文件：
- `raw/articles/` - 网页文章
- `raw/papers/` - PDF 论文
- `raw/articles/*.html` - 网页剪藏

### 3. 知识判断与处理

对每个新资料进行判断：

**如果是新知识（Wiki 中不存在相关文档）：**
- 提取核心概念 → 生成 `wiki/concepts/概念名称.md`
- 提取涉及的实体 → 生成 `wiki/entities/实体名称.md`
- 生成摘要 → 生成 `wiki/sources/摘要_来源标题.md`
- 如有对比内容 → 生成 `wiki/comparisons/A_vs_B.md`

**如果是旧知识（Wiki 中已存在相关文档）：**
- 对比新旧内容，识别新增/修正的观点
- 更新对应 Wiki 页面
- 在文件顶部元数据更新 `last_verified` 日期
- 如有被推翻的旧结论，标记为 `[过时]` 并保留

### 4. 建立互链

生成或更新的页面中：
- 使用 `[[概念名]]` 格式建立内部链接
- 在页面底部添加"参见"章节

### 5. 更新索引

更新 `index.md` 的"最近更新"表格：

```markdown
| 日期 | 页面 | 类型 | 变更说明 |
|------|------|------|----------|
| 2026-04-17 | [[概念名]] | concepts | 新增/更新 |
```

### 6. Git 提交（任务后）

```bash
git add .
git status
git commit -m "更新 Wiki: 知识更新 <日期或内容简述>"
git push origin main
```

## 文件命名规范

| 类型 | 目录 | 命名格式 | 示例 |
|------|------|----------|------|
| 概念 | `wiki/concepts/` | `概念名称.md` | `Transformer.md` |
| 实体 | `wiki/entities/` | `实体名称.md` | `Hugging_Face.md` |
| 摘要 | `wiki/sources/` | `来源_标题摘要.md` | `论文_Chang2024_Attention.md` |
| 对比 | `wiki/comparisons/` | `A_vs_B.md` | `RAG_vs_Fine_Tuning.md` |

## 元数据格式

每个 Wiki 文件顶部应包含：

```yaml
---
created: 2026-01-15
last_verified: 2026-04-17
valid_until: 2026-12-31
status: active  # 或 outdated
---
```
