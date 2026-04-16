#!/bin/bash
# LLM Wiki 健康检查脚本
# 功能：检查断裂链接、时效性、孤立页面

set -e
cd "$(dirname "$0")"

echo "=== LLM Wiki 健康检查开始 ==="

# 1. 断裂链接检查
echo ""
echo "--- 检查断裂链接 ---"
BROKEN=0
for file in $(find wiki/ -name "*.md" 2>/dev/null); do
    LINKS=$(grep -oP '(?<=\[\[)[^\]]+(?=\]\])' "$file" 2>/dev/null || true)
    for link in $LINKS; do
        TARGET="wiki/$(find wiki/ -iname "${link}.md" -o -iname "${link}/index.md" 2>/dev/null | head -1)"
        if [ -z "$TARGET" ] || [ ! -f "$TARGET" ]; then
            echo "  [断裂] $file -> $link"
            BROKEN=$((BROKEN + 1))
        fi
    done
done
if [ $BROKEN -eq 0 ]; then
    echo "  未发现断裂链接"
else
    echo "  共发现 $BROKEN 个断裂链接"
fi

# 2. 时效性检查
echo ""
echo "--- 检查过期页面 ---"
EXPIRED=0
for file in $(find wiki/ -name "*.md" 2>/dev/null); do
    VALID_UNTIL=$(grep -oP '(?<=valid_until:\s)\S+' "$file" 2>/dev/null || true)
    if [ -n "$VALID_UNTIL" ]; then
        VALID_DATE=$(date -d "$VALID_UNTIL" +%s 2>/dev/null || echo "0")
        NOW=$(date +%s)
        if [ "$NOW" -gt "$VALID_DATE" ]; then
            echo "  [过期] $file (valid_until: $VALID_UNTIL)"
            EXPIRED=$((EXPIRED + 1))
        fi
    fi
done
if [ $EXPIRED -eq 0 ]; then
    echo "  没有过期页面"
else
    echo "  共发现 $EXPIRED 个过期页面"
fi

# 3. 孤立页面检查
echo ""
echo "--- 检查孤立页面 ---"
ORPHAN=0
for file in $(find wiki/ -name "*.md" 2>/dev/null); do
    BASENAME=$(basename "$file" .md)
    REFERENCED=0
    for other in $(find wiki/ -name "*.md" 2>/dev/null); do
        if [ "$other" != "$file" ]; then
            if grep -q "$BASENAME" "$other" 2>/dev/null; then
                REFERENCED=1
                break
            fi
        fi
    done
    if [ $REFERENCED -eq 0 ]; then
        echo "  [孤立] $file"
        ORPHAN=$((ORPHAN + 1))
    fi
done
if [ $ORPHAN -eq 0 ]; then
    echo "  没有孤立页面"
else
    echo "  共发现 $ORPHAN 个孤立页面"
fi

echo ""
echo "=== 健康检查完成 ==="
