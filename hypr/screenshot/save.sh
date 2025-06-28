#!/bin/bash
tee $HOME/Pictures/Screenshots/$(date +"Screenshot-from-%Y-%m-%d-%H-%M-%S").png | wl-copy -t image/png
