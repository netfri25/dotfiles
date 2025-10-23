#!/bin/bash
still -c "slurp | grim -g - - | $(dirname "$0")/save.sh"
