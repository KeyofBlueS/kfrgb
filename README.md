
# kfrgb

# Version:    0.4.0
# Author:     KeyofBlueS
# Repository: https://github.com/KeyofBlueS/kfrgb
# License:    GNU General Public License v3.0, https://opensource.org/licenses/GPL-3.0

### DISCLAIMER
**Detection of a Kingston Fury Beast DDR5 RAM on a i2c-bus is not implemented, so you must be really sure about the values you enter for --ram and --bus.
To find out how to retrieve these values, please refer to https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/2879.
Even if you enter the correct values, the procedure is still risky!
This program can confuse your I2C bus, cause data loss or brick your hardware! Proceed AT YOUR OWN RISK!**

### DESCRIPTION
While waiting for support to be added to OpenRGB, this script is intended to be used to control RGB Leds of a **Kingston Fury Beast DDR5 RAM ONLY** with the help of i2c-tools.

### FEATURES
Set any mode between rainbow, prism, spectrum, slide, wind, static, static_byledcolor, lightspeed, rain, firework, twilight, teleport, flame, voltage, countdown and rhythm.
By using yad, a graphical dialog to choose a color is shown if no\wrong values for them are entered.

Not all modes are fully supported:
- Setting speed on mode twilight is not supported (we lack the parameters to set speed), this mode will likely run at full speed.
- Modes breath, breath_byledcolor and dynamic are not supported because if set, then you can't set any other mode, you need to turn off the pc (do a cold boot) to 'unlock' (we lack the parameters to set speed, is this the problem maybe?).

As i have one ram stick only, with modes that require two or more ram sticks i'm unable to see what parameters they have within the official app. Nevertheless i've found out we can set these parameters:
- Modes teleport, voltage, countdown, rhythm: tencolors; backcolor.
- Modes teleport, flame, countdown, rhythm: direction.

- Mode slither is not supported at all.

### INSTALL
```
curl -o /tmp/kfrgb.sh 'https://raw.githubusercontent.com/KeyofBlueS/kfrgb/master/kfrgb.sh'
sudo mkdir -p /opt/kfrgb/
sudo mv /tmp/kfrgb.sh /opt/kfrgb/
sudo chown root:root /opt/kfrgb/kfrgb.sh
sudo chmod 755 /opt/kfrgb/kfrgb.sh
sudo chmod +x /opt/kfrgb/kfrgb.sh
sudo ln -s /opt/kfrgb/kfrgb.sh /usr/local/bin/kfrgb
```

### USAGE
The option `--ram <hex_ram_value>` is mandatory. You can enter a single hex value to control a single ram stick or a comma separated set of hex values to control two or more ram sticks.
If you enter e.g. --ram 61,63 on --bus 0, but you really only have ram 61, ram 63 will be skipped.

If the option `--bus <i2c_bus_number>` is omitted or a wrong/non existent value has been entered, a prompt to select an i2c-bus will be shown.

Use the option `--mode <mode_name>` to set a mode.
Available modes are 'rainbow' 'prism' 'spectrum' 'slide' 'wind' 'static' 'static_byledcolor' 'lightspeed' 'rain' 'firework' 'twilight' 'teleport' 'flame' 'voltage' 'countdown' 'rhythm'.
Pass 'list' as <mode_name> to get a menu where you can choose a mode to set.

Speed (min 1, max 11) and brightness (min 0, max 100, default 80) are common for every mode. However every mode has it's own available and default parameters also:
```
- rainbow: speed (default 7); direction (default up).
- prism: speed (default 4); delay (min 1, max 5, default 1).
- spectrum: speed (default 4); delay (min 1, max 3, default 3); direction (default up).
- slide: speed (default 10); delay (min 1, max 4, default 3); lenght (min 1, max 12, default 4); tencolors; backcolor; direction (default down).
- wind: speed (default 10); delay (min 1, max 21, default 1); lenght (min 1, max 32, default 12); tencolors; backcolor; direction (default up).
- static: color.
- static_byledcolor: byledcolors.
- lightspeed: speed (default 9); delay (min 1, max 21, default 1); lenght (min 1, max 18, default 7); tencolors; direction (default up).
- rain: speed (default 11); tencolors; direction (default down).
- firework: speed (default 11); tencolors; direction (default up).
- twilight: speed (currently not supported, this mode will run at max speed).
- teleport: tencolors; backcolor; direction (default up); other parameters unknown, this mode will run with its default parameters (?).
- flame: direction (default up); other parameters unknown, this mode will run with its default parameters (?).
- voltage: tencolors; backcolor; other parameters unknown, this mode will run with its default parameters (?).
- countdown: tencolors; backcolor; direction (default up); other parameters unknown, this mode will run with its default parameters (?).
- rhythm: tencolors; backcolor; direction (default down); other parameters unknown, this mode will run with its default parameters (?).
```


To set mode parameters you must use options --speed, --delay, --length, --color, --byledcolors, --tencolors, --tencolorsnumber, --backcolor, --brightness, --direction.
Take care if a given parameter is supported by a given mode, and be careful to stay between min and max values.
Nevertheless don't be worried, if no/wrong parameter has been entered, the parameter will simply be set to the default value or not set at all if not supported by the selected mode.

Option `--speed` accept 1 value from 1 to 11.
Use this option to set the speed of the effect in the supported mode (rainbow, prism, spectrum, slide, wind, lightspeed, rain, firework).

Option `--delay` accept 1 value from 1 to <max_value>. max_value depends on mode.
Use this option to set the delay of the effect in the supported mode (prism, spectrum, slide, wind, lightspeed).

Option `--length` accept 1 value from 1 to <max_value>. max_value depends on mode.
Use this option to set the length of the effect in the supported mode (slide, wind, lightspeed).

One color is expressed with 3 comma separated values for RGB. So 255,255,255 means white; 255,0,0 means red; 0,255,0 means green; 0,0,255 means blue.

Option `--color <r_value,g_value,b_value>` accept 3 comma separated values from 0 to 255.
Use this option to set a color in mode static.

Option `--byledcolors <byledcolors_values>` accept 36 comma separated values from 0 to 255. Every three values equals a color (36 values are 12 colors, this ram has 12 leds indeed).
Use this option to set every single led color in the supported mode (static_byledcolor).

Option `--tencolors <tencolors_values>` accept 30 comma separated values from 0 to 255. Every three values equals a color (30 values are 10 colors).
Use this option to cycle through these colors in the supported mode (slide, wind, lightspeed, rain, firework, teleport, voltage, countdown, rhythm).

Option `--tencolorsnumber <tencolorsnumber_value>` accept 1 value from 1 to 10.
Use this option to set how many colors will cycle the supported mode (slide, wind, lightspeed, rain, firework, teleport, voltage, countdown, rhythm).
e.g. '--tencolorsnumber 3' to cycle the first 3 colors out of 10.

Option `--backcolor <r_value,g_value,b_value>` accept 3 comma separated values from 0 to 255.
Use this option to set the background color in the supported mode (slide, wind, teleport, voltage, countdown, rhythm).

Option `--randomcolor` will set a random color in the supported mode (slide, wind, static, static_byledcolor, lightspeed, rain, firework, teleport, voltage, countdown, rhythm).
This option will take full priority over any color option.

Option `--brightness <brightness_value>` accept 1 value from 0 to 100.
Use this option to set the brightness in any mode.

Option `--direction <direction_value>` accept values up or down.
Use this option to set the direction of the effect in the supported mode (rainbow, spectrum, slide, wind, lightspeed, rain, firework, teleport, flame, countdown, rhythm).

Option `--ask`, if no/wrong parameter has been entered, will ask for user input instead of automatically set default values.
For color values a graphical dialog to choose a color will be shown.

Option `--wait <wait_value>` will set the sleep time between i2cset commands. Accept 1 integer or decimal value.
If no\wrong value has been entered, the wait time will default to 0.015.
Anyway this script will retry (for at most 20 times and then will abort) if an i2cset command fails, so you can keep wait time very low and don't worry about write errors.

Option `--off` will turn off leds on the ram. This option will take full priority over any other option.

### EXAMPLES

show a menu where you can select an i2c-bus, then choose a mode to set for ram 61:

`# kfrgb --ram 61`

show a menu where you can choose a mode to set for ram 61 on i2c-bus 0:

`# kfrgb --ram 61 --bus 0`

show a graphical dialog to choose a color with brightness at 70 for ram 61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --brightness 70 --mode static --ask --nowarn`

set a yellow color to ram 0x61 and 0x63 on i2c-bus 0 (in this case the options --mode static):

`# kfrgb --ram 61,63 --bus 0 --color 255,255,0`

set a every single led color to ram 0x61 and 0x63 on i2c-bus 0:

`# kfrgb --ram 61,63 --bus 0 --mode static_byledcolor --byledcolors 255,0,0,0,255,0,0,0,255,255,0,0,0,255,0,0,0,255,255,0,0,0,255,0,0,0,255,255,0,0,0,255,0,0,0,255`

set a every single led to a random color to ram 0x61 and 0x63 on i2c-bus 0:

`# kfrgb --ram 61,63 --bus 0 --mode static_byledcolor --randomcolor`

set mode wind with default parameters to ram 0x61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --mode wind --nowarn`

set mode wind with brightness at 100 and direction down to ram 0x61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --mode wind --brightness 100 --direction down --nowarn`

set mode wind with backcolor to violet, brightness at 100 and direction down to ram 0x61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --mode wind --backcolor 150,70,200 --brightness 100 --direction down --nowarn`

set mode slide with speed at 8 and direction up to ram 0x61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --mode slide --speed 8 --direction up --nowarn`

set mode rainbow with speed at 1 to ram 0x61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --mode rainbow --speed 1 --nowarn`

set mode slide and 10 colors to cycle through to ram 0x61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --mode slide --tencolors 255,0,0,0,255,0,255,100,0,0,0,255,238,238,0,128,0,128,0,109,119,255,200,0,255,85,255,60,125,255 --nowarn`

set mode slide and 3 colors (you can omit the remaining 7 colors) to cycle through to ram 0x61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --mode slide --tencolors 255,0,0,0,255,0,255,100,0 --tencolorsnumber 3 --nowarn`

set mode wind and, asking for user input, 10 colors to cycle through to ram 0x61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --mode wind --ask --nowarn`

set mode wind and, asking for user input, 3 colors to cycle through to ram 0x61 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 61 --bus 0 --mode wind --tencolorsnumber 3 --ask --nowarn`

turn off leds to ram 0x63 on i2c-bus 0 without the warning before apply the settings:

`# kfrgb --ram 63 --bus 0 --off --nowarn`

### NOTE ABOUT COMMA SEPARATED VALUES
As explained above, RGB values can be set in a comma separated format e.g.:

`--tencolors 255,0,0,0,255,0,255,100,0,0,0,255,238,238,0,128,0,128,0,109,119,255,200,0,255,85,255,60,125,255`

but also comma/space separated and must be enclosed in single quotes e.g.:

`--tencolors '255 0 0,0 255 0,255 100 0,0 0 255,238 238 0,128 0 128,0 109 119,255 200 0,255 85 255,60 125 255'`

I prefer the latter because i can visually separate every RGB triplet.


```
Options:
-s, --bus <i2c_bus_number>     Enter the i2c-bus number.
-m, --ram <hex_ram_value>      Enter the comma separated hex ram values. Mandatory.
-d, --mode <mode>              Enter the name of the mode. Pass 'list' as <mode_name> to get a menu
                                                           where you can choose a mode to set.
-p, --speed <value>            Enter  1 value between 1 and 11. Default depends on mode.
-e, --delay <value>            Enter  1 value. Min 1, max depends on mode.
-q, --length <value>           Enter  1 value. Min 1, max depends on mode.
-i, --direction <value>        Enter  1 value between 'up' or 'down'. Default depends on mode.
-c, --color <values>           Enter  3 comma separated values between 0 and 255.
-b, --byledcolors <values>     Enter 36 comma separated values between 0 and 255.
-t, --tencolors <values>       Enter 30 comma separated values between 0 and 255.
-u, --tencolorsnumber <value>  Enter  1 value between 1 and 10. Default is 10.
-k, --backcolor <value>        Enter  3 comma separated values between 0 and 255.
-z, --randomcolor              Set a random color.
-l, --brightness <value>       Enter  1 value between 0 and 100. Default is 80.
-o, --off                      Turn off all leds.
-w, --wait <value>             Enter a sleep time between i2cset commands. Default is 0.015.
-n, --nowarn                   Apply settings without warning.
-h, --help                     Show this help.
```
