# mdview

A lightweight CLI tool for reading and previewing Markdown documents in your terminal.

No browser, no GUI -- just clean, formatted output right where you work.

## Why?

Reading `.md` files with `cat` is painful. Copying them into a browser tab breaks your flow.
`mdview` renders Markdown with syntax highlighting, word wrapping, and optional paging,
so you can stay in the terminal and actually enjoy reading docs.

It also ships with an interactive file browser (TUI mode) that lets you navigate
and preview Markdown files across a project.

## Getting started

### Install (Linux / macOS)

```bash
curl -sSL https://raw.githubusercontent.com/frotaur/mdview/master/install.sh | bash
```

This puts the `mdview` binary in `~/.local/bin`.

### Build from source

Requires Go 1.24+.

```bash
git clone https://github.com/frotaur/mdview.git
cd mdview
go build -o mdview .
```

## Examples

```bash
# Preview a file
mdview notes.md

# Pipe from another command
cat CHANGELOG.md | mdview -

# Open the interactive browser in the current directory
mdview

# Fetch and render a remote document
mdview https://example.com/specs.md

# Use a pager for long files
mdview -p docs/architecture.md

# Force a specific style
mdview -s dark README.md
```

## Flags

| Flag | Description |
|------|-------------|
| `-s, --style` | Rendering style (`dark`, `light`, `auto`, or path to a JSON theme) |
| `-w, --width` | Column width for word wrapping (default: terminal width, max 120) |
| `-p, --pager` | Pipe output through `$PAGER` (defaults to `less -r`) |
| `-t, --tui` | Force TUI / interactive mode |
| `-l, --line-numbers` | Show line numbers (TUI mode) |
| `-a, --all` | Include hidden and ignored files (TUI mode) |
| `-n, --preserve-new-lines` | Keep blank lines as-is in output |

## Configuration

Run `mdview config` to open the config file in `$EDITOR`. Settings are stored in
`mdview.yml` under your platform's config directory (`~/.config/mdview/` on Linux).

Example:

```yaml
style: "dark"
width: 100
pager: true
all: false
```

## License

[MIT](LICENSE)
