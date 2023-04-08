# kfrgb

# Version:    0.1.0
# Author:     KeyofBlueS
# Repository: https://github.com/KeyofBlueS/kfrgb
# License:    GNU General Public License v3.0, https://opensource.org/licenses/GPL-3.0

**### DISCLAIMER
Detection of a Kingston Fury Beast DDR5 RAM on a i2c-bus is not implemented, so you must be really sure about the values you enter for --ram and --bus.
To find out how to retrieve these values, please refer to https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/2879
Even if you enter the correct values, the procedure is still risky!
This program can confuse your I2C bus, cause data loss or brick your hardware! Proceed AT YOUR OWN RISK!**

### DESCRIPTION
While waiting for support to be added to OpenRGB, this script is intended to be used to control RGB Leds of a **Kingston Fury Beast DDR5 RAM ONLY** with the help of i2c-tools.

### FEATURES
Set any mode between rainbow, prism, spectrum, slide, wind, static, lightspeed, rain, firework, and twilight.
By using yad, a graphical dialog to choose a color is shown if no\wrong values for them are entered (static mode only).

### USAGE
The option `--ram <hex_ram_value>` is mandatory. You can enter a single hex value or a comma separated set of hex values.
If you enter e.g. `--ram 61,63`, but you really only have ram 61, ram 63 will be skipped.

If the option `--bus <i2c_bus_number>` is omitted or a wrong/non existent value has been entered, a prompt to select an i2c-bus will be shown.

Use the option `--mode <mode_name>` to set a mode. Available modes name are `rainbow` `prism` `spectrum` `slide` `wind` `static` `lightspeed` `rain` `firework` `twilight`.
Pass `list` as <mode_name> to get a menu where you can choose a mode to set.
**Speed (min 1, max 11)** and **brightness (min 0, max 100, default 80)** are common for every mode. However every mode has it's own available and default parameters also:
```
rainbow: speed (default 7); direction (default up).
prism: speed (default 4); delay (min 1, max 5, default 1).
spectrum: speed (default 4); delay (min 1, max 3, default 3); direction (default up).
slide: speed (default 10); delay (min 1, max 4, default 3); lenght (min 1, max 12, default 4); direction (default down).
wind: speed (default 10); delay (min 1, max 21, default 1); lenght (min 1, max 32, default 12); direction (default up).
static: red; green; blue.
lightspeed: speed (default 9); delay (min 1, max 21, default 1); lenght (min 1, max 18, default 7); direction (default up).
rain: speed (default 11); direction (default down).
firework: speed (default 11); direction (default up).
twilight: speed (currently not supported, this mode will run at max speed).
```
 
To set mode parameters you must use options `--speed`, `--delay`, `--length`, `--direction`.

Options `--red <red_value>`, `--green <green_value>` and `--blue <blue_value>` accept values from `0` to `255`. If a color is 0 you can omit said color.
If you enter a color option, the mode will be set to 'static' in automatic (you can omit the option '--mode static').
If no colors/wrong values has been entered, a graphical dialog to choose a color will be shown.

Option `--brightness <brightness_value>` accept values from `0` to `100`.
If no/wrong value has been entered, the brightness will default to `80`.

Take care if a given parameter is supported by a given mode, and be careful to stay between min and max values.
Nevertheless don't be worried, if no/wrong parameter has been entered, the parameter will simply be set to the default value.

Option `--wait <wait_value>` will set the sleep time between i2cset commands. Accept integer or decimal value.
If no\wrong value has been entered, the wait time will default to `0.015`.
Anyway this script will retry (for at most 20 times and then will abort) if an i2cset command fails, so you can keep wait time very low and don't worry about write errors.

Option `--off` will turn off leds on the ram. This option will take full priority over any other options.

examples:

show a menu where you can select an i2c-bus, then choose a mode to set for ram 61

`# ${kfrgb_name} --ram 61`

show a menu where you can choose a mode to set for ram 61 on i2c-bus 0

`# ${kfrgb_name} --ram 61 --bus 0`

show a graphical dialog to choose a color with brightness at 70 for ram 61 on i2c-bus 0 without the warning before apply the settings

`# ${kfrgb_name} --ram 61 --bus 0 --brightness 70 --mode static --nowarn`

set a yellow color to ram 0x61 and 0x63 on i2c-bus 0 (in this case the options --mode static and --blue 0 can be omitted)

`# ${kfrgb_name} --ram 61,63 --bus 0 --red 255 --green 255`

set mode wind with default parameters to ram 0x61 on i2c-bus 0 without the warning before apply the settings

`# ${kfrgb_name} --ram 61 --bus 0 --mode wind --nowarn`

set mode wind with brightness at 100 and direction down to ram 0x61 on i2c-bus 0 without the warning before apply the settings

`# ${kfrgb_name} --ram 61 --bus 0 --mode wind --brightness 100 --direction down --nowarn`

set mode slide with speed at 8 and direction up to ram 0x61 on i2c-bus 0 without the warning before apply the settings

`# ${kfrgb_name} --ram 61 --bus 0 --mode slide --speed 8 --direction up --nowarn`

set mode rainbow with speed at 1 to ram 0x61 on i2c-bus 0 without the warning before apply the settings

`# ${kfrgb_name} --ram 61 --bus 0 --mode rainbow --speed 1 --nowarn`

Turn off leds to ram 0x63 on i2c-bus 0 without the warning before apply the settings

`# ${kfrgb_name} --ram 63 --bus 0 --off --nowarn`


```
Options:
-s, --bus <i2c_bus_number>            Enter the i2c-bus number.
-m, --ram <hex_ram_value>             Enter the comma separated hex ram values. Mandatory.
-d, --mode <mode_name>                Enter the name of the mode. Pass 'list' as <mode_name> to get a menu
                                                                  where you can choose a mode to set.
-p, --speed <speed_value>             Enter a value between 1 and 11.
-e, --delay <delay_value>             Enter the delay of the mode. Min 1, max depends on mode.
-t, --length <length_value>           Enter the length of the mode. Min 1, max depends on mode.
-i, --direction <direction_value>     Enter the direction of the mode. Values are 'up' or 'down'
-r, --red <red_value>                 Enter a value between 0 and 255 for the red color. Static mode only.
-g, --green <green_value>             Enter a value between 0 and 255 for the green color. Static mode only.
-b, --blue <blue_value>               Enter a value between 0 and 255 for the blue color. Static mode only.
-l, --brightness <brightness_value>   Enter a value between 0 and 100. Default is 80.
-w, --wait <wait_value>               Enter a sleep time between i2cset commands. Default is 0.015.
-o, --off                             Turn off all leds.
-n, --nowarn                          Apply settings without warning.
-h, --help                            Show this help.
```
