import i3ipc
import os
import sys
from filelock import FileLock

# Ensure only one instance runs
lock = FileLock("/tmp/i3_auto_workspace.lock")
try:
    with lock.acquire(timeout=0):
        pass
except Timeout:
    print("Another instance is already running. Exiting.")
    sys.exit(0)

# Rest of your existing script
i3 = i3ipc.Connection()

def get_next_workspace_number():
    workspaces = i3.get_workspaces()
    numbers = []
    for ws in workspaces:
        if ws.name.isdigit():
            numbers.append(int(ws.name))
    return max(numbers) + 1 if numbers else 1

def on_window_new(i3, e):
    new_ws = str(get_next_workspace_number())
    i3.command(f'move container to workspace {new_ws}')
    i3.command(f'workspace {new_ws}')

i3.on('window::new', on_window_new)
i3.main()
