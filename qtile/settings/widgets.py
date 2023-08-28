from typing import List
from libqtile import widget
from .theme import colors

# Get the icons at https://www.nerdfonts.com/cheat-sheet (you need a Nerd Font)


def base(fg="text", bg="dark"):
    return {"foreground": colors[fg], "background": colors[bg]}


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(fg="text", bg="dark", fontsize=16, text="?"):
    return widget.TextBox(**base(fg, bg), fontsize=fontsize, text=text, padding=3)


def powerline(fg="light", bg="dark"):
    return widget.TextBox(
        **base(fg, bg), text="", fontsize=50, padding=-3  # Icon: nf-cod-triangle_left
    )


def pacman_updates(bg="color5") -> List:
    return [
        powerline(bg, "dark"),
        icon(bg=bg, text="󰚰 "),  # Icon: nf-fa-download
        widget.CheckUpdates(
            background=colors[bg],
            colour_have_updates=colors["text"],
            colour_no_updates=colors["text"],
            no_update_string="0",
            display_format="{updates}",
            update_interval=1800,
            custom_command="checkupdates",  # needs package pacman-contrib
        ),
        widget.TextBox(text="Updates", padding=3, **base(bg=bg)),
    ]


def network(bg="color4", prev_bg="color5") -> List:
    return [
        powerline(bg, prev_bg),
        icon(bg=bg, text=" "),  # Icon: nf-fa-feed
        widget.Net(**base(bg=bg)),
    ]


def layout(bg="color3", prev_bg="color4") -> List:
    return [
        powerline(bg, prev_bg),
        widget.CurrentLayoutIcon(**base(bg=bg), scale=0.65),
        widget.CurrentLayout(**base(bg=bg), padding=5),
    ]


def clock(bg="color2", prev_bg="color3") -> List:
    return [
        powerline(bg, prev_bg),
        icon(bg=bg, fontsize=17, text=" "),  # Icon: nf-oct-calendar
        widget.Clock(**base(bg=bg), format="%d/%m/%Y - %H:%M "),
    ]


def systray(bg="color4", prev_bg="color2") -> List:
    return [
        powerline(bg, prev_bg),
        widget.Systray(padding=10, **base(bg=bg)),
        widget.KeyboardLayout(
            configured_keyboards=["latam", "us"], padding=10, **base(bg=bg)
        ),
    ]


def workspaces():
    return [
        separator(),
        widget.GroupBox(
            **base(fg="light"),
            font="UbuntuMono Nerd Font",
            fontsize=19,
            margin_y=3,
            margin_x=0,
            padding_y=8,
            padding_x=5,
            borderwidth=1,
            active=colors["active"],
            inactive=colors["inactive"],
            rounded=False,
            highlight_method="block",
            urgent_alert_method="block",
            urgent_border=colors["urgent"],
            this_current_screen_border=colors["focus"],
            this_screen_border=colors["grey"],
            other_current_screen_border=colors["dark"],
            other_screen_border=colors["dark"],
            disable_drag=True
        ),
        separator(),
        widget.WindowName(**base(fg="focus"), fontsize=14, padding=5),
        separator(),
    ]


primary_widgets = [
    *workspaces(),
    separator(),
    *pacman_updates(),
    *network(),
    *layout(),
    *clock(),
    # widget.Battery(**base(bg='color1'), update_interval=1),
    *systray(),
]

secondary_widgets = [
    *workspaces(),
    separator(),
    powerline("color1", "dark"),
    widget.CurrentLayoutIcon(**base(bg="color1"), scale=0.65),
    widget.CurrentLayout(**base(bg="color1"), padding=5),
    powerline("color2", "color1"),
    widget.Clock(**base(bg="color2"), format="%d/%m/%Y - %H:%M "),
    powerline("dark", "color2"),
]

widget_defaults = {
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}
extension_defaults = widget_defaults.copy()
