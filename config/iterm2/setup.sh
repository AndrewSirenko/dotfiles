#!/bin/bash
# iTerm2 configuration setup
# Run this to install dynamic profiles and configure iTerm2 preferences

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ITERM2_DIR="$HOME/Library/Application Support/iTerm2"
DYNAMIC_PROFILES_DIR="$ITERM2_DIR/DynamicProfiles"

echo "=== iTerm2 Setup ==="

# Install dynamic profile
mkdir -p "$DYNAMIC_PROFILES_DIR"
ln -sf "$SCRIPT_DIR/dynamic-profile.json" "$DYNAMIC_PROFILES_DIR/dotfiles-profile.json"
echo "✓ Dynamic profile linked"

# --- Startup behavior: open default window arrangement ---
defaults write com.googlecode.iterm2 OpenArrangementAtStartup -bool true
defaults write com.googlecode.iterm2 OpenNoWindowsAtStartup -bool false

# --- Hotkey window for dsk-tmux (Cmd+Shift+I) ---
# Modifiers: Cmd=1048576, Shift=131072, Cmd+Shift=1179648
# Key code for 'i' = 34
defaults write com.googlecode.iterm2 HotKeyBookmark -string "dsk-tmux"
defaults write com.googlecode.iterm2 HotkeyCode -int 34
defaults write com.googlecode.iterm2 HotkeyChar -int 73
defaults write com.googlecode.iterm2 HotkeyModifiers -int 1179648
defaults write com.googlecode.iterm2 Hotkey -bool true

# --- Split pane working directory: reuse previous session's directory ---
# This is handled by "Custom Directory": "Recycle" in the dynamic profile.
# Shell integration on the remote host is needed for SSH directory tracking.

# --- Window style: maximize ---
defaults write com.googlecode.iterm2 WindowStyle -int 0

echo "✓ Preferences written"

echo ""
echo "=== Manual steps ==="
echo ""
echo "1. WINDOW ARRANGEMENT (open maximized with top/bottom split):"
echo "   a. Open iTerm2"
echo "   b. Maximize the window (Cmd+Enter for fullscreen, or drag to fill screen)"
echo "   c. Split horizontally: Cmd+Shift+D"
echo "   d. Window → Save Window Arrangement As... → name it 'Default'"
echo "   e. Set as default: Window → Set Default Arrangement"
echo ""
echo "2. SHELL INTEGRATION on remote host (for split-in-same-dir over SSH):"
echo "   Run on dsk:"
echo "     curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash"
echo ""
echo "3. VERIFY HOTKEY WINDOW:"
echo "   a. Open iTerm2 → Preferences → Profiles → dsk-tmux → Keys"
echo "   b. Check 'A hotkey opens a dedicated window with this profile'"
echo "   c. Set hotkey to Cmd+Shift+I"
echo "   (The defaults write above may not fully configure the new hotkey window"
echo "    format — iTerm2's hotkey window config is complex. If it doesn't work,"
echo "    set it manually in the GUI once and it'll persist.)"
echo ""
echo "4. RESTART iTerm2 for changes to take effect."
