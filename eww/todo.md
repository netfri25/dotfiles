## IMPORTANT
I need to create some kind of a multi-tool for better performance.
currently, using `defpoll` runs a shell command on some given interval.
I want that tool to replace all `defpoll` with `deflisten`, which is more efficient and only executes a subprocess once.
most of the `defpoll` that are used are just for reading some file or parsing some value out of a file / command.

# right
### battery
 - [x] percentage
 - [x] progress circle
 - [x] coloring based on state
 - [x] hover window with wattage & time left for charge/discharge

### output volume
 - [ ] prevent high cpu usage when changing volume
 - [x] percentage
 - [x] progress circle
 - [x] icons
 - [x] coloring based on state
 - [x] click to mute
 - [x] scroll to change

### input volume
 - [x] percentage
 - [x] progress circle
 - [x] icons
 - [x] coloring based on state
 - [x] click to mute
 - [x] scroll to change

### wifi signal
 - [ ] icons based on state
 - [ ] hover window with SSID & IP

### temperature
 - [x] value in degress
 - [x] slider from 0C to 100C
 - [x] coloring based on temperature for both slider and value

### disk usage
 - [x] percentage of disk used
 - [x] hover window with  <used in GiB> out of <total in GiB> (<free in GiB>)

### ram usage
 - [x] used ram in GiB
 - [x] hover window with additional information for both ram and swap (used out of total)

### cpu usage
 - [x] total cpu usage in percentage
 - [x] progress bars (similar to the temperature)
 - [x] coloring based on total usage
 - [x] hover window with information about each core: GHz, usage in %, and coloring


# middle
### time
 - [x] hour:minute
 - [x] day of the week
 - [x] day/month


# left
### workspaces
 - [ ] all workspaces
 - [ ] mark current workspace
 - [ ] mark non-empty workspaces
 - [ ] maybe urgent workspaces

### media player
 - [ ] play/pause button
 - [ ] hover to open a media control window:
    - [ ] art image
    - [ ] song name - artist
    - [ ] playback controls
    - [ ] song time (since start), song length
    - [ ] progress slider

### window name
 - [ ] currently focused window name

