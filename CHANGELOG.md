## v12.0.1.7
### Improvements
- Randomized fun load messages on each login
- Improved log formatting with colored prefix

## v12.0.1.6
### New Features
- Delay timer now supports 0.1s increments (e.g. 0.5s, 1.3s) instead of whole seconds only
- Added /sd debug command to toggle debug logging
- Added /sd reset command to force restore release buttons if stuck

### Improvements
- Delves now correctly use their own "Enable in Delves" setting instead of silently using the dungeon setting
- Safety timer now only starts after the death popup is confirmed and buttons are hidden

### Bugfixes
- Fixed addon interfering with spirit release when player is already a ghost
- Fixed font flags being stripped by repeated SetFont calls every frame

## v12.0.1.5
### Bugfixes
- Attempted to better clean up the popup when it changes to the default blizzard one to avoid weird behavior

## v12.0.1.4
### Improvements
- Increase font size of the "DO NOT RELEASE" text to make it stand out a bit more

## v12.0.1.3
### Bugfixes
- Correctly handle the case where a ressurection of any kind interrupts the current release spirit state