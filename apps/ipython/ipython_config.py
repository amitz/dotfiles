import importlib

c = get_config()

# Make sure you installed the Solarized theme first from:
# https://github.com/shkumagai/pygments-style-solarized
is_solarized_installed = importlib.find_loader('pygments_style_solarized')

if is_solarized_installed is not None:
    c.TerminalInteractiveShell.highlighting_style = "solarizeddark"
else:
    c.InteractiveShell.colors = 'Linux'

c.InteractiveShell.editor = 'vim'
c.TerminalInteractiveShell.editing_mode = 'vi'
