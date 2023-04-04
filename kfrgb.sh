#!/bin/bash

# kfrgb

# Version:    0.0.1
# Author:     KeyofBlueS
# Repository: https://github.com/KeyofBlueS/kfrgb
# License:    GNU General Public License v3.0, https://opensource.org/licenses/GPL-3.0

function check_hex_values() {

	hex_values="${1//,/$' '}"
	for hex_value in ${hex_values}; do
		if ! [[ "${hex_value}" =~ ^[0-9a-fA-F]{2}$ ]]; then
			echo -e "\e[1;31m- RAM: ${hex_value} is not a valid octet hex value!\e[0m"
			error_ramstick='true'
		fi
	done
}

function check_value() {

	value="${1}"
	max_value="${2}"
	if [[ ! "${value}" =~ ^[[:digit:]]+$ ]] || [[ "${value}" -gt "${max_value}" ]] || [[ "${value}" -lt 0 ]]; then
		return 1
	fi
}

function check_color() {

	if [[ -z "${red}" ]] && [[ -z "${green}" ]] && [[ -z "${blue}" ]]; then
		yad_color
	else
		if [[ -z "${red}" ]]; then
			red='0'
		else
			if ! check_value "${red}" 255; then
				echo -e "\e[1;31m- Red color: ${red} is not a valid value!\e[0m"
				error_color='true'
			fi
		fi
		if [[ -z "${green}" ]]; then
			green='0'
		else
			if ! check_value "${green}" 255; then
				echo -e "\e[1;31m- Green color: ${green} is not a valid value!\e[0m"
				error_color='true'
			fi
		fi
		if [[ -z "${blue}" ]]; then
			blue='0'
		else
			if ! check_value "${blue}" 255; then
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
		if [[ -z "${brightness}" ]] || ! check_value "${brightness}" 100; then
			brightness='100'
		fi
	fi
	red_hex="$(printf '%x\n' ${red})"
	green_hex="$(printf '%x\n' ${green})"
	blue_hex="$(printf '%x\n' ${blue})"
	brightness_hex="$(printf '%x\n' ${brightness})"
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

function set_color() {

	echo
	echo -e "\e[0;32m- i2c bus: $(echo "${i2cbuses}" | grep "^i2c-${i2cbus_number}" | sed -e "s/[[:space:]]\+/ /g")\e[0m"
	echo -e "\e[0;32m- RAM hex values: ${ramsticks}\e[0m"
	echo -e "\e[1;31m- Red color value: ${red} (hex: ${red_hex})\e[0m"
	echo -e "\e[1;32m- Green color value: ${green} (hex: ${green_hex})\e[0m"
	echo -e "\e[1;34m- Blue color value: ${blue} (hex: ${blue_hex})\e[0m"
	echo -e "\e[1;37m- Brightness: ${brightness} (hex: ${brightness_hex})\e[0m"

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
			read -p " choose> " set_color_answer
			if [[ ! "${set_color_answer}" =~ ^[[:digit:]]+$ ]] || [[ "${set_color_answer}" -gt '1' ]] || [[ "${set_color_answer}" -lt '0' ]]; then
				echo -e "\e[1;31mInvalid choice!\e[0m"
				sleep '1'
			elif [[ "${set_color_answer}" -eq '0' ]]; then
				echo -e "\e[1;33mexit\e[0m"
				exit 0
			elif [[ "${set_color_answer}" -eq '1' ]]; then
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
			echo -e "\e[1;33m- Setting up color for ramstick ${ramstick}\e[0m"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x08 0x53
			sleep "${wait}"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x09 0x00
			sleep "${wait}"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x31 "0x${red_hex}"
			sleep "${wait}"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x32 "0x${green_hex}"
			sleep "${wait}"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x33 "0x${blue_hex}"
			sleep "${wait}"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x20 "0x${brightness_hex}"
			sleep "${wait}"
			i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x08 0x44
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

# Version:    0.0.1
# Author:     KeyofBlueS
# Repository: https://github.com/KeyofBlueS/kfrgb
# License:    GNU General Public License v3.0, https://opensource.org/licenses/GPL-3.0

### DISCLAIMER
Detection of a Kingston Fury Beast DDR5 RAM on a i2c-bus is not implemented, so you must be really sure about the values you enter for --ram and --bus.
To find out how to retrieve these values, please refer to https://gitlab.com/CalcProgrammer1/OpenRGB/-/issues/2879
Even if you enter the correct values, the procedure is still risky!
This program can confuse your I2C bus, cause data loss or brick your hardware! Proceed AT YOUR OWN RISK!

### DESCRIPTION
While waiting for support to be added to OpenRGB, this script is intended to be used to control RGB Leds of a Kingston Fury Beast DDR5 RAM ONLY.
It is limited to set a static color or turn off leds.
By using yad, a graphical dialog to choose a color is shown if no\wrong values for them are entered.

### USAGE
The option --ram <hex_ram_value> is mandatory. You can enter a single hex value or a comma separated set of hex values.
If you enter e.g. --ram 61,63 on --bus 0, but you really only have ram 61, ram 63 will be skipped.

If the option --bus is omitted or a wrong/non existent value has been entered, a prompt to select an i2c-bus will be shown.

Options --red, --green and --blue accept a value from 0 to 255. If a color is 0 you can omit said color.
If no colors/wrong values has been entered, a graphical dialog to choose a color will be shown.

Option --brightness accept a value from 0 to 100.
If no/wrong value has been entered, the brightness will default to 100.

Option --wait will set the sleep time between i2cset commands. Accept integer or decimal value.
If no\wrong value has been entered, the wait time will default to 0.015.
Anyway this script will retry (for at most 20 times and then will abort) if an i2cset command fails, so you can keep wait time very low and don't worry about write errors.

Option --off will turn off leds on the ram. This option has full priority over other options.

examples:

show prompt to select an i2c-bus and choosing a color from a graphical dialog for ram 61
# ${kfrgb_name} --ram 61

show a graphical dialog to choose a color for ram 61 on i2c-bus 0
# ${kfrgb_name} --ram 61 --bus 0

show a graphical dialog to choose a color with brightness at 70 for ram 61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --brightness 70 --nowarn

set a yellow color to ram 0x61 on i2c-bus 0 (in this case the option --blue 0 can be omitted)
# ${kfrgb_name} --ram 61 --bus 0 --red 255 --green 255

set a purple color to ram 0x61 and 0x63 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61,63 --bus 0 --red 200 --green 0 --blue 255 --nowarn

set a white color with brightness at 50 to ram 0x61 and 0x63 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61,63 --bus 0 --red 200 --green 0 --blue 255 --brightness 50 --nowarn

Turn off leds to ram 0x63 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 63 --bus 0 --off --nowarn


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

for opt in "$@"; do
	shift
	case "$opt" in
		'--bus')		set -- "$@" '-s' ;;
		'--ram')		set -- "$@" '-m' ;;
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

while getopts "s:m:r:g:b:l:w:onh" opt; do
	case ${opt} in
		s ) i2cbus_number="${OPTARG}"
		;;
		m ) ramsticks="${OPTARG}"
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

if [[ "${off}" = 'true' ]]; then
	red='0'
	green='0'
	blue='0'
	brightness='0'
fi
check_color

set_color
echo

exit 0
