#!/usr/bin/env bash
#=============================================================================#
# name:        oxipng-recursively
# author:      botus99
# messed with: 2026-11-06
# dep/reqs:    oxipng (installed through cargo)
#              bash 5.0 or newer (because it uses $EPOCHREALTIME for timing)
# description: recursively optimizes png files in current directory with oxipng
#              has a prettier and more informative output than oxipng stock
#              I link this to 'oxipng-recursively' in my '$HOME/.local/bin'
#=============================================================================#

set -u
export LC_ALL=C

OXIPNG="$HOME/.cargo/bin/oxipng"
FRAMES=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
TTY=0
[[ -t 1 ]] && TTY=1
LABEL_FILE=$(mktemp) || exit 1
SPIN_PID=""

style() {
  if (( TTY )); then
    printf '\033[%sm%s\033[0m' "$2" "$1"
  else
    printf '%s' "$1"
  fi
}

human() {
  awk -v n="$1" 'BEGIN {
    s = n + 0
    split("B KiB MiB", u, " ")
    for (i = 1; i <= 3; i++) {
      if (s < 1024) {
        if (i == 1) printf "%.0f B", s
        else        printf "%.1f %s", s, u[i]
        exit
      }
      s /= 1024
    }
    printf "%.1f GiB", s
  }'
}

row() {
  printf '  %-18s%s\n' "$1" "$2"
}

# spinner runs in the background; reads the current label from LABEL_FILE each frame.
spinner() {
  local i=0 label
  while :; do
    label=$(<"$LABEL_FILE")
    printf '\r\033[K\033[36m%s\033[0m %s' "${FRAMES[i % ${#FRAMES[@]}]}" "$label"
    i=$((i + 1))
    sleep 0.08
  done
}

start_spinner() {
  if (( TTY )); then
    spinner &
    SPIN_PID=$!
  fi
}

stop_spinner() {
  if [[ -n $SPIN_PID ]]; then
    kill -CONT "$SPIN_PID" 2>/dev/null
    kill "$SPIN_PID" 2>/dev/null
    wait "$SPIN_PID" 2>/dev/null
    SPIN_PID=""
    printf '\r\033[K'
  fi
}

# pauses the spinner while a log line is written so the two never collide.
log_line() {
  if (( TTY )); then
    kill -STOP "$SPIN_PID" 2>/dev/null
    printf '\r\033[K%s\n' "$1"
    kill -CONT "$SPIN_PID" 2>/dev/null
  else
    printf '%s\n' "$1"
  fi
}

cleanup() {
  stop_spinner
  rm -f "$LABEL_FILE"
}
trap cleanup EXIT
trap 'stop_spinner; printf "\nInterrupted. Files already processed were kept.\n"; exit 130' INT

main() {
  local root=$PWD path rel left counter before after rc err detail line pct
  local -a files=()

  while IFS= read -r -d '' path; do
    files+=("$path")
  done < <(find "$root" -type f -iname '*.png' -print0 | sort -z)

  if (( ${#files[@]} == 0 )); then
    echo "No PNG files found."
    return
  fi
  if [[ ! -x $OXIPNG ]]; then
    echo "oxipng not found at $OXIPNG" >&2
    exit 1
  fi

  local total=${#files[@]} i
  local optimized=0 unchanged=0 failed=0 total_before=0 total_after=0
  local start=$EPOCHREALTIME

  printf '%s\n\n' "$(style "Optimizing $total PNG file(s) in $root" 1)"
  start_spinner

  for (( i = 1; i <= total; i++ )); do
    path=${files[i-1]}
    rel=${path#"$root"/}
    left=$(style "($((total - i)) left)" 2)
    printf '[%d/%d] %s  %s' "$i" "$total" "$rel" "$left" > "$LABEL_FILE"

    before=$(wc -c < "$path" | tr -d ' ')
    err=$("$OXIPNG" -o max "$path" 2>&1 >/dev/null)
    rc=$?
    after=$(wc -c < "$path" | tr -d ' ')

    total_before=$((total_before + before))
    total_after=$((total_after + after))
    counter=$(style "[$i/$total]" 2)

    if (( rc != 0 )); then
      failed=$((failed + 1))
      detail=$(printf '%s\n' "$err" | awk 'NF { last = $0 } END { print (last == "" ? "unknown error" : last) }')
      line="$(style '✘' 31) $counter $rel  $(style "failed: $detail" 31)"
    elif (( after < before )); then
      optimized=$((optimized + 1))
      pct=$(awk -v b="$before" -v a="$after" 'BEGIN { printf "%.2f", (b - a) / b * 100 }')
      line="$(style '✔' 32) $counter $rel  $(human "$before") → $(human "$after")  $(style "−${pct}%" 32)"
    else
      unchanged=$((unchanged + 1))
      line="$(style '–' 2) $counter $rel  $(style 'already optimal' 2)"
    fi
    log_line "$line"
  done

  stop_spinner

  local elapsed saved saved_pct
  elapsed=$(awk -v s="$start" -v e="$EPOCHREALTIME" 'BEGIN { printf "%.1f", e - s }')
  saved=$((total_before - total_after))
  saved_pct=$(awk -v s="$saved" -v t="$total_before" 'BEGIN { if (t > 0) printf "%.2f", s / t * 100; else printf "0.00" }')

  echo
  echo "$(style Summary 1)"
  row "Files processed" "$total"
  row "Optimized" "$(style "$optimized" 32)"
  row "Unchanged" "$unchanged"
  if (( failed )); then
    row "Failed" "$(style "$failed" 31)"
  else
    row "Failed" 0
  fi
  row "Original size" "$(human "$total_before")"
  row "Final size" "$(human "$total_after")"
  row "Space saved" "$(style "$(human "$saved") (${saved_pct}%)" 32)"
  row "Time elapsed" "${elapsed}s"
}

main "$@"
