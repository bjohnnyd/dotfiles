#!/usr/bin/env python3
from i3ipc import Connection
import sys

# A1 = left click
# A2 = righ click
# A1 = middle click
# A... = some click
i3 = Connection()
marks = i3.get_marks()
focused = i3.get_tree().find_focused()

if focused:
    awt = focused.window_title
    awt = awt.replace(":", r"\:") if awt else ""
    if len(sys.argv) >= 2:
        if sys.argv[1] == "switch":
            print("switch")
    # Below starts rstudio on click
    #  print(fr"%{{A1:rstudio:}}{awt}%{{A}}")
    print(fr"{awt}")
