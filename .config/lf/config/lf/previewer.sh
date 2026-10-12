#!/bin/sh

file="$1"
w="$2"
h="$3"

mime=$(file -b --mime-type "$file")

case "$mime" in
    image/*)
        chafa -f sixel -s "${w}x${h}" "$file"
        ;;
    video/*)
        thumb="/tmp/lf_vid_preview.png"
        ffmpeg -y -ss 00:00:02 -i "$file" -vframes 1 -f image2 "$thumb" >/dev/null 2>&1
        if [ -f "$thumb" ]; then
            chafa -f sixel -s "${w}x${h}" "$thumb"
        fi
        ;;
    application/pdf)
        thumb="/tmp/lf_pdf_preview"
        pdftoppm -png -f 1 -l 1 -scale-to 600 "$file" "$thumb" >/dev/null 2>&1
        actual_thumb="${thumb}-1.png"
        if [ -f "$actual_thumb" ]; then
            chafa -f sixel -s "${w}x${h}" "$actual_thumb"
        fi
        ;;
    *)
        if command -v batcat > /dev/null 2>&1; then
            batcat --color=always --style=plain --wrap=character "$file"
        elif command -v bat > /dev/null 2>&1; then
            bat --color=always --style=plain --wrap=character "$file"
        else
            cat "$file" 2>/dev/null
        fi
        ;;
esac
