#!/bin/bash

printf '%s\n' '{"version":1}' '[' '[]'

read_cpu() {
    local cpu user nice system idle iowait irq softirq steal total idle_total
    read -r cpu user nice system idle iowait irq softirq steal _ < /proc/stat

    total=$((user + nice + system + idle + iowait + irq + softirq + steal))
    idle_total=$((idle + iowait))
    printf '%s %s\n' "$total" "$idle_total"
}

read -r prev_total prev_idle < <(read_cpu)

while :; do
    sleep 1
    read -r total idle < <(read_cpu)

    delta_total=$((total - prev_total))
    delta_idle=$((idle - prev_idle))

    if ((delta_total > 0)); then
        cpu=$(awk -v total="$delta_total" -v idle="$delta_idle" \
            'BEGIN {printf "%.1f", (total - idle) / total}')
    else
        cpu=0
    fi

    prev_total=$total
    prev_idle=$idle

    vol_human=$(pamixer --get-volume-human 2>/dev/null)
    if [[ $vol_human == muted ]]; then
        vol=Muted
    elif [[ -n $vol_human ]]; then
        vol=$(awk -v v="${vol_human%\%}" 'BEGIN {printf "%.1f", v / 100}')
    else
        vol=N/A
    fi

    ram=$(free -b | awk '/^Mem:/ {printf "%.1f", $3 / 1000000000}')

    if [[ -r /sys/class/power_supply/BAT0/capacity ]]; then
        read -r bat < /sys/class/power_supply/BAT0/capacity
    else
        bat=N/A
    fi

    printf -v dt '%(%a, %b %d | %H:%M)T' -1
    text=" cpu: $cpu | ram: ${ram} | vol: $vol | bat: $bat | $dt "
    printf ',[{"full_text":"%s"}]\n' "$text"
done
