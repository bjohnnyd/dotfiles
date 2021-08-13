#!/usr/bin/env python3
from i3ipc.aio import Connection
from i3ipc import Event
from subprocess import call

import asyncio


def resizeBar(i3, e):
    bar_change = "hide" if e.container.fullscreen_mode == 1 else "show"
    call(f"polybar-msg cmd {bar_change}".split(" "))


def updateTitleBar(i3, e):
    call("polybar-msg hook titlehook 2".split(" "))


async def main():
    i3 = await Connection(auto_reconnect=True).connect()

    # this runs the future to obtain current workspaces
    _ = await i3.get_workspaces()

    # this returning NoneType cannot be used in await
    i3.on(Event.WINDOW_FULLSCREEN_MODE, resizeBar)
    i3.on(Event.WINDOW_FOCUS, updateTitleBar)
    i3.on(Event.WINDOW_TITLE, updateTitleBar)

    await i3.main()


asyncio.get_event_loop().run_until_complete(main())
