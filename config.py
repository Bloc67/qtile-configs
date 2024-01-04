# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from libqtile import bar, hook, layout, qtile, widget
from libqtile.config import Drag, Click, Drag, Group, Rule, Key, Match, Screen, DropDown, ScratchPad 
from libqtile.lazy import lazy
from typing import List
from libqtile.utils import guess_terminal
import os
import subprocess


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])


mod = "mod4"
terminal = "terminator"
rofi = "rofi -show drun"
mpv_command = "/home/bloc67/.config/qtile/mpv.sh"
quodlibet1 = "quodlibet --play-pause"
quodlibet2 = "quodlibet --next"
quodlibet3 = "quodlibet --rew"

quodlibet4 = "quodlibet --seek=+70"
quodlibet5 = "quodlibet --rating=1.0"
quodlibet6 = "quodlibet --rating=0.2"
quodlibet7 = "quodlibet --volume=100"
quodlibet8 = "quodlibet --volume=75"


bashtop = "tilix -e bashtop"
jrnl = "tilix -e /home/bloc67/.config/qtile/jrnl.sh"
jrnl_jobb = "tilix -e /home/bloc67/.config/qtile/jrnl_jobb.sh"
setcmd = "tilix -e bash /home/bloc67/scripts/setfolders.sh"
space = "screen -t bash /home/bloc67/scripts/space.sh"

wttrfull = "tilix -e curl wttr.in/Molde"

mountservers = "tilix -e bash /home/bloc67/.config/qtile/setmounts.sh" 
runscripts = "/home/bloc67/.config/qtile/scripts.sh"

stereo_command = "/home/bloc67/.config/qtile/do_stereo.sh"
hdmi_command = "/home/bloc67/.config/qtile/do_hdmi.sh"
bt_command = "blueman-manager"
molde = "sunwait list 1 62.737709N 7.160910E"

mount_virtbox = "terminator -e /home/bloc67/scripts/mount_virtbox.sh"
mount_linode = "terminator -e /home/bloc67/scripts/mount_linode.sh"

alljobs = "tilix -e scripts/crontab_23072023_run.sh"

rofi2 = '/home/bloc67/.config/awesome/rofi-master/1080p/launchers/text/launcher.sh'
rofi3 = 'env /usr/bin/rofi -show drun -theme /home/bloc67/.config/awesome/nord.rasi'
rofi4 = 'env /usr/bin/rofi -normal-window -width 400 -show drun -theme /home/bloc67/.config/awesome/configuration/rofi.rasi -run-command "/bin/bash -c -i \'shopt -s expand_aliases; {cmd}\'"'
rofi5 = '/home/bloc67/.config/awesome/rofi-master/1080p/launchers/slate/launcher.sh'
vol_mute = 'pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo 0'
vol_full = 'pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo 65536'
vol_half = 'pactl set-sink-volume alsa_output.pci-0000_00_1b.0.analog-stereo 48000'


vbox = 'VirtualBox -style Fusion %U' 
streamwr = "wine winappz/streamwriter.exe"
claws = 'claws-mail --receive-all'
easyeff1 = "easyeffects -l bass"
easyeff2 = "easyeffects -l bass-reverb"


@hook.subscribe.startup_once
def autostart_once():
    subprocess.run('/home/USER/.config/qtile/autostart_once.sh')

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "Right", lazy.screen.next_group(skip_empty=False), desc="Switch to next group"),
    Key([mod], "Left", lazy.screen.prev_group(skip_empty=False), desc="Switch to next group"),


    Key(["control"], "left", lazy.layout.left(), desc="Move focus to left"),
    Key(["control"], "right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key(["control"], "space", lazy.layout.next(), desc="Move window focus to other window"),

    #Key([mod], "space", lazy.group["scratchpad"].dropdown_toggle("term")),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),


    Key([mod], "r", lazy.spawn(rofi), desc="Launch ROFI"),
    #Key([mod], "c", lazy.spawn("nemo"), desc="Launch Nemo"),
    
    #Key([], "F11", lazy.spawn(quodlibet1), desc="QuodLibet play"),
    Key([], "XF86AudioMute", lazy.spawn(vol_mute), desc="Mute"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(vol_full), desc="Volume full"),
    Key([], "XF86AudioLowerVolume", lazy.spawn(vol_half), desc="Volume half"),

    #Key([], "F12", lazy.spawn(quodlibet2), desc="QuodLibet next"),


    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.spawn(terminal), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

#groups = [Group(i) for i in "123456789"]

#for i in groups:
#    keys.extend(
#        [
#            # mod1 + letter of group = switch to group
#            Key(
#                [mod],
#                i.name,
#                lazy.group[i.name].toscreen(),
#                desc="Switch to group {}".format(i.name),
#            ),
#            # mod1 + shift + letter of group = switch to & move focused window to group
#            Key(
#                [mod, "shift"],
#                i.name,
#                lazy.window.togroup(i.name, switch_group=True),
#                desc="Switch to & move focused window to group {}".format(i.name),
#            ),
#            # Or, use below if you prefer not to switch to that group.
#            # # mod1 + shift + letter of group = move focused window to group
#            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
#            #     desc="move focused window to group {}".format(i.name)),
#        ]
#    )

# throwaway groups for random stuff
groups = []

# groups with special jobs. I usually navigate to these via my app_or_group
# function.
for i in ['1', '2', '3', '4', '5', '6', '7', '8', '9']:
    groups.append(Group(i, layout='columns'))
    keys.append(
        Key([mod], i, lazy.group[i].toscreen())
    )
    keys.append(
        Key([mod, "mod1"], i, lazy.window.togroup(i))
    )



layouts = [
    layout.Columns(border_focus_stack=["#000000", "#003533"], border_width=1),
    layout.Tile(ratio=0.75, border_focus="#003553", border_normal="#000000", border_width=1),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    #layout.Stack(num_stacks=2),
    #layout.Bsp(),
    layout.Matrix(),
    #layout.MonadTall(),
    #layout.MonadWide(ratio=0.7, border_focus="#003553", border_normal="#000000", border_width=1),
    #layout.RatioTile(),
    #layout.TreeTab(),
    layout.VerticalTile(),
    #layout.Zoomy(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        wallpaper='~/.config/awesome/theme/wallpapers/Dark.jpg',
        wallpaper_mode='fill',    
        bottom=bar.Bar(
            [
                widget.Spacer(length=10),
                widget.CurrentLayout(),
                widget.TextBox(" | ", foreground="#888888"),
                widget.TextBox("[RESTART]", foreground="#f75f5f", mouse_callbacks={'Button1': lazy.spawn('reboot')},),
                widget.Spacer(),
                widget.CPU(format="cpu {load_percent}%", mouse_callbacks={'Button1': lazy.spawn(bashtop)},),                
                widget.TextBox(" | ", foreground="#888888"),
                widget.Memory(measure_mem='G', mouse_callbacks={'Button1': lazy.spawn(bashtop)}),                
                widget.TextBox(" | ", foreground="#888888"),
                widget.Net(foreground="#88ffaa"),
                widget.Systray(padding=2, size=32),
            ],
            32,
            background='#182030',
            border_width=[0, 0, 0, 0],  
        ),
        top=bar.Bar(
            [
                widget.Spacer(length=10),
                widget.GroupBox(),
                widget.Prompt(),
                widget.TextBox(" | ", foreground="#888888"),
                widget.TextBox("<b>X</b>", foreground="#d78f5f", mouse_callbacks={'Button1': lazy.window.kill()},),
                #widget.WindowTabs(),
                widget.TaskList(
                    icon_size=16,
                    unfocused_border="#00000010", 
                    padding_y=5,
                    padding_x=10,
                    highlight_method="border",
                    max_title_width=200,
                    mouse_callbacks={'Button3': lazy.window.kill()}
                ),
                widget.Clock(format="<span color='#888888'>%d-%m-%Y %a</span> <b>%H:%M</b>"),
                widget.Spacer(length=10),
            ],
            32,
            background='#182030',
            border_width=[0, 0, 0, 0],  # Draw top and bottom borders
        ),
    ),
]

# Drag floating layouts.
mouse = [
#    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
#    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = False

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

@hook.subscribe.startup_once
def autostart_once():
    subprocess.run('/home/bloc67/.config/qtile/autostart.sh')

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
