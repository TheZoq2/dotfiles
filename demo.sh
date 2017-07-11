#!/bin/bash

OD=$(pwd)

WD=/home/frans/Documents/rust/BspwmStackableWindows
cd $WD
cargo clean
cd $OD

clear

#sleep 1

echo "Sometimes you have a program that you don't want to close"
sleep 2
echo "But you also don't want it to use too much space on your screen"
sleep 2
echo "Stacked windows are a nice way to get around that"
sleep 2

#Switch to another workspace to actually run the demo
bspc desktop -f "focused:^5"

xfce4-terminal --working-directory $WD &
ID1=$!
sleep 0.5
xfce4-terminal --working-directory $WD -x nvim src/main.rs&
ID2=$!

notify-send "To stack two windows, select both of them"
sleep 3
bspc node -f "@parent"
notify-send 'And execute `rspc stack create` using your hotkey daemon'
sleep 2
rspc stack create

sleep 3
notify-send 'You can navigate the stack using your normal focus commands'

sleep 1
bspc node -f "@brother"
rspc stack focus_current
sleep 1
bspc node -f "@brother"
rspc stack focus_current
sleep 1
bspc node -f "@brother"
rspc stack focus_current

notify-send 'When stacks are removed, the nodes get balanced'
sleep 2
rspc stack remove


sleep 4
#Demo vertical stacks
bspc node -f "east"
bspc node -p south
notify-send 'Stacks dont have to be horizontal'
sleep 1
xfce4-terminal --working-directory $WD -x htop &
sleep 0.3
bspc node -f "@brother"
bspc node -f "@1"
bspc node -p north
bspc node 
xfce4-terminal --working-directory $WD -x cargo build &
sleep 0.3
bspc node -f "@brother"
bspc node -f "@1"
bspc node -f "@parent"
bspc node -f "@parent"
notify-send 'They also dont have to affect all windows on the workspace'
sleep 2
rspc stack create

#Navigate around the stacks a bit
sleep 2
bspc node -f "south"
rspc stack focus_current
sleep 1
bspc node -f "south"
rspc stack focus_current

sleep 1
bspc node -f "west"
rspc stack focus_current
sleep 1
bspc node -f "east"
rspc stack focus_current
sleep 1
bspc node -f "north"
rspc stack focus_current


sleep 2
notify-send 'You can also add new windows to the stack'
sleep 1
bspc node -p north
ksysguard &
last_pid=$!
sleep 1
bspc node -f "north"
rspc stack focus_current
sleep 1
bspc node -f "south"
rspc stack focus_current
sleep 1
bspc node -f "north"
rspc stack focus_current
sleep 2

notify-send 'Of course, individual windows can also be removed'
sleep 1
kill $last_pid
rspc stack focus_current
sleep 2

bspc node -f "south"
rspc stack focus_current
sleep 1
bspc node -f "north"
rspc stack focus_current
sleep 1


clear
# Go back to the default workspace
bspc desktop -f "focused:^4"


#xfce4-terminal --working-directory $WD
