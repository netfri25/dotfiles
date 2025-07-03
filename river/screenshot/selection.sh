#!/bin/bash
slurp | grim -g - - | $(dirname "$0")/save.sh
