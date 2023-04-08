#!/bin/bash

# kfrgb

# Version:    0.1.0
# Author:     KeyofBlueS
# Repository: https://github.com/KeyofBlueS/kfrgb
# License:    GNU General Public License v3.0, https://opensource.org/licenses/GPL-3.0

function initialize_modes() {

	#static
	mode_hex_static='00'
	#rainbow
	mode_hex_rainbow='01'
	speeds_hex_rainbow='00 06 0c 12 18 1e 24 2a 30 36 3c'
	speed_default_rainbow='7'
	direction_default_rainbow='up'
	#prism
	mode_hex_prism='11'
	speeds_hex_prism='00 06 0c 12 18 1e 24 2a 30 36 3c'
	speed_default_prism='4'
	delays_hex_prism='02 03 04 05 06'
	delay_default_prism='1'
	direction_default_prism='up' #
	#spectrum
	mode_hex_spectrum='01'
	speeds_hex_spectrum='00 06 0c 12 18 1e 24 2a 30 36 3c'
	speed_default_spectrum='4'
	delays_hex_spectrum='02 03 04'
	delay_default_spectrum='3'
	direction_default_spectrum='up'
	#slide
	mode_hex_slide='05'
	speeds_hex_slide='00 19 33 4c 66 7f 99 b2 cc e5 ff'
	speed_default_slide='10'
	delays_hex_slide='01 02 03 04'
	delay_default_slide='3'
	lengths_hex_slide='01 02 03 04 05 06 07 08 09 0a 0b 0c'
	length_default_slide='4'
	direction_default_slide='down'
	#wind
	mode_hex_wind='05'
	speeds_hex_wind='00 19 33 4c 66 7f 99 b2 cc e5 ff'
	speed_default_wind='10'
	delays_hex_wind='00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14'
	delay_default_wind='1'
	lengths_hex_wind='01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f 20'
	length_default_wind='12'
	direction_default_wind='up'
	#lightspeed
	mode_hex_lightspeed='06'
	speeds_hex_lightspeed='00 19 33 4c 66 7f 99 b2 cc e5 ff'
	speed_default_lightspeed='9'
	delays_hex_lightspeed='00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14'
	delay_default_lightspeed='1'
	lengths_hex_lightspeed='01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12'
	length_default_lightspeed='7'
	direction_default_lightspeed='up'
	#rain
	mode_hex_rain='06'
	speeds_hex_rain='13 15 17 19 1b 1d 1f 21 23 25 27'
	speed_default_rain='11'
	direction_default_rain='down' #
	#firework
	mode_hex_firework='06'
	speeds_hex_firework='30 35 3a 3f 44 49 4e 53 58 5d 62'
	speed_default_firework='11'
	direction_default_firework='up' #
	#breath
	mode_hex_breath='03'
	speeds_hex_breath=''
	speed_default_breath='6'
	direction_default_breath='up' #
	#dynamic
	mode_hex_dynamic='04'
	speeds_hex_dynamic=''
	speed_default_dynamic='9'
	direction_default_dynamic='up' #
	#twilight
	mode_hex_twilight='0a'
	speeds_hex_twilight=''
	speed_default_twilight='9'
	direction_default_twilight='up' #
	#teleport
	mode_hex_teleport='05'
	#flame
	mode_hex_flame='09'
	#voltage
	mode_hex_voltage='07'
	#countdown
	mode_hex_countdown='08'
	#rhythm
	mode_hex_rhythm='02'
	#slither
	mode_hex_slither=''
}

function check_hex_values() {

	hex_values="${1//,/$' '}"
	for hex_value in ${hex_values}; do
		if ! [[ "${hex_value}" =~ ^[0-9a-fA-F]{2}$ ]]; then
			echo -e "\e[1;31m- RAM: ${hex_value} is not a valid octet hex value!\e[0m"
			error_ramstick='true'
		fi
	done
}

function select_i2cbus() {

	i2cbuses_numbers="$(echo "${i2cbuses}" | grep "^i2c-" | awk '{print $1}' | awk -F'i2c-' '{print $2}')"
	echo -e "\e[1;32m- Please select an i2c bus number:\e[0m"
	echo "${i2cbuses}"
	while true; do
		read -p " choose> " i2cbus_number
		if [[ ! "${i2cbus_number}" =~ ^[[:digit:]]+$ ]]; then
			echo -e "\e[1;31mInvalid choice!\e[0m"
			sleep '1'
		else
			break
		fi
	done
}

function list_modes() {

	local i=0
	echo
	echo -e "\e[1;32m- Please select a mode:\e[0m"
	echo -e "\e[1;32m 0) exit\e[0m"
	for exp_mode in ${supported_modes}; do
		i=$((i + 1))
		if [ ${i} -le 9 ]; then
			sp1=" "
		else
			sp1=""
		fi
		echo "${sp1}${i}) ${exp_mode}"
	done
	while true; do
		read -rp " choose> " selected_mode
		if [[ ! "${selected_mode}" =~ ^[[:digit:]]+$ ]] || [[ "${selected_mode}" -gt "${i}" ]]; then
			echo -e "\e[1;31mInvalid choice!\e[0m"
			sleep '1'
		else
			break
		fi
	done
	if [[ "${selected_mode}" -eq '0' ]]; then
		echo -e "\e[1;33mexit\e[0m"
		exit 0
	else
		mode="$(echo "${supported_modes}" | awk "{print $"${selected_mode}"}")"
	fi
}

function check_color() {

	if [[ -z "${red}" ]] && [[ -z "${green}" ]] && [[ -z "${blue}" ]]; then
		yad_color
	else
		if [[ -z "${red}" ]]; then
			red='0'
		else
			if ! check_value "${red}" '255' '0'; then
				echo -e "\e[1;31m- Red color: ${red} is not a valid value!\e[0m"
				error_color='true'
			fi
		fi
		if [[ -z "${green}" ]]; then
			green='0'
		else
			if ! check_value "${green}" '255' '0'; then
				echo -e "\e[1;31m- Green color: ${green} is not a valid value!\e[0m"
				error_color='true'
			fi
		fi
		if [[ -z "${blue}" ]]; then
			blue='0'
		else
			if ! check_value "${blue}" '255' '0'; then
				echo -e "\e[1;31m- Blue color: ${blue} is not a valid value!\e[0m"
				error_color='true'
			fi
		fi
	fi

	if [[ "${error_color}" = 'true' ]]; then
		yad_color
	fi

	if [[ "${red}" -eq '0' ]] && [[ "${green}" -eq '0' ]] && [[ "${blue}" -eq '0' ]]; then
		brightness='0'
	else
		if [[ -z "${brightness}" ]] || ! check_value "${brightness}" '100' '0'; then
			brightness='80'
		fi
	fi
	red_hex="$(printf '%x\n' ${red})"
	green_hex="$(printf '%x\n' ${green})"
	blue_hex="$(printf '%x\n' ${blue})"
}

function check_modes() {

	if echo "${supported_speed}" | grep -q "${mode}"; then
		if [[ -z "${speed}" ]] || ! check_value "${speed}" "${speed_max}" '1'; then
			if [[ -z "${speed}" ]]; then
				true
			else
				echo
				echo -e "\e[1;31m- Speed: ${speed} is not a valid value for ${mode} mode!\e[0m"
				echo -e "\e[1;31m  supported values are from 1 to ${speed_max}\e[0m"
			fi
			speed="${speed_default}"
		fi
		speed_hex="$(echo "${speeds_hex}" | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | awk "{print $"${speed}"}")"
	fi
	if echo "${supported_delay}" | grep -q "${mode}"; then
		if [[ -z "${delay}" ]] || ! check_value "${delay}" "${delay_max}" '1'; then
			if [[ -z "${delay}" ]]; then
				true
			else
				echo
				echo -e "\e[1;31m- Delay: ${delay} is not a valid value for ${mode} mode!\e[0m"
				echo -e "\e[1;31m  supported values are from 1 to ${delay_max}\e[0m"
			fi
			delay="${delay_default}"
		fi
		delay_hex="$(echo "${delays_hex}" | awk "{print $"${delay}"}")"
	fi
	if echo "${supported_length}" | grep -q "${mode}"; then
		if [[ -z "${length}" ]] || ! check_value "${length}" "${length_max}" '1'; then
			if [[ -z "${length}" ]]; then
				true
			else
				echo
				echo -e "\e[1;31m- Length: ${length} is not a valid value for ${mode} mode!\e[0m"
				echo -e "\e[1;31m  supported values are from 1 to ${length_max}\e[0m"
			fi
			length="${length_default}"
		fi
		length_hex="$(echo "${lengths_hex}" | awk "{print $"${length}"}")"
	fi
	if [[ -z "${direction}" ]] || [[ "${direction}" != 'up' ]] && [[ "${direction}" != 'down' ]]; then
		if [[ -z "${direction}" ]]; then
			true
		else
			echo
			echo -e "\e[1;31m- Direction: ${direction} is not a valid value for ${mode} mode!\e[0m"
			echo -e "\e[1;31m  supported values are 'up' or 'down'\e[0m"
		fi
		direction="${direction_default}"
	fi
	if [[ "${direction}" = 'up' ]]; then
		direction_hex='01'
	elif [[ "${direction}" = 'down' ]]; then
		direction_hex='02'
	fi
}

function config_modes() {

	if [[ "${mode}" = 'static' ]]; then
		mode_hex="${mode_hex_static}"
		check_color
	else
		if [[ "${mode}" = 'rainbow' ]]; then
			mode_hex="${mode_hex_rainbow}"
			speeds_hex="${speeds_hex_rainbow}"
			speed_default="${speed_default_rainbow}"
			direction_default="${direction_default_rainbow}"
		elif [[ "${mode}" = 'prism' ]]; then
			mode_hex="${mode_hex_prism}"
			speeds_hex="${speeds_hex_prism}"
			speed_default="${speed_default_prism}"
			delays_hex="${delays_hex_prism}"
			delay_default="${delay_default_prism}"
			direction_default="${direction_default_prism}"
		elif [[ "${mode}" = 'spectrum' ]]; then
			mode_hex="${mode_hex_spectrum}"
			speeds_hex="${speeds_hex_spectrum}"
			speed_default="${speed_default_spectrum}"
			delays_hex="${delays_hex_spectrum}"
			delay_default="${delay_default_spectrum}"
			direction_default="${direction_default_spectrum}"
		elif [[ "${mode}" = 'slide' ]]; then
			mode_hex="${mode_hex_slide}"
			speeds_hex="${speeds_hex_slide}"
			speed_default="${speed_default_slide}"
			delays_hex="${delays_hex_slide}"
			delay_default="${delay_default_slide}"
			lengths_hex="${lengths_hex_slide}"
			length_default="${length_default_slide}"
			direction_default="${direction_default_slide}"
		elif [[ "${mode}" = 'wind' ]]; then
			mode_hex="${mode_hex_wind}"
			speeds_hex="${speeds_hex_wind}"
			speed_default="${speed_default_wind}"
			delays_hex="${delays_hex_wind}"
			delay_default="${delay_default_wind}"
			lengths_hex="${lengths_hex_wind}"
			length_default="${length_default_wind}"
			direction_default="${direction_default_wind}"
		elif [[ "${mode}" = 'lightspeed' ]]; then
			mode_hex="${mode_hex_lightspeed}"
			speeds_hex="${speeds_hex_lightspeed}"
			speed_default="${speed_default_lightspeed}"
			delays_hex="${delays_hex_lightspeed}"
			delay_default="${delay_default_lightspeed}"
			lengths_hex="${lengths_hex_lightspeed}"
			length_default="${length_default_lightspeed}"
			direction_default="${direction_default_lightspeed}"
		elif [[ "${mode}" = 'rain' ]]; then
			mode_hex="${mode_hex_rain}"
			speeds_hex="${speeds_hex_rain}"
			speed_default="${speed_default_rain}"
			direction_default="${direction_default_rain}"
		elif [[ "${mode}" = 'firework' ]]; then
			mode_hex="${mode_hex_firework}"
			speeds_hex="${speeds_hex_firework}"
			speed_default="${speed_default_firework}"
			direction_default="${direction_default_firework}"
		elif [[ "${mode}" = 'breath' ]]; then
			mode_hex="${mode_hex_breath}"
			speeds_hex="${speeds_hex_breath}"
			speed_default="${speed_default_breath}"
			direction_default="${direction_default_breath}"
		elif [[ "${mode}" = 'dynamic' ]]; then
			mode_hex="${mode_hex_dynamic}"
			speeds_hex="${speeds_hex_dynamic}"
			speed_default="${speed_default_dynamic}"
			direction_default="${direction_default_dynamic}"
		elif [[ "${mode}" = 'twilight' ]]; then
			mode_hex="${mode_hex_twilight}"
			speeds_hex="${speeds_hex_twilight}"
			speed_default="${speed_default_twilight}"
			direction_default="${direction_default_twilight}"
		elif [[ "${mode}" = 'teleport' ]]; then
			mode_hex="${mode_hex_teleport}"
		elif [[ "${mode}" = 'flame' ]]; then
			mode_hex="${mode_hex_flame}"
		elif [[ "${mode}" = 'voltage' ]]; then
			mode_hex="${mode_hex_voltage}"
		elif [[ "${mode}" = 'countdown' ]]; then
			mode_hex="${mode_hex_countdown}"
		elif [[ "${mode}" = 'rhythm' ]]; then
			mode_hex="${mode_hex_rhythm}"
		elif [[ "${mode}" = 'slither' ]]; then
			mode_hex="${mode_hex_slither}"
		fi
		if echo "${supported_speed}" | grep -q "${mode}"; then
			speed_max="$(echo "${speeds_hex}" | wc -w)"
		fi
		if echo "${supported_delay}" | grep -q "${mode}"; then
			delay_max="$(echo "${delays_hex}" | wc -w)"
		fi
		if echo "${supported_length}" | grep -q "${mode}"; then
			length_max="$(echo "${lengths_hex}" | wc -w)"
		fi
		check_modes
	fi

	if [[ -z "${brightness}" ]] || ! check_value "${brightness}" '100' '0'; then
		brightness='80'
	fi
	brightness_hex="$(printf '%x\n' ${brightness})"
}

function check_value() {

	value="${1}"
	max_value="${2}"
	min_value="${3}"
	if [[ ! "${value}" =~ ^[[:digit:]]+$ ]] || [[ "${value}" -gt "${max_value}" ]] || [[ "${value}" -lt "${min_value}" ]]; then
		return 1
	fi
}

function set_mode() {

	echo
	echo -e "\e[0;32m- i2c bus: $(echo "${i2cbuses}" | grep "^i2c-${i2cbus_number}" | sed -e "s/[[:space:]]\+/ /g")\e[0m"
	echo -e "\e[0;32m- RAM hex values: ${ramsticks}\e[0m"
	echo
	echo -e "\e[0;32m- Mode: ${mode} (hex: ${mode_hex})\e[0m"

	echo -e "\e[1;37m  - Brightness: ${brightness} (hex: ${brightness_hex})\e[0m"
	if [[ "${mode}" = 'static' ]]; then
		echo -e "\e[1;31m  - Red color value: ${red} (hex: ${red_hex})\e[0m"
		echo -e "\e[1;32m  - Green color value: ${green} (hex: ${green_hex})\e[0m"
		echo -e "\e[1;34m  - Blue color value: ${blue} (hex: ${blue_hex})\e[0m"
	else
		if echo "${supported_speed}" | grep -q "${mode}"; then
			echo -e "\e[0;32m  - Speed: ${speed} (hex: ${speed_hex})\e[0m"
		fi
		if echo "${supported_delay}" | grep -q "${mode}"; then
			echo -e "\e[0;32m  - Delay: ${delay} (hex: ${delay_hex})\e[0m"
		fi
		if echo "${supported_length}" | grep -q "${mode}"; then
			echo -e "\e[0;32m  - Length: ${length} (hex: ${length_hex})\e[0m"
		fi
		echo -e "\e[0;32m  - Direction: ${direction} (hex: ${direction_hex})\e[0m"
	fi

	if [[ "${nowarn}" != 'true' ]]; then
		echo
		echo -e "\e[1;31m- ### DISCLAIMER\e[0m"
		echo -e "\e[1;31m- Detection of a Kingston Fury Beast DDR5 RAM on a i2c-bus is not implemented, so you must be really sure about the values you enter for --ram and --bus.\e[0m"
		echo -e "\e[1;31m- To find out how to retrieve these values, please refer to https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/2879\e[0m"
		echo -e "\e[1;31m- Even if you enter the correct values, the procedure is still risky!\e[0m"
		echo -e "\e[1;31m- This program can confuse your I2C bus, cause data loss or brick your hardware! Proceed AT YOUR OWN RISK!\e[0m"
		while true; do
			echo
			echo -e "\e[1;31m- do you want to proceed?\e[0m"
			echo -e "\e[1;32m0) No\e[0m"
			echo -e "\e[1;31m1) Yes\e[0m"
			read -p " choose> " set_mode_answer
			if [[ ! "${set_mode_answer}" =~ ^[[:digit:]]+$ ]] || [[ "${set_mode_answer}" -gt '1' ]] || [[ "${set_mode_answer}" -lt '0' ]]; then
				echo -e "\e[1;31mInvalid choice!\e[0m"
				sleep '1'
			elif [[ "${set_mode_answer}" -eq '0' ]]; then
				echo -e "\e[1;33mexit\e[0m"
				exit 0
			elif [[ "${set_mode_answer}" -eq '1' ]]; then
				break
			fi
		done
	fi

	i2cbus_detect="$(i2cdetect -y "${i2cbus_number}")"
	if [[ ! "${wait}" =~ ^[[:digit:]]+(.[[:digit:]]+)?$ ]]; then
		wait='0.015'
	fi
	echo
	for ramstick in ${ramsticks//,/$' '}; do
		if ! echo "${i2cbus_detect}" | grep "^${ramstick:0:1}" | grep -q "\ ${ramstick}\ "; then
			echo -e "\e[1;31m- RAM: ${ramstick} not found in i2c-${i2cbus_number}! skipping.\e[0m"
		else
			echo -e "\e[1;33m- Setting mode ${mode} for ramstick ${ramstick}\e[0m"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x08 0x53
			sleep "${wait}"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x09 "0x${mode_hex}"
			sleep "${wait}"
			if [[ "${mode}" = 'static' ]]; then
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x31 "0x${red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x32 "0x${green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x33 "0x${blue_hex}"
				sleep "${wait}"
			else
				if echo "${supported_speed}" | grep -q "${mode}"; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x0e "0x${speed_hex}"
					sleep "${wait}"
				fi
				if echo "${supported_delay}" | grep -q "${mode}"; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x0d "0x${delay_hex}"
					sleep "${wait}"
				fi
				if echo "${supported_length}" | grep -q "${mode}"; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x26 "0x${length_hex}"
					sleep "${wait}"
				fi
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x0c "0x${direction_hex}"
				sleep "${wait}"
			fi
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x20 "0x${brightness_hex}"
			sleep "${wait}"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x08 0x44
		fi
	done
}

function i2cset_retry() {

	command="${@}"
	retry_count='0'
	while true; do
		if i2cset ${command} &>/dev/null; then
			break
		fi
		retry_count="$(("${retry_count}" + 1))"
		if [[ "${retry_count}" = '20' ]]; then
			echo -e "\e[1;31m- Error: Write failed in command i2cset ${command}\e[0m"
			echo -e "\e[1;31m- Maximum retries reached, aborting!\e[0m"
			exit 1
		fi
		sleep "${wait}"
	done
}

function yad_color() {

	while true; do
		color="$(yad --color --button=OK --center)"
		if [[ -n "${color}" ]]; then
			red="$((16#${color:1:2}))"
			green="$((16#${color:3:2}))"
			blue="$((16#${color:5:2}))"
			unset error_color
			check_color
			if [[ "${error_color}" != 'true' ]]; then
				break
			fi
		else
			exit 0
		fi
	done
}

function givemehelp() {

	echo "
# kfrgb

# Version:    0.1.0
# Author:     KeyofBlueS
# Repository: https://github.com/KeyofBlueS/kfrgb
# License:    GNU General Public License v3.0, https://opensource.org/licenses/GPL-3.0

### DISCLAIMER
Detection of a Kingston Fury Beast DDR5 RAM on a i2c-bus is not implemented, so you must be really sure about the values you enter for --ram and --bus.
To find out how to retrieve these values, please refer to https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/2879
Even if you enter the correct values, the procedure is still risky!
This program can confuse your I2C bus, cause data loss or brick your hardware! Proceed AT YOUR OWN RISK!

### DESCRIPTION
While waiting for support to be added to OpenRGB, this script is intended to be used to control RGB Leds of a Kingston Fury Beast DDR5 RAM ONLY with the help of i2c-tools.

### FEATURES
Set any mode between rainbow, prism, spectrum, slide, wind, static, lightspeed, rain, firework, and twilight.
By using yad, a graphical dialog to choose a color is shown if no\wrong values for them are entered (static mode only).

Not all modes are supported.
Modes that require more than 1 ram stick are not supported (teleport, flame, voltage, countdown, rhythm, slither).
Modes breath and dynamic are not supported because if set, then you can't set any other mode, you need to turn off the pc (do a cold boot) to 'unlock' .
Setting speed on mode twilight is not supported, this mode will run at full speed.

### USAGE
The option --ram <hex_ram_value> is mandatory. You can enter a single hex value or a comma separated set of hex values.
If you enter e.g. --ram 61,63 on --bus 0, but you really only have ram 61, ram 63 will be skipped.

If the option --bus <i2c_bus_number> is omitted or a wrong/non existent value has been entered, a prompt to select an i2c-bus will be shown.

Use the option --mode <mode_name> to set a mode. Available modes name are 'rainbow' 'prism' 'spectrum' 'slide' 'wind' 'static' 'lightspeed' 'rain' 'firework' 'twilight'.
Pass 'list' as <mode_name> to get a menu where you can choose a mode to set.
Speed (min 1, max 11) and brightness (min 0, max 100, default 80) are common for every mode. However every mode has it's own available and default parameters also:
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
 
To set mode parameters you must use options --speed, --delay, --length, --direction.

Options --red <red_value>, --green <green_value> and --blue <blue_value> accept values from 0 to 255. If a color is 0 you can omit said color.
If you enter a color option, the mode will be set to 'static' in automatic (you can omit the option '--mode static').
If no colors/wrong values has been entered, a graphical dialog to choose a color will be shown.

Option --brightness <brightness_value> accept values from 0 to 100.
If no/wrong value has been entered, the brightness will default to 80.

Take care if a given parameter is supported by a given mode, and be careful to stay between min and max values.
Nevertheless don't be worried, if no/wrong parameter has been entered, the parameter will simply be set to the default value.

Option --wait <wait_value> will set the sleep time between i2cset commands. Accept integer or decimal value.
If no\wrong value has been entered, the wait time will default to 0.015.
Anyway this script will retry (for at most 20 times and then will abort) if an i2cset command fails, so you can keep wait time very low and don't worry about write errors.

Option --off will turn off leds on the ram. This option will take full priority over any other options.

examples:

show a menu where you can select an i2c-bus, then choose a mode to set for ram 61
# ${kfrgb_name} --ram 61

show a menu where you can choose a mode to set for ram 61 on i2c-bus 0
# ${kfrgb_name} --ram 61 --bus 0

show a graphical dialog to choose a color with brightness at 70 for ram 61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --brightness 70 --mode static --nowarn

set a yellow color to ram 0x61 and 0x63 on i2c-bus 0 (in this case the options --mode static and --blue 0 can be omitted)
# ${kfrgb_name} --ram 61,63 --bus 0 --red 255 --green 255

set mode wind with default parameters to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode wind --nowarn

set mode wind with brightness at 100 and direction down to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode wind --brightness 100 --direction down --nowarn

set mode slide with speed at 8 and direction up to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode slide --speed 8 --direction up --nowarn

set mode rainbow with speed at 1 to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode rainbow --speed 1 --nowarn

Turn off leds to ram 0x63 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 63 --bus 0 --off --nowarn


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
"
}

kfrgb_name="$(echo "${0}" | rev | awk -F'/' '{print $1}' | rev)"
if ! command -v "${kfrgb_name}" > /dev/null; then
	kfrgb_name="$(readlink -f "${0}")"
fi

if [[ "${EUID}" != '0' ]]; then
	echo -e "\e[1;31m* ${kfrgb_name} needs to run as root.\e[0m"
	exit 1
fi

for bin in i2cset yad; do
	if ! command -v "${bin}" >/dev/null; then
		error_missing='true'
		if [[ "${bin}" = 'i2cset' ]]; then
			package='i2c-tools'
		else
			package="${bin}"
		fi
		if [[ -z "${missing}" ]];  then
			missing="${package}"
		else
			missing+=" ${package}"
		fi
	fi
done
if [[ "${error_missing}" = 'true' ]]; then
	echo -e "\e[1;31m${kfrgb_name} requires \e[1;34m$missing\e[1;31m. Use e.g. \e[1;34msudo apt-get install $missing\e[0m"
	echo -e "\e[1;31mPlease install the required dependencies then run ${kfrgb_name} again.\e[0m"
	exit 1
fi

modes='rainbow prism spectrum slide wind static lightspeed rain firework breath dynamic twilight teleport flame voltage countdown rhythm slither'
supported_modes='rainbow prism spectrum slide wind static lightspeed rain firework twilight'
unsupported_modes='breath dynamic teleport flame voltage countdown rhythm slither'
supported_speed='rainbow prism spectrum slide wind lightspeed rain firework breath dynamic' #twilight
supported_delay='prism spectrum slide wind lightspeed'
supported_length='slide wind lightspeed'

for opt in "$@"; do
	shift
	case "$opt" in
		'--bus')		set -- "$@" '-s' ;;
		'--ram')		set -- "$@" '-m' ;;
		'--mode')		set -- "$@" '-d' ;;
		'--speed')		set -- "$@" '-p' ;;
		'--delay')		set -- "$@" '-e' ;;
		'--length')		set -- "$@" '-t' ;;
		'--direction')	set -- "$@" '-i' ;;
		'--red')		set -- "$@" '-r' ;;
		'--green')		set -- "$@" '-g' ;;
		'--blue')		set -- "$@" '-b' ;;
		'--brightness')	set -- "$@" '-l' ;;
		'--wait')		set -- "$@" '-w' ;;
		'--off')		set -- "$@" '-o' ;;
		'--nowarn')		set -- "$@" '-n' ;;
		'--help')		set -- "$@" '-h' ;;
		*)				set -- "$@" "$opt"
	esac
done

while getopts "s:m:d:p:e:t:i:r:g:b:l:w:onh" opt; do
	case ${opt} in
		s ) i2cbus_number="${OPTARG}"
		;;
		m ) ramsticks="${OPTARG}"
		;;
		d ) mode="${OPTARG}"
		;;
		p ) speed="${OPTARG}"
		;;
		e ) delay="${OPTARG}"
		;;
		t ) length="${OPTARG}"
		;;
		i ) direction="${OPTARG}"
		;;
		r ) red="${OPTARG}"
		;;
		g ) green="${OPTARG}"
		;;
		b ) blue="${OPTARG}"
		;;
		l ) brightness="${OPTARG}"
		;;
		w ) wait="${OPTARG}"
		;;
		o ) off='true'
		;;
		n ) nowarn='true'
		;;
		h ) givemehelp; exit 0
		;;
		*) echo -e "\e[1;31m## ERROR\e[0m"; givemehelp; exit 1
	esac
done

if [[ -z "${ramsticks}" ]]; then
	echo -e "\e[1;31m- ram: empty value!\e[0m"
	givemehelp
	exit 1
else
	check_hex_values "${ramsticks}"
	if [[ "${error_ramstick}" = 'true' ]]; then
		givemehelp
		exit 1
	fi
fi

i2cbuses="$(i2cdetect -l)"
while true; do
	if [[ -z "${i2cbus_number}" ]] || ! echo "${i2cbuses}" | grep -q "^i2c-${i2cbus_number}"; then
		if [[ -z "${i2cbus_number}" ]]; then
			true
		else
			echo -e "\e[1;31m- bus i2c-${i2cbus_number}: not found!\e[0m"
		fi
		select_i2cbus
	else
		break
	fi
done

if [[ -n "${red}" ]] || [[ -n "${green}" ]] || [[ -n "${blue}" ]] || [[ "${off}" = 'true' ]]; then
	unset speed
	unset delay
	unset length
	unset direction
	mode='static'
	if [[ "${off}" = 'true' ]]; then
		red='0'
		green='0'
		blue='0'
		brightness='0'
	fi
fi

initialize_modes
if [[ -z "${mode}" ]]; then
	mode='list'
fi
for mode_all in ${modes} list; do
	if [[ "${mode_all}" = "${mode}" ]]; then
		mode_check='true'
	fi
done
if [[ "${mode_check}" = 'true' ]]; then
	if [[ "${mode}" = 'list' ]]; then
		list_modes
	fi
	if echo "${unsupported_modes}" | grep -q "${mode}"; then
		echo -e "\e[1;31m- Mode ${mode}: currently not supported!\e[0m"
		exit 1
	else
		config_modes
	fi
else
	echo -e "\e[1;31m- Mode ${mode}: not found!\e[0m"
	exit 1
fi

set_mode
echo

exit 0
