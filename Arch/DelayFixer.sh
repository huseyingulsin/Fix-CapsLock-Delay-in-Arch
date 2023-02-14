#! /bin/sh

xkbcomp -xkb $DISPLAY xkbmap

if [ -e xkbmap ]; then
   #!/bin/bash

sed -i 's/key[[:space:]]\+<CAPS>[[:space:]]\+{[[:space:]]*\[[[:space:]]*Caps_Lock[[:space:]]*\][[:space:]]*};/key <CAPS> {\n    repeat=no,\n    type[group1]="ALPHABETIC",\n    symbols[group1]=[ Caps_Lock, Caps_Lock],\n    actions[group1]=[ LockMods(modifiers=Lock), Private(type=3,data[0]=1,data[1]=3,data[2]=3)]\n};/' xkbmap

   xkbcomp -w 0 xkbmap $DISPLAY
fi

