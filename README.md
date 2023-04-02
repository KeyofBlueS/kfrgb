# kfrgb

# Version:    0.0.1
# Author:     KeyofBlueS
# Repository: https://github.com/KeyofBlueS/kfrgb
# License:    GNU General Public License v3.0, https://opensource.org/licenses/GPL-3.0

### DISCLAIMER
Detection of a Kingston Fury Beast DDR5 RAM on a i2c-bus is not implemented, so you must be really sure about the values you enter for `--ram` and `--bus`.
To find out how to retrieve these values, please refer to [this](https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/2879)
Even if you enter the correct values, the procedure is still risky!
This program can confuse your I2C bus, cause data loss or brick your hardware! **Proceed AT YOUR OWN RISK!**

### DESCRIPTION
While waiting for support to be added to OpenRGB, this script is intended to be used to control **RGB Leds of a Kingston Fury Beast DDR5 RAM ONLY**.
It is limited to set a static color or turn off leds.
By using yad, a graphical dialog to choose a color is shown if no\wrong values for them are entered.

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
The option `--ram <hex_ram_value>` is mandatory. You can enter a single hex value or a comma separated set of hex values.
If you enter e.g. --ram 61,63 on --bus 0, but you really only have ram 61, ram 63 will be skipped.

If the option `--bus` is omited or a wrong/non existent value has been entered, a prompt to select an i2c-bus will be shown.

Options `--red`, `--green` and `--blue` accept a value from **0** to **255**. If a color is 0 you can omit said color.
If no colors/wrong values has been entered, a graphical dialog to choose a color will be shown.

Option `--brightness` accept a value from **0** to **100**.
If no/wrong value has been entered, the brightness will default to 100.

Option `--wait` will set the sleep time between i2cset commands. Accept integer or decimal value.
If no\wrong value has been entered, the wait time will default to 0.015.
Anyway this script will retry (for at most 20 times and then will abort) if an i2cset command fail, so you can keep wait time very low and don't worry about write errors.

Option `--off` will turn off leds on the ram. This option has full priority over other options.

examples:

show prompt to select an i2c-bus and choosing a color from a graphical dialog for ram 61

`# kfrgb --ram 61`

show a graphical dialog to choose a color for ram 61 on i2c-bus 0

`# kfrgb --ram 61 --bus 0`

show a graphical dialog to choose a color with brightness at 70 for ram 61 on i2c-bus 0 without the warning before apply the settings

`# kfrgb --ram 61 --bus 0 --brightness 70 --nowarn`

set a yellow color to ram 0x61 on i2c-bus 0 (in this case the option --blue 0 can be omited)

`# kfrgb --ram 61 --bus 0 --red 255 --green 255`

set a purple color to ram 0x61 and 0x63 on i2c-bus 0 without the warning before apply the settings

`# kfrgb --ram 61,63 --bus 0 --red 200 --green 0 --blue 255 --nowarn`

set a white color with brightness at 50 to ram 0x61 and 0x63 on i2c-bus 0 without the warning before apply the settings

`# kfrgb --ram 61,63 --bus 0 --red 200 --green 0 --blue 255 --brightness 50 --nowarn`

Turn off leds to ram 0x63 on i2c-bus 0 without the warning before apply the settings

`# kfrgb --ram 63 --bus 0 --off --nowarn`


```
Options:
-s, --bus <i2c_bus_number>            Enter the i2c-bus number.
-m, --ram <hex_ram_value>             Enter the comma separated hex ram values. Mandatory.
-r, --red <color_value>               Enter a value between 0 and 255 for the red color.
-g, --green <color_value>             Enter a value between 0 and 255 for the green color.
-b, --blue <color_value>              Enter a value between 0 and 255 for the blue color.
-l, --brightness <brightness_value>   Enter a value between 0 and 100.
-w, --wait <wait_value>               Enter a sleep time between i2cset commands. Default is 0.015.
-o, --off                             Turn off all leds.
-n, --nowarn                          Apply settings without warning.
-h, --help                            Show this help.
```
