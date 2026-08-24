#!/bin/bash

#tabbed -n Alacritty alacritty --embed
bash -c 'WIN_ID="alac_$(head -c 4 /dev/urandom | xxd -p 2>/dev/null || echo $$)"; export ALAC_WIN_ID=$WIN_ID; mkdir -p "/dev/shm/$WIN_ID"; tabbed -c -f -p -1 alacritty --embed 2>/dev/null | head -n 1 >"/dev/shm/$WIN_ID/tab_xid"; rm -rf "/dev/shm/$WIN_ID"'
