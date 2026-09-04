#!/usr/bin/env bash
# ==============================================================================
# Antigravity Agentic Workflows - Cross-Platform Installer (Linux / macOS / WSL)
# ==============================================================================
# Copies prompts, workflows, and skills into the global scope (~/.gemini) or a
# specific project directory (.agents/).
# Includes safeguards with timestamped backups (YYYYMMDD_HHMM).
# ==============================================================================

set -e

# ANSI Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
GRAY='\033[0;90m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Base repository locations
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_PROMPTS="$REPO_ROOT/prompts"
SOURCE_WORKFLOWS="$REPO_ROOT/workflows"
SOURCE_SKILLS="$REPO_ROOT/skills"
SOURCE_GEMINI_RULE="$SOURCE_PROMPTS/gemini.md"

# Validate sources
if [ ! -d "$SOURCE_WORKFLOWS" ] || [ ! -d "$SOURCE_SKILLS" ]; then
    echo -e "${RED}[ERROR] 'workflows' or 'skills' directories not found in: $REPO_ROOT${NC}"
    echo -e "${YELLOW}Make sure you are running the script from the root of the cloned/extracted repository.${NC}"
    exit 1
fi

print_header() {
    echo ""
    echo -e "${CYAN}============================================================${NC}"
    echo -e "${CYAN}  $1${NC}"
    echo -e "${CYAN}============================================================${NC}"
}

print_success() { echo -e "  ${GREEN}[OK]${NC} $1"; }
print_info()    { echo -e "  ${GRAY}[INFO]${NC} $1"; }
print_warn()    { echo -e "  ${YELLOW}[WARN]${NC} $1"; }
print_sim()     { echo -e "  ${MAGENTA}[SIMULATION]${NC} $1"; }

show_help() {
    echo "Usage: ./install.sh [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  -g, --global           Install into global user scope (~/.gemini)"
    echo "  -p, --project <path>   Install into a specific project directory (.agents/)"
    echo "  -f, --force            Overwrite existing files without interactive confirmation"
    echo "      --no-backup        Disable creating timestamped backup directory"
    echo "      --dry-run          Simulate installation without modifying files on disk"
    echo "  -h, --help             Show this help message"
    echo ""
    echo "Examples:"
    echo "  ./install.sh --global"
    echo "  ./install.sh -p /path/to/my-project"
    echo "  ./install.sh -g --dry-run"
    exit 0
}

# Parse parameters
MODE=""
PROJECT_PATH=""
FORCE=false
NO_BACKUP=false
DRY_RUN=false
OVERWRITE_ALL=false

while [[ $# -gt 0 ]]; do
    case "$1" in
        -g|--global)
            MODE="global"
            shift
            ;;
        -p|--project)
            MODE="project"
            PROJECT_PATH="$2"
            shift 2
            ;;
        -f|--force)
            FORCE=true
            OVERWRITE_ALL=true
            shift
            ;;
        --no-backup)
            NO_BACKUP=true
            shift
            ;;
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        -h|--help)
            show_help
            ;;
        *)
            echo -e "${RED}[ERROR] Unknown option: $1${NC}"
            show_help
            ;;
    esac
done

# Interactive menu if no mode was provided
if [ -z "$MODE" ]; then
    print_header "Antigravity Agentic Workflows Installer"
    echo "Choose installation mode:"
    echo ""
    echo -e "  [1] Global  (~/.gemini) - Applies to all projects on this machine"
    echo -e "  [2] Project (.agents)   - Installs into a specific project directory"
    echo -e "  [3] Exit"
    echo ""
    read -rp "Enter option [1-3]: " choice
    case "$choice" in
        1)
            MODE="global"
            ;;
        2)
            read -rp "Enter project directory path: " input_proj
            if [ -z "$input_proj" ]; then
                echo -e "${RED}[ERROR] Project path cannot be empty.${NC}"
                exit 1
            fi
            MODE="project"
            PROJECT_PATH="$input_proj"
            ;;
        3)
            echo -e "${YELLOW}Installation canceled by user.${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}[ERROR] Invalid option. Operation aborted.${NC}"
            exit 1
            ;;
    esac
fi

TIMESTAMP="$(date +"%Y%m%d_%H%M")"

if [ "$MODE" = "global" ]; then
    TARGET_MODE="Global"
    TARGET_BASE="$HOME/.gemini"
    TARGET_RULE_FILE="$TARGET_BASE/GEMINI.md"
    TARGET_WORKFLOWS_DIR="$TARGET_BASE/config/global_workflows"
    TARGET_SKILLS_DIR="$TARGET_BASE/config/skills"
    BACKUP_DIR="$TARGET_BASE/backups/backup_$TIMESTAMP"
else
    TARGET_MODE="Project"
    mkdir -p "$PROJECT_PATH"
    TARGET_PROJECT_ROOT="$(cd "$PROJECT_PATH" && pwd)"
    TARGET_BASE="$TARGET_PROJECT_ROOT/.agents"
    TARGET_RULE_FILE="$TARGET_PROJECT_ROOT/GEMINI.md"
    TARGET_WORKFLOWS_DIR="$TARGET_BASE/workflows"
    TARGET_SKILLS_DIR="$TARGET_BASE/skills"
    BACKUP_DIR="$TARGET_BASE/backups/backup_$TIMESTAMP"
fi

print_header "Installation Setup ($TARGET_MODE)"
print_info "Mode:                $TARGET_MODE"
print_info "Repository Source:   $REPO_ROOT"
print_info "Rules Target:        $TARGET_RULE_FILE"
print_info "Workflows Target:    $TARGET_WORKFLOWS_DIR"
print_info "Skills Target:       $TARGET_SKILLS_DIR"
if [ "$NO_BACKUP" = false ]; then
    print_info "Backup Directory:    $BACKUP_DIR"
fi
if [ "$DRY_RUN" = true ]; then
    echo -e "\n${MAGENTA}*** DRY-RUN SIMULATION ACTIVE - NO FILES WILL BE MODIFIED ***${NC}\n"
fi

# Safe single file install function
install_single_file() {
    local src="$1"
    local dest="$2"
    local rel_backup="$3"

    if [ ! -f "$src" ]; then
        print_warn "Source file not found: $src"
        return
    fi

    local dest_dir
    dest_dir="$(dirname "$dest")"
    local file_name
    file_name="$(basename "$dest")"

    if [ -f "$dest" ]; then
        # Check if identical
        if cmp -s "$src" "$dest"; then
            print_info "$file_name is already up to date and identical."
            return
        fi

        # File exists and differs
        if [ "$DRY_RUN" = false ] && [ "$OVERWRITE_ALL" = false ]; then
            echo ""
            echo -e "${YELLOW}File '$file_name' already exists at target and differs.${NC}"
            read -rp "Overwrite? [y]es / [n]o / [a]ll / [c]ancel: " resp
            case "$resp" in
                [yY]*) ;;
                [aA]*) OVERWRITE_ALL=true ;;
                [nN]*) print_info "Skipped: $file_name"; return ;;
                [cC]*) echo -e "${YELLOW}Installation aborted by user.${NC}"; exit 0 ;;
                *) print_info "Skipped by default: $file_name"; return ;;
            esac
        fi

        # Backup
        if [ "$NO_BACKUP" = false ]; then
            local backup_file_dest="$BACKUP_DIR/$rel_backup"
            local backup_file_dir
            backup_file_dir="$(dirname "$backup_file_dest")"
            if [ "$DRY_RUN" = true ]; then
                print_sim "Backup '$dest' -> '$backup_file_dest'"
            else
                mkdir -p "$backup_file_dir"
                cp "$dest" "$backup_file_dest"
                print_warn "Backup created: $rel_backup"
            fi
        fi
    fi

    if [ "$DRY_RUN" = true ]; then
        print_sim "Copy '$src' -> '$dest'"
    else
        mkdir -p "$dest_dir"
        cp "$src" "$dest"
        print_success "Installed: $file_name"
    fi
}

# 1. Install Rule (GEMINI.md)
print_header "1. Installing Base Prompt / Global Rule"
if [ -f "$SOURCE_GEMINI_RULE" ]; then
    install_single_file "$SOURCE_GEMINI_RULE" "$TARGET_RULE_FILE" "GEMINI.md"
else
    print_warn "Source file $SOURCE_GEMINI_RULE not found."
fi

# 2. Install Workflows
print_header "2. Installing Workflows (Slash Commands)"
for wf in "$SOURCE_WORKFLOWS"/*.md; do
    if [ -f "$wf" ]; then
        wf_name="$(basename "$wf")"
        install_single_file "$wf" "$TARGET_WORKFLOWS_DIR/$wf_name" "workflows/$wf_name"
    fi
done

# 3. Install Skills
print_header "3. Installing Modular Skills"
for skill_dir in "$SOURCE_SKILLS"/*; do
    if [ -d "$skill_dir" ]; then
        skill_name="$(basename "$skill_dir")"
        while IFS= read -r -d '' file; do
            rel_file="${file#"$skill_dir"/}"
            dest_file="$TARGET_SKILLS_DIR/$skill_name/$rel_file"
            rel_backup="skills/$skill_name/$rel_file"
            install_single_file "$file" "$dest_file" "$rel_backup"
        done < <(find "$skill_dir" -type f -print0)
    fi
done

# Completion
print_header "Installation Completed Successfully!"
if [ "$DRY_RUN" = true ]; then
    echo -e "${MAGENTA}Simulation completed. No files were modified on disk.${NC}\n"
else
    echo -e "${GREEN}All resources synchronized successfully.${NC}"
    if [ -d "$BACKUP_DIR" ]; then
        echo -e "\n${YELLOW}[BACKUP] Replaced files were backed up to:${NC}"
        echo -e "  ${CYAN}$BACKUP_DIR${NC}\n"
    fi
    echo -e "To get started in Antigravity:"
    echo -e "${GRAY}  1. Open or reload your session in the Antigravity IDE.${NC}"
    echo -e "${GRAY}  2. Type /ask or /plan in chat to verify available slash commands.${NC}\n"
fi
