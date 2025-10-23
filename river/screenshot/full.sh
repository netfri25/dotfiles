#!/bin/bash
still -c "slurp -o | grim -g - - | $(dirname "$0")/save.sh"
