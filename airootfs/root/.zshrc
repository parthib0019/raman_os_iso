if [ "$(tty)" = "/dev/ttyS0" ]; then
        echo "=========================================="
        echo "=== DUMPING SYSTEMD JOURNAL ERRORS ==="
        echo "=========================================="
        journalctl -b -p 3 --no-pager

        echo ""
        echo "=========================================="
        echo "=== DUMPING HYPRLAND STARTUP LOGS ==="
        echo "=========================================="
        cat /home/raman/.local/share/hypr/*/hyprland.log 2>/dev/null
        cat /home/raman/.hyprland.log 2>/dev/null

        echo ""
        echo "=========================================="
        echo "=== DUMPING USER HYPRLAND CONFIG ==="
        echo "=========================================="
        cat /home/raman/.config/hypr/hyprland.conf 2>/dev/null || echo "No hyprland.conf found in /home/raman/.config/hypr!"

        echo ""
        echo "=========================================="
        echo "=== DUMPING INPUT DEVICES (UDEV) ==="
        echo "=========================================="
        udevadm info --export-db | grep -E "N: input|E: ID_INPUT"

        echo ""
        echo "=========================================="
        echo "=== DUMPING SEAT/LOGIND STATUS ==="
        echo "=========================================="
        loginctl list-sessions
        loginctl show-session $(loginctl | grep raman | awk '{print $1}') 2>/dev/null
        echo "=========================================="
    fi
