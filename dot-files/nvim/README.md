# 🚀 Custom Neovim IDE Workspace

This repository houses my modern, lightweight, and blazing-fast Integrated Development Environment (IDE) built on top of **Neovim** and **LazyVim**. 

The configuration is optimized to run seamlessly inside a `tmux` dual-pane layout, dedicating the left pane to running autonomous AI agents or scripts, and the right pane to full-stack code orchestration.

---

## 🛠️ Workspace Architecture

- **Left Pane (`tmux`):** AI Agents / Command Line Processes / Build Servers.
- **Right Pane (`tmux` + Neovim):** Interactive code editing, visual file trees, project searches, and deep Git management.

---

## ⚙️ Prerequisites & Dependencies

To ensure all icons, code servers, and interactive UI dashboards render instantly and flawlessly, install the following on the host system:

### 1. Terminal Dependencies
* **macOS:** `brew install neovim git ripgrep fzf lazygit`
* **Linux (Ubuntu/Debian):**
  ```bash
  sudo add-apt-repository ppa:neovim-ppa/stable -y
  sudo apt update
  sudo apt install neovim git ripgrep fzf
  # Install lazygit separately via official PPA/binary
  ```

### 2. UI Requirement (Nerd Fonts)
This configuration requires a **Nerd Font** to display visual system icons correctly. Download and set your terminal application to use **JetBrainsMono Nerd Font** (or any preferred Nerd Font flavor).

---

## 🚀 Fresh Installation Steps

If you are restoring this configuration on a completely brand-new machine, run the following sequential commands:

```bash
# 1. Purge any default or empty configurations
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim

# 2. Clone this specific configuration layout
git clone <YOUR_BACKUP_REPOSITORY_URL> ~/.config/nvim

# 3. Fire up Neovim to trigger automatic system plugin bootstrap
nvim
```
*Note: On the first launch, Lazy.nvim will automatically download all IDE packages. Wait for completion, then restart Neovim.*

---

## 📋 Core Productivity Hotkeys

The system uses the **Spacebar** as the global `<leader>` key.

### 1. Navigation & Views
* `Space` → `e` : Toggle Visual Project File Tree (`Neo-tree`)
* `Space` → `Space` : Fuzzy find project files by name instantly
* `Space` → `/` : Live Grep search for specific text/strings project-wide
* `Shift` + `l` / `h` : Cycle through open code tabs (right / left)
* `Space` → `b` → `d` : Close current open file buffer safely

### 2. Native Code Intelligence (LSP)
* `g` → `d` : **Go to Definition** (Jump to source creation)
* `g` → `r` : **Go to References / Usages** across the workspace
* `K` *(Shift + k)* : Open hovering code documentation/tooltips
* `Space` → `c` → `r` : Rename variables/functions safely project-wide
* `Space` → `c` → `f` : Format file via language server specs

### 3. Git Operations
* `Space` → `g` → `g` : Open `LazyGit` overlay pane (staging, commits, branch history)
* `Space` → `g` → `h` → `p` : Preview inline code changes (hunk modifications)

---

## 🔧 Personal Overrides & Customizations

### Home Row Escape
* **`jk`** is natively mapped to exit **Insert Mode** back into **Normal Mode** without leaving the keyboard home row.

### Sourcing Legacy `vimrc` Commands
Legacy operations can be injected directly via `~/.config/nvim/lua/config/options.lua` inside the native `vim.cmd` runtime hook.

### How to Reload Config On-The-Fly
To pull in your keymap changes instantly without cycling the editor session:
* Command Line: `:source %` (if looking directly at the file)
* Macro shortcut: Configured inside `keymaps.lua` to sync changes cleanly.
