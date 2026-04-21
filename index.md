# LLM Wiki 知识库

> 由 AI 维护的 Markdown 知识库，基于 LLM Wiki 架构设计。

## 快速导航

- [概念卡片](wiki/concepts/) — 核心概念的原子化解释
- [实体介绍](wiki/entities/) — 项目、工具、人物等实体
- [素材摘要](wiki/sources/) — 原始资料的提炼摘要
- [对比分析](wiki/comparisons/) — 不同方案/技术的对比
- [变更日志](log.md) — 知识库变更历史记录

## 目录结构

```
my-llm-wiki/
├── raw/                # 原始素材库（AI 只读不写）
│   ├── articles/       # 网页文章
│   ├── papers/         # PDF 论文
│   └── assets/         # 图片附件
├── wiki/               # AI 生成的知识库
│   ├── concepts/       # 概念卡片
│   ├── entities/       # 实体介绍
│   ├── sources/        # 素材摘要
│   └── comparisons/    # 对比分析
├── CLAUDE.md           # AI 操作手册
├── log.md              # 变更日志
└── index.md            # 知识库导航（本文件）
```

## 概念索引

### AI 基础设施
- [[OpenClaw-龙虾]] — 开源 AI Agent 桌面框架
- [[Agent 智能体]] — 自主规划执行的 AI 实体
- [[Token Plan]] — AI 模型统一订阅计费
- [[MMX-CLI]] — MiniMax 命令行工具
- [[LLM Wiki]] — Karpathy 知识库方案（利用 LLM 构建持久化 Wiki，vs 传统 RAG）
- [[RAG]] — 检索增强生成，LLM Wiki 的对比方式

### AI 人物
- [[Andrej Karpathy]] — 前 OpenAI 科学家，LLM Wiki 提出者

### 大模型厂商
- [[Gemma 4]] — 谷歌开放模型
- [[GLM-5.1]] — 智谱旗舰模型
- [[Muse Spark]] — Meta 多模态模型
- [[Qwen3.6-Plus]] — 阿里编码智能体
- [[ERNIE-Image]] — 百度文生图模型
- [[MAI-Transcribe-1]] — 微软转录模型

### 多模态模型
- [[全模态大模型]] — 文本/图像/音频/视频统一模型
- [[Muse Spark]] — Meta 原生多模态模型
- [[Wan2.7-Video]] — 阿里视频生成模型
- [[Wan2.7-Image]] — 阿里图像生成模型

### AI 视频生成
- [[AI 视频生成]] — AI 视频生成技术与模型对比
- [[Seedance 2.0]] — 火山引擎视频生成模型
- [[PixVerse C1]] — 影视行业大模型
- [[LPM 1.0]] — 米哈游 AI 视频模型
- [[HY-World 2.0]] — 腾讯 3D 世界模型
- [[Spark 2.0]] — World Labs 渲染引擎

### AI 语音
- [[Seeduplex]] — 字节跳动全双工语音模型
- [[VoxCPM2]] — 开源语音合成模型

### AI 工具
- [[千问]] — 阿里全能 AI 助手
- [[Meoo]] — 阿里 AI 开发工具
- [[Lantay]] — 面壁智能文档工作台
- [[Octo]] — 即梦动态叙事创作工具

### AI 技术
- [[VimRAG]] — 阿里全模态知识库框架
- [[MiniMax M2.7]] — 自我进化 AI 模型

## 素材摘要

- [[2026年3-4月AI资讯摘要]] — 原始资料：每日 AI 资讯
- [[LLM_Wiki原始文献摘要]] — 原始资料：LLM Wiki 中英文原文
