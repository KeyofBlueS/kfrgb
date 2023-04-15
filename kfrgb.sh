#!/bin/bash

# kfrgb

# Version:    0.2.0
# Author:     KeyofBlueS
# Repository: https://github.com/KeyofBlueS/kfrgb
# License:    GNU General Public License v3.0, https://opensource.org/licenses/GPL-3.0

function initialize_modes() {

	### DO NOT EDIT THE VALUES BELOW UNTIL YOU REALLY KNOW WHAT YOU ARE DOING!!! ###

	#rainbow
	mode_hex_rainbow='01' # DO NOT EDIT!
	speeds_hex_rainbow='00 06 0c 12 18 1e 24 2a 30 36 3c' # DO NOT EDIT!
	speed_default_rainbow='7' # min 1, max 11, default 7
	direction_default_rainbow='up' # up or down, default up
	#prism
	mode_hex_prism='11' # DO NOT EDIT!
	speeds_hex_prism='00 06 0c 12 18 1e 24 2a 30 36 3c' # DO NOT EDIT!
	speed_default_prism='4' # min 1, max 11, default 4
	delays_hex_prism='02 03 04 05 06' # DO NOT EDIT!
	delay_default_prism='1' # min 1, max 5, default 1
	#spectrum
	mode_hex_spectrum='01' # DO NOT EDIT!
	speeds_hex_spectrum='00 06 0c 12 18 1e 24 2a 30 36 3c' # DO NOT EDIT!
	speed_default_spectrum='4' # min 1, max 11, default 4
	delays_hex_spectrum='02 03 04' # DO NOT EDIT!
	delay_default_spectrum='3' # min 1, max 3, default 3
	direction_default_spectrum='up' # up or down, default up
	#slide
	mode_hex_slide='05' # DO NOT EDIT!
	speeds_hex_slide='00 19 33 4c 66 7f 99 b2 cc e5 ff' # DO NOT EDIT!
	speed_default_slide='10' # min 1, max 11, default 10
	delays_hex_slide='01 02 03 04' # DO NOT EDIT!
	delay_default_slide='3' # min 1, max 4, default 3
	lengths_hex_slide='01 02 03 04 05 06 07 08 09 0a 0b 0c' # DO NOT EDIT!
	length_default_slide='4' # min 1, max 12, default 4
	tencolors_default_slide='255 0 0,0 255 0,255 100 0,0 0 255,238 238 0,128 0 128,0 109 119,255 200 0,255 85 255,60 125 255'
	backcolor_default_slide='0 0 0'
	direction_default_slide='down' # up or down, default down
	#wind
	mode_hex_wind='05' # DO NOT EDIT!
	speeds_hex_wind='00 19 33 4c 66 7f 99 b2 cc e5 ff' # DO NOT EDIT!
	speed_default_wind='10' # min 1, max 11, default 10
	delays_hex_wind='00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14' # DO NOT EDIT!
	delay_default_wind='1' # min 1, max 20, default 1
	lengths_hex_wind='01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 1e 1f 20' # DO NOT EDIT!
	length_default_wind='12' # min 1, max 32, default 12
	tencolors_default_wind='255 0 0,0 255 0,255 100 0,0 0 255,238 238 0,128 0 128,0 109 119,255 200 0,255 85 255,60 125 255'
	backcolor_default_wind='0 0 0'
	direction_default_wind='up' # up or down, default up
	#static
	mode_hex_static='00' # DO NOT EDIT!
	color_default_static='255 0 0'
	#static_byledcolor
	mode_hex_static_byledcolor='10' # DO NOT EDIT!
	byledcolors_default_static_byledcolor='255 0 0,0 255 0,0 0 255,255 0 0,0 255 0,0 0 255,255 0 0,0 255 0,0 0 255,255 0 0,0 255 0,0 0 255'
	#lightspeed
	mode_hex_lightspeed='06' # DO NOT EDIT!
	speeds_hex_lightspeed='00 19 33 4c 66 7f 99 b2 cc e5 ff' # DO NOT EDIT!
	speed_default_lightspeed='9' # min 1, max 11, default 9
	delays_hex_lightspeed='00 01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12 13 14' # DO NOT EDIT!
	delay_default_lightspeed='1' # min 1, max 20, default 1
	lengths_hex_lightspeed='01 02 03 04 05 06 07 08 09 0a 0b 0c 0d 0e 0f 10 11 12' # DO NOT EDIT!
	length_default_lightspeed='7' # min 1, max 18, default 7
	tencolors_default_lightspeed='255 0 0,0 255 0,255 100 0,0 0 255,238 238 0,128 0 128,0 109 119,255 200 0,255 85 255,60 125 255'
	direction_default_lightspeed='up' # up or down, default up
	#rain
	mode_hex_rain='06' # DO NOT EDIT!
	speeds_hex_rain='13 15 17 19 1b 1d 1f 21 23 25 27' # DO NOT EDIT!
	speed_default_rain='11' # min 1, max 11, default 11
	tencolors_default_rain='255 0 0,0 255 0,255 100 0,0 0 255,238 238 0,128 0 128,0 109 119,255 200 0,255 85 255,60 125 255'
	direction_default_rain='down' #
	#firework
	mode_hex_firework='06' # DO NOT EDIT!
	speeds_hex_firework='30 35 3a 3f 44 49 4e 53 58 5d 62' # DO NOT EDIT!
	speed_default_firework='11' # min 1, max 11, default 11
	tencolors_default_firework='255 0 0,0 255 0,255 100 0,0 0 255,238 238 0,128 0 128,0 109 119,255 200 0,255 85 255,60 125 255'
	direction_default_firework='up' #
	#breath
	mode_hex_breath='03' # DO NOT EDIT!
	speeds_hex_breath='' # DO NOT EDIT!
	speed_default_breath='6' # min 1, max 11, default 6
	tencolors_default_breath='255 0 0,0 255 0,255 100 0,0 0 255,238 238 0,128 0 128,0 109 119,255 200 0,255 85 255,60 125 255'
	#dynamic
	mode_hex_dynamic='04' # DO NOT EDIT!
	speeds_hex_dynamic='' # DO NOT EDIT!
	speed_default_dynamic='9' # min 1, max 11, default 9
	tencolors_default_dynamic='255 0 0,0 255 0,255 100 0,0 0 255,238 238 0,128 0 128,0 109 119,255 200 0,255 85 255,60 125 255'
	#twilight
	mode_hex_twilight='0a' # DO NOT EDIT!
	speeds_hex_twilight='' # DO NOT EDIT!
	speed_default_twilight='9' # min 1, max 11, default 9
	#teleport
	mode_hex_teleport='05' # DO NOT EDIT!
	#flame
	mode_hex_flame='09' # DO NOT EDIT!
	#voltage
	mode_hex_voltage='07' # DO NOT EDIT!
	#countdown
	mode_hex_countdown='08' # DO NOT EDIT!
	#rhythm
	mode_hex_rhythm='02' # DO NOT EDIT!
	#slither
	mode_hex_slither='' # DO NOT EDIT!

	#common
	brightness_default='80'
}

function check_hex_values() {

	hex_values="${1}"
	for hex_value in ${hex_values//,/$' '}; do
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

function check_mode() {

	current_modes="${@}"
	unset mode_check
	for current_mode in ${current_modes}; do
		if [[ "${current_mode}" = "${mode}" ]]; then
			mode_check='true'
			break
		fi
	done
	if [[ "${mode_check}" = 'true' ]]; then
		return 0
	else
		return 1
	fi
}

function check_parameters() {

	while true; do
		if [[ -z "${parameters_check}" ]] || [[ "${error_values}" = 'true' ]]; then
			if [[ "${ask}" = 'true' ]]; then
				echo
				if [[ "${values_for}" = '--tencolors' ]] || [[ "${values_for}" = '--backcolor' ]] || [[ "${values_for}" = '--color' ]] || [[ "${values_for}" = '--byledcolors' ]]; then
					set_yad_colors
					parameters_check="${selected_colors}"
				elif [[ "${values_for}" = '--speed' ]] || [[ "${values_for}" = '--delay' ]] || [[ "${values_for}" = '--length' ]] || [[ "${values_for}" = '--tencolorsnumber' ]] || [[ "${values_for}" = '--brightness' ]]; then
					set_parameters
					parameters_check="${selected_parameter}"
				fi
			else
				parameters_check="${parameters_check_default}"
			fi
		fi
		values="${parameters_check}"
		check_values
		if [[ "${error_values}" = 'true' ]]; then
			if [[ "${parameters_check}" = "${parameters_check_default}" ]]; then
				echo -e "\e[1;31m  Invalid ${values_for} ${parameters_check_default} default values!\e[0m"
				echo -e "\e[1;31m  Please check the ${values_for} default values for mode ${mode} inside ${kfrgb_name}\e[0m"
				ask='true'
			fi
		else
			ask="${ask_stored}"
			break
		fi
	done
}

function set_yad_colors() {

	unset selected_colors
	color_number='1'
	echo -e "\e[0;32m- Please select color for option ${values_for}:\e[0m"
	while true; do
		while true; do
			color="$(yad --color --title='Color selection' --text="Mode: ${mode}; Please select color ${color_number}/$((${max_values} / 3)) for option ${values_for}:" --button=OK --center)"
			if [[ -n "${color}" ]]; then
				selected_color="$((16#${color:1:2})),$((16#${color:3:2})),$((16#${color:5:2}))"
				break
			else
				exit 0
			fi
		done
		selected_color_hex="$(printf '%02x' ${selected_color//,/$' '})"
		perl -e ' foreach $a(@ARGV){print "[ \e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m  \e[49m ]"};print ""' "${selected_color_hex}"
		if [[ -z "${selected_colors}" ]]; then
			selected_colors="${selected_color}"
		else
			selected_colors+=",${selected_color}"
		fi
		if [[ "$(echo ${selected_colors//,/$' '} | wc -w)" -eq "${max_values}" ]]; then
			break
		elif [[ "$(echo ${selected_colors//,/$' '} | wc -w)" -gt "${max_values}" ]]; then
			exit 1
		fi
		color_number="$(("${color_number}" + 1))"
	done
	echo
}

function set_parameters() {

	echo -e "\e[1;32m- Please enter a value between ${min_value} and ${max_value} for option ${values_for} (leave empty for default ${parameters_check_default}):\e[0m"
	while true; do
		read -rp " enter a value> " selected_parameter
		if [[ -z "${selected_parameter}" ]]; then
			selected_parameter="${parameters_check_default}"
			break
		elif [[ ! "${selected_parameter}" =~ ^[[:digit:]]+$ ]] || [[ "${selected_parameter}" -lt "${min_value}" ]] || [[ "${selected_parameter}" -gt "${max_value}" ]]; then
			echo -e "\e[1;31mInvalid choice!\e[0m"
			sleep '1'
		else
			break
		fi
	done
}

function check_modes() {

	# check speed
	if check_mode "${supported_speed}"; then
		values_for='--speed'
		min_value='1'
		max_value='11'
		max_values='1'
		parameters_check="${speed}"
		parameters_check_default="${speed_default}"
		check_parameters
		speed="${parameters_check}"
		speed_hex="$(echo "${speeds_hex}" | awk '{ for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' | awk "{print $"${speed}"}")"
	fi
	# check delay
	if check_mode "${supported_delay}"; then
		values_for='--delay'
		min_value='1'
		max_value="${delay_max}"
		max_values='1'
		parameters_check="${delay}"
		parameters_check_default="${delay_default}"
		check_parameters
		delay="${parameters_check}"
		delay_hex="$(echo "${delays_hex}" | awk "{print $"${delay}"}")"
	fi
	# check length
	if check_mode "${supported_length}"; then
		values_for='--length'
		min_value='1'
		max_value="${length_max}"
		max_values='1'
		parameters_check="${length}"
		parameters_check_default="${length_default}"
		check_parameters
		length="${parameters_check}"
		length_hex="$(echo "${lengths_hex}" | awk "{print $"${length}"}")"
	fi
	# check tencolorsnumber
	if check_mode "${supported_tencolors}"; then
		values_for='--tencolorsnumber'
		min_value='1'
		max_value='10'
		max_values='1'
		parameters_check="${tencolorsnumber}"
		parameters_check_default="${max_value}"
		check_parameters
		tencolorsnumber="${parameters_check}"
		tencolorsnumber_hex="$(printf '%02x\n' ${tencolorsnumber})"
		# check tencolors
		values_for='--tencolors'
		min_value='0'
		max_value='255'
		max_values="$(("${tencolorsnumber}" * 3))"
		parameters_check="${tencolors}"
		current_tencolor_number='0'
		for tencolor_default in ${tencolors_default//,/$' '}; do
			if [[ -z "${tencolors_default_max_values}" ]]; then
				tencolors_default_max_values="${tencolor_default}"
			else
				tencolors_default_max_values+=" ${tencolor_default}"
			fi
			current_tencolor_number="$(("${current_tencolor_number}" + 1))"
			if [[ "${current_tencolor_number}" = "${max_values}" ]]; then
				break
			fi
		done
		tencolors_default="${tencolors_default_max_values}"
		parameters_check_default="${tencolors_default}"
		check_parameters
		tencolors="${parameters_check}"
		for tencolor in ${tencolors//,/$' '}; do
			if [[ -z "${tencolors_hex}" ]]; then
				tencolors_hex="$(printf '%02x\n' ${tencolor})"
			else
				tencolors_hex+=" $(printf '%02x\n' ${tencolor})"
			fi
		done
		until [[ "$(echo "${tencolors_hex}" | wc -w)" = '30' ]]; do
			tencolors_hex+=' 00'
		done
		tencolor_1_red_hex="$(echo ${tencolors_hex} | awk '{print $1}')"
		tencolor_1_green_hex="$(echo ${tencolors_hex} | awk '{print $2}')"
		tencolor_1_blue_hex="$(echo ${tencolors_hex} | awk '{print $3}')"

		tencolor_2_red_hex="$(echo ${tencolors_hex} | awk '{print $4}')"
		tencolor_2_green_hex="$(echo ${tencolors_hex} | awk '{print $5}')"
		tencolor_2_blue_hex="$(echo ${tencolors_hex} | awk '{print $6}')"

		tencolor_3_red_hex="$(echo ${tencolors_hex} | awk '{print $7}')"
		tencolor_3_green_hex="$(echo ${tencolors_hex} | awk '{print $8}')"
		tencolor_3_blue_hex="$(echo ${tencolors_hex} | awk '{print $9}')"

		tencolor_4_red_hex="$(echo ${tencolors_hex} | awk '{print $10}')"
		tencolor_4_green_hex="$(echo ${tencolors_hex} | awk '{print $11}')"
		tencolor_4_blue_hex="$(echo ${tencolors_hex} | awk '{print $12}')"

		tencolor_5_red_hex="$(echo ${tencolors_hex} | awk '{print $13}')"
		tencolor_5_green_hex="$(echo ${tencolors_hex} | awk '{print $14}')"
		tencolor_5_blue_hex="$(echo ${tencolors_hex} | awk '{print $15}')"

		tencolor_6_red_hex="$(echo ${tencolors_hex} | awk '{print $16}')"
		tencolor_6_green_hex="$(echo ${tencolors_hex} | awk '{print $17}')"
		tencolor_6_blue_hex="$(echo ${tencolors_hex} | awk '{print $18}')"

		tencolor_7_red_hex="$(echo ${tencolors_hex} | awk '{print $19}')"
		tencolor_7_green_hex="$(echo ${tencolors_hex} | awk '{print $20}')"
		tencolor_7_blue_hex="$(echo ${tencolors_hex} | awk '{print $21}')"

		tencolor_8_red_hex="$(echo ${tencolors_hex} | awk '{print $22}')"
		tencolor_8_green_hex="$(echo ${tencolors_hex} | awk '{print $23}')"
		tencolor_8_blue_hex="$(echo ${tencolors_hex} | awk '{print $24}')"

		tencolor_9_red_hex="$(echo ${tencolors_hex} | awk '{print $25}')"
		tencolor_9_green_hex="$(echo ${tencolors_hex} | awk '{print $26}')"
		tencolor_9_blue_hex="$(echo ${tencolors_hex} | awk '{print $27}')"

		tencolor_10_red_hex="$(echo ${tencolors_hex} | awk '{print $28}')"
		tencolor_10_green_hex="$(echo ${tencolors_hex} | awk '{print $29}')"
		tencolor_10_blue_hex="$(echo ${tencolors_hex} | awk '{print $30}')"
	fi
	# check backcolor
	if check_mode "${supported_backcolor}"; then
		values_for='--backcolor'
		min_value='0'
		max_value='255'
		max_values='3'
		parameters_check="${backcolor}"
		parameters_check_default="${backcolor_default}"
		check_parameters
		backcolor="${parameters_check}"
		for bcolor in ${backcolor//,/$' '}; do
			if [[ -z "${backcolor_hex}" ]]; then
				backcolor_hex="$(printf '%02x\n' ${bcolor})"
			else
				backcolor_hex+=" $(printf '%02x\n' ${bcolor})"
			fi
		done
		until [[ "$(echo "${backcolor_hex}" | wc -w)" = '3' ]]; do
			backcolor_hex+=' 00'
		done
		backcolor_red_hex="$(echo ${backcolor_hex} | awk '{print $1}')"
		backcolor_green_hex="$(echo ${backcolor_hex} | awk '{print $2}')"
		backcolor_blue_hex="$(echo ${backcolor_hex} | awk '{print $3}')"
	fi
	# check allcolor
	if check_mode "${supported_allcolor}"; then
		values_for='--color'
		min_value='0'
		max_value='255'
		max_values='3'
		parameters_check="${color}"
		parameters_check_default="${color_default}"
		check_parameters
		color="${parameters_check}"
		for allcolor in ${color//,/$' '}; do
			if [[ -z "${allcolor_hex}" ]]; then
				allcolor_hex="$(printf '%02x\n' ${allcolor})"
			else
				allcolor_hex+=" $(printf '%02x\n' ${allcolor})"
			fi
		done
		until [[ "$(echo "${allcolor_hex}" | wc -w)" = '3' ]]; do
			allcolor_hex+=' 00'
		done
		allcolor_red_hex="$(echo ${allcolor_hex} | awk '{print $1}')"
		allcolor_green_hex="$(echo ${allcolor_hex} | awk '{print $2}')"
		allcolor_blue_hex="$(echo ${allcolor_hex} | awk '{print $3}')"
	fi
	# check byledcolors
	if check_mode "${supported_byledcolor}"; then
		values_for='--byledcolors'
		min_value='0'
		max_value='255'
		max_values='36'
		parameters_check="${byledcolors}"
		parameters_check_default="${byledcolors_default}"
		check_parameters
		byledcolors="${parameters_check}"
		for byledcolor in ${byledcolors//,/$' '}; do
			if [[ -z "${byledcolors_hex}" ]]; then
				byledcolors_hex="$(printf '%02x\n' ${byledcolor})"
			else
				byledcolors_hex+=" $(printf '%02x\n' ${byledcolor})"
			fi
		done
		until [[ "$(echo "${byledcolors_hex}" | wc -w)" = '36' ]]; do
			byledcolors_hex+=' 00'
		done
		byledcolor_1_red_hex="$(echo ${byledcolors_hex} | awk '{print $1}')"
		byledcolor_1_green_hex="$(echo ${byledcolors_hex} | awk '{print $2}')"
		byledcolor_1_blue_hex="$(echo ${byledcolors_hex} | awk '{print $3}')"

		byledcolor_2_red_hex="$(echo ${byledcolors_hex} | awk '{print $4}')"
		byledcolor_2_green_hex="$(echo ${byledcolors_hex} | awk '{print $5}')"
		byledcolor_2_blue_hex="$(echo ${byledcolors_hex} | awk '{print $6}')"

		byledcolor_3_red_hex="$(echo ${byledcolors_hex} | awk '{print $7}')"
		byledcolor_3_green_hex="$(echo ${byledcolors_hex} | awk '{print $8}')"
		byledcolor_3_blue_hex="$(echo ${byledcolors_hex} | awk '{print $9}')"

		byledcolor_4_red_hex="$(echo ${byledcolors_hex} | awk '{print $10}')"
		byledcolor_4_green_hex="$(echo ${byledcolors_hex} | awk '{print $11}')"
		byledcolor_4_blue_hex="$(echo ${byledcolors_hex} | awk '{print $12}')"

		byledcolor_5_red_hex="$(echo ${byledcolors_hex} | awk '{print $13}')"
		byledcolor_5_green_hex="$(echo ${byledcolors_hex} | awk '{print $14}')"
		byledcolor_5_blue_hex="$(echo ${byledcolors_hex} | awk '{print $15}')"

		byledcolor_6_red_hex="$(echo ${byledcolors_hex} | awk '{print $16}')"
		byledcolor_6_green_hex="$(echo ${byledcolors_hex} | awk '{print $17}')"
		byledcolor_6_blue_hex="$(echo ${byledcolors_hex} | awk '{print $18}')"

		byledcolor_7_red_hex="$(echo ${byledcolors_hex} | awk '{print $19}')"
		byledcolor_7_green_hex="$(echo ${byledcolors_hex} | awk '{print $20}')"
		byledcolor_7_blue_hex="$(echo ${byledcolors_hex} | awk '{print $21}')"

		byledcolor_8_red_hex="$(echo ${byledcolors_hex} | awk '{print $22}')"
		byledcolor_8_green_hex="$(echo ${byledcolors_hex} | awk '{print $23}')"
		byledcolor_8_blue_hex="$(echo ${byledcolors_hex} | awk '{print $24}')"

		byledcolor_9_red_hex="$(echo ${byledcolors_hex} | awk '{print $25}')"
		byledcolor_9_green_hex="$(echo ${byledcolors_hex} | awk '{print $26}')"
		byledcolor_9_blue_hex="$(echo ${byledcolors_hex} | awk '{print $27}')"

		byledcolor_10_red_hex="$(echo ${byledcolors_hex} | awk '{print $28}')"
		byledcolor_10_green_hex="$(echo ${byledcolors_hex} | awk '{print $29}')"
		byledcolor_10_blue_hex="$(echo ${byledcolors_hex} | awk '{print $30}')"

		byledcolor_11_red_hex="$(echo ${byledcolors_hex} | awk '{print $31}')"
		byledcolor_11_green_hex="$(echo ${byledcolors_hex} | awk '{print $32}')"
		byledcolor_11_blue_hex="$(echo ${byledcolors_hex} | awk '{print $33}')"

		byledcolor_12_red_hex="$(echo ${byledcolors_hex} | awk '{print $34}')"
		byledcolor_12_green_hex="$(echo ${byledcolors_hex} | awk '{print $35}')"
		byledcolor_12_blue_hex="$(echo ${byledcolors_hex} | awk '{print $36}')"
	fi
	# check direction
	if check_mode "${supported_direction}"; then
		while true; do
			if [[ "${direction}" != 'up' ]] && [[ "${direction}" != 'down' ]]; then
				if [[ -z "${direction}" ]]; then
					true
				else
					echo
					echo -e "\e[1;31m- option --direction: ${direction} not valid!\e[0m"
					echo -e "\e[1;31m  accepted values are 'up' or 'down'\e[0m"
				fi
				if [[ "${ask}" = 'true' ]]; then
					echo
					echo -e "\e[1;32m- Please enter a value between 'up' and 'down' for option --direction (leave empty for default ${direction_default}):\e[0m"
					while true; do
						read -rp " enter a value> " selected_direction
						if [[ -z "${selected_direction}" ]]; then
							direction="${direction_default}"
							break
						elif [[ "${selected_direction}" != 'up' ]] && [[ "${selected_direction}" != 'down' ]]; then
							echo -e "\e[1;31mInvalid choice!\e[0m"
							sleep '1'
						else
							direction="${selected_direction}"
							break
						fi
					done
				else
					if [[ "${direction_default}" != 'up' ]] && [[ "${direction_default}" != 'down' ]]; then
						echo
						echo -e "\e[1;31m  Invalid --direction ${direction_default} default values!\e[0m"
						echo -e "\e[1;31m  Please check the --direction default values for mode ${mode} inside ${kfrgb_name}\e[0m"
						ask='true'
					else
						direction="${direction_default}"
						break
					fi
				fi
			else
				ask="${ask_stored}"
				break
			fi
		done
		if [[ "${direction}" = 'up' ]]; then
			direction_hex='01'
		elif [[ "${direction}" = 'down' ]]; then
			direction_hex='02'
		fi
	fi
	# check brightness
	values_for='--brightness'
	min_value='0'
	max_value='100'
	max_values='1'
	parameters_check="${brightness}"
	parameters_check_default="${brightness_default}"
	check_parameters
	brightness="${parameters_check}"
	brightness_hex="$(printf '%02x\n' ${brightness})"
}

function config_modes() {

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
		tencolors_default="${tencolors_default_slide}"
		backcolor_default="${backcolor_default_slide}"
		direction_default="${direction_default_slide}"
	elif [[ "${mode}" = 'wind' ]]; then
		mode_hex="${mode_hex_wind}"
		speeds_hex="${speeds_hex_wind}"
		speed_default="${speed_default_wind}"
		delays_hex="${delays_hex_wind}"
		delay_default="${delay_default_wind}"
		lengths_hex="${lengths_hex_wind}"
		length_default="${length_default_wind}"
		tencolors_default="${tencolors_default_wind}"
		backcolor_default="${backcolor_default_wind}"
		direction_default="${direction_default_wind}"
	elif [[ "${mode}" = 'static' ]]; then
		mode_hex="${mode_hex_static}"
		color_default="${color_default_static}"
	elif [[ "${mode}" = 'static_byledcolor' ]]; then
		mode_hex="${mode_hex_static_byledcolor}"
		byledcolors_default="${byledcolors_default_static_byledcolor}"
	elif [[ "${mode}" = 'lightspeed' ]]; then
		mode_hex="${mode_hex_lightspeed}"
		speeds_hex="${speeds_hex_lightspeed}"
		speed_default="${speed_default_lightspeed}"
		delays_hex="${delays_hex_lightspeed}"
		delay_default="${delay_default_lightspeed}"
		lengths_hex="${lengths_hex_lightspeed}"
		length_default="${length_default_lightspeed}"
		tencolors_default="${tencolors_default_lightspeed}"
		direction_default="${direction_default_lightspeed}"
	elif [[ "${mode}" = 'rain' ]]; then
		mode_hex="${mode_hex_rain}"
		speeds_hex="${speeds_hex_rain}"
		speed_default="${speed_default_rain}"
		tencolors_default="${tencolors_default_rain}"
		direction_default="${direction_default_rain}"
	elif [[ "${mode}" = 'firework' ]]; then
		mode_hex="${mode_hex_firework}"
		speeds_hex="${speeds_hex_firework}"
		speed_default="${speed_default_firework}"
		tencolors_default="${tencolors_default_firework}"
		direction_default="${direction_default_firework}"
	elif [[ "${mode}" = 'breath' ]]; then
		mode_hex="${mode_hex_breath}"
		speeds_hex="${speeds_hex_breath}"
		speed_default="${speed_default_breath}"
		tencolors_default="${tencolors_default_breath}"
	elif [[ "${mode}" = 'dynamic' ]]; then
		mode_hex="${mode_hex_dynamic}"
		speeds_hex="${speeds_hex_dynamic}"
		speed_default="${speed_default_dynamic}"
		tencolors_default="${tencolors_default_dynamic}"
	elif [[ "${mode}" = 'twilight' ]]; then
		mode_hex="${mode_hex_twilight}"
		speeds_hex="${speeds_hex_twilight}"
		speed_default="${speed_default_twilight}"
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

	if check_mode "${supported_delay}"; then
		delay_max="$(echo "${delays_hex}" | wc -w)"
	fi
	if check_mode "${supported_length}"; then
		length_max="$(echo "${lengths_hex}" | wc -w)"
	fi
	check_modes
}

function check_values() {

	unset error_values
	unset wrong_values
	current_value='0'
	for value in ${values//,/$' '}; do
		current_value="$(("${current_value}" + 1))"
		if [[ "${current_value}" -gt "${max_values}" ]]; then
			too_many_arguments='true'
			error_values='true'
		fi
		if [[ ! "${value}" =~ ^[[:digit:]]+$ ]] || [[ "${value}" -gt "${max_value}" ]] || [[ "${value}" -lt "${min_value}" ]]; then
			error_values='true'
			if [[ -z "${wrong_values}" ]]; then
				wrong_values="${value}"
			else
				wrong_values+=" ${value}"
			fi
		fi
	done

	if [[ "${error_values}" = 'true' ]]; then
		echo
		echo -e "\e[1;31m- option ${values_for}: ${values}:\e[0m"
		if [[ "${too_many_arguments}" = 'true' ]]; then
			echo -e "\e[1;31m  too many arguments!\e[0m"
		fi
		if [[ -n "${wrong_values}" ]]; then
			echo -e "\e[1;31m  ${wrong_values} not valid!\e[0m"
		fi
		if [[ "${max_values}" -eq '1' ]]; then
			echo -e "\e[1;31m  accept ${max_values} value from ${min_value} to ${max_value}\e[0m"
		elif [[ "${max_values}" -gt '1' ]]; then
			echo -e "\e[1;31m  accept ${max_values} comma separated values from ${min_value} to ${max_value}\e[0m"
		fi
	fi
}

function set_mode() {

	echo
	echo -e "\e[0;32m- i2c bus: $(echo "${i2cbuses}" | grep "^i2c-${i2cbus_number}" | sed -e "s/[[:space:]]\+/ /g")\e[0m"
	echo -e "\e[0;32m- RAM hex values: ${ramsticks}\e[0m"
	echo
	echo -e "\e[0;32m- Mode: ${mode}\e[0m"

	if [[ "${mode}" = 'static' ]]; then
		static_color="${allcolor_red_hex}${allcolor_green_hex}${allcolor_blue_hex}"
		echo "  - Color is: "$(perl -e ' foreach $a(@ARGV){print "[ \e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m  \e[49m ]"};print "\n"' ${static_color} ${static_color} ${static_color} ${static_color} ${static_color} ${static_color} ${static_color} ${static_color} ${static_color} ${static_color} ${static_color} ${static_color})""
	else
		if check_mode "${supported_speed}"; then
			echo -e "\e[0;32m  - Speed: ${speed}/11\e[0m"
		fi
		if check_mode "${supported_delay}"; then
			echo -e "\e[0;32m  - Delay: ${delay}/${delay_max}\e[0m"
		fi
		if check_mode "${supported_length}"; then
			echo -e "\e[0;32m  - Length: ${length}/${length_max}\e[0m"
		fi
		if check_mode "${supported_tencolors}"; then
			tencolor_1="${tencolor_1_red_hex}${tencolor_1_green_hex}${tencolor_1_blue_hex}"
			tencolor_2="${tencolor_2_red_hex}${tencolor_2_green_hex}${tencolor_2_blue_hex}"
			tencolor_3="${tencolor_3_red_hex}${tencolor_3_green_hex}${tencolor_3_blue_hex}"
			tencolor_4="${tencolor_4_red_hex}${tencolor_4_green_hex}${tencolor_4_blue_hex}"
			tencolor_5="${tencolor_5_red_hex}${tencolor_5_green_hex}${tencolor_5_blue_hex}"
			tencolor_6="${tencolor_6_red_hex}${tencolor_6_green_hex}${tencolor_6_blue_hex}"
			tencolor_7="${tencolor_7_red_hex}${tencolor_7_green_hex}${tencolor_7_blue_hex}"
			tencolor_8="${tencolor_8_red_hex}${tencolor_8_green_hex}${tencolor_8_blue_hex}"
			tencolor_9="${tencolor_9_red_hex}${tencolor_9_green_hex}${tencolor_9_blue_hex}"
			tencolor_10="${tencolor_10_red_hex}${tencolor_10_green_hex}${tencolor_10_blue_hex}"
			current_tencolor_number='0'
			for tencolor_all in "${tencolor_1}" "${tencolor_2}" "${tencolor_3}" "${tencolor_4}" "${tencolor_5}" "${tencolor_6}" "${tencolor_7}" "${tencolor_8}" "${tencolor_9}" "${tencolor_10}"; do
				if [[ -z "${tencolors_all}" ]]; then
					tencolors_all="${tencolor_all}"
				else
					tencolors_all+=" ${tencolor_all}"
				fi
				current_tencolor_number="$(("${current_tencolor_number}" + 1))"
				if [[ "${current_tencolor_number}" = "${tencolorsnumber}" ]]; then
					break
				fi
			done
			echo "  - Colors will cycle through: "$(perl -e ' foreach $a(@ARGV){print " \e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m  \e[49m >"};print "\n"' ${tencolors_all})""
		fi
		if check_mode "${supported_backcolor}"; then
			back_color="${backcolor_red_hex}${backcolor_green_hex}${backcolor_blue_hex}"
			echo "  - Back color is: "$(perl -e ' foreach $a(@ARGV){print "[ \e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m  \e[49m ]"};print "\n"' ${back_color})""
		fi
		if check_mode "${supported_byledcolor}"; then
			byledcolor_1="${byledcolor_1_red_hex}${byledcolor_1_green_hex}${byledcolor_1_blue_hex}"
			byledcolor_2="${byledcolor_2_red_hex}${byledcolor_2_green_hex}${byledcolor_2_blue_hex}"
			byledcolor_3="${byledcolor_3_red_hex}${byledcolor_3_green_hex}${byledcolor_3_blue_hex}"
			byledcolor_4="${byledcolor_4_red_hex}${byledcolor_4_green_hex}${byledcolor_4_blue_hex}"
			byledcolor_5="${byledcolor_5_red_hex}${byledcolor_5_green_hex}${byledcolor_5_blue_hex}"
			byledcolor_6="${byledcolor_6_red_hex}${byledcolor_6_green_hex}${byledcolor_6_blue_hex}"
			byledcolor_7="${byledcolor_7_red_hex}${byledcolor_7_green_hex}${byledcolor_7_blue_hex}"
			byledcolor_8="${byledcolor_8_red_hex}${byledcolor_8_green_hex}${byledcolor_8_blue_hex}"
			byledcolor_9="${byledcolor_9_red_hex}${byledcolor_9_green_hex}${byledcolor_9_blue_hex}"
			byledcolor_10="${byledcolor_10_red_hex}${byledcolor_10_green_hex}${byledcolor_10_blue_hex}"
			byledcolor_11="${byledcolor_11_red_hex}${byledcolor_11_green_hex}${byledcolor_11_blue_hex}"
			byledcolor_12="${byledcolor_12_red_hex}${byledcolor_12_green_hex}${byledcolor_12_blue_hex}"
			echo "  - Colors are: "$(perl -e ' foreach $a(@ARGV){print "[ \e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m  \e[49m ]"};print "\n"' ${byledcolor_1} ${byledcolor_2} ${byledcolor_3} ${byledcolor_4} ${byledcolor_5} ${byledcolor_6} ${byledcolor_7} ${byledcolor_8} ${byledcolor_9} ${byledcolor_10} ${byledcolor_11} ${byledcolor_12})""
		fi
		if check_mode "${supported_direction}"; then
			echo -e "\e[0;32m  - Direction: ${direction}\e[0m"
		fi
	fi
	echo -e "\e[0;32m  - Brightness: ${brightness}\e[0m"

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
			if check_mode "${supported_speed}"; then
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x0e "0x${speed_hex}"
				sleep "${wait}"
			fi
			if check_mode "${supported_delay}"; then
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x0d "0x${delay_hex}"
				sleep "${wait}"
			fi
			if check_mode "${supported_length}"; then
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x26 "0x${length_hex}"
				sleep "${wait}"
			fi
			if check_mode "${supported_tencolors}"; then
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x30 "0x${tencolorsnumber_hex}"
				sleep "${wait}"
				
				if [[ '1' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x31 "0x${tencolor_1_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x32 "0x${tencolor_1_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x33 "0x${tencolor_1_blue_hex}"
					sleep "${wait}"
				fi

				if [[ '2' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x34 "0x${tencolor_2_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x35 "0x${tencolor_2_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x36 "0x${tencolor_2_blue_hex}"
					sleep "${wait}"
				fi

				if [[ '3' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x37 "0x${tencolor_3_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x38 "0x${tencolor_3_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x39 "0x${tencolor_3_blue_hex}"
					sleep "${wait}"
				fi

				if [[ '4' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x3a "0x${tencolor_4_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x3b "0x${tencolor_4_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x3c "0x${tencolor_4_blue_hex}"
					sleep "${wait}"
				fi

				if [[ '5' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x3d "0x${tencolor_5_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x3e "0x${tencolor_5_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x3f "0x${tencolor_5_blue_hex}"
					sleep "${wait}"
				fi

				if [[ '6' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x40 "0x${tencolor_6_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x41 "0x${tencolor_6_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x42 "0x${tencolor_6_blue_hex}"
					sleep "${wait}"
				fi

				if [[ '7' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x43 "0x${tencolor_7_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x44 "0x${tencolor_7_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x45 "0x${tencolor_7_blue_hex}"
					sleep "${wait}"
				fi

				if [[ '8' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x46 "0x${tencolor_8_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x47 "0x${tencolor_8_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x48 "0x${tencolor_8_blue_hex}"
					sleep "${wait}"
				fi

				if [[ '9' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x49 "0x${tencolor_9_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x4a "0x${tencolor_9_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x4b "0x${tencolor_9_blue_hex}"
					sleep "${wait}"
				fi

				if [[ '10' -le "${tencolorsnumber}" ]]; then
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x4c "0x${tencolor_10_red_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x4d "0x${tencolor_10_green_hex}"
					sleep "${wait}"
					i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x4e "0x${tencolor_10_blue_hex}"
					sleep "${wait}"
				fi
			fi
			if check_mode "${supported_backcolor}"; then
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x23 "0x${backcolor_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x24 "0x${backcolor_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x25 "0x${backcolor_blue_hex}"
				sleep "${wait}"
			fi
			if check_mode "${supported_allcolor}"; then
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x31 "0x${allcolor_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x32 "0x${allcolor_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x33 "0x${allcolor_blue_hex}"
				sleep "${wait}"
			fi
			if check_mode "${supported_byledcolor}"; then
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x50 "0x${byledcolor_1_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x51 "0x${byledcolor_1_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x52 "0x${byledcolor_1_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x53 "0x${byledcolor_2_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x54 "0x${byledcolor_2_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x55 "0x${byledcolor_2_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x56 "0x${byledcolor_3_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x57 "0x${byledcolor_3_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x58 "0x${byledcolor_3_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x59 "0x${byledcolor_4_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x5a "0x${byledcolor_4_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x5b "0x${byledcolor_4_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x5c "0x${byledcolor_5_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x5d "0x${byledcolor_5_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x5e "0x${byledcolor_5_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x5f "0x${byledcolor_6_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x60 "0x${byledcolor_6_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x61 "0x${byledcolor_6_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x62 "0x${byledcolor_7_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x63 "0x${byledcolor_7_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x64 "0x${byledcolor_7_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x65 "0x${byledcolor_8_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x66 "0x${byledcolor_8_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x67 "0x${byledcolor_8_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x68 "0x${byledcolor_9_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x69 "0x${byledcolor_9_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x6a "0x${byledcolor_9_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x6b "0x${byledcolor_10_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x6c "0x${byledcolor_10_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x6d "0x${byledcolor_10_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x6e "0x${byledcolor_11_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x6f "0x${byledcolor_11_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x70 "0x${byledcolor_11_blue_hex}"
				sleep "${wait}"

				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x71 "0x${byledcolor_12_red_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x72 "0x${byledcolor_12_green_hex}"
				sleep "${wait}"
				i2cset_retry -y "${i2cbus_number}" "0x${ramstick}" 0x73 "0x${byledcolor_12_blue_hex}"
				sleep "${wait}"
			fi
			if check_mode "${supported_direction}"; then
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
		color="$(yad --color --title='Color selection' --text="Please select color ${color_number} for mode ${mode}" --button=OK --center)"
		if [[ -n "${color}" ]]; then
			selected_color="$((16#${color:1:2})),$((16#${color:3:2})),$((16#${color:5:2}))"
			break
		else
			exit 0
		fi
	done
}

function givemehelp() {

	echo "
# kfrgb

# Version:    0.2.0
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
Set any mode between rainbow, prism, spectrum, slide, wind, static, static_byledcolor, lightspeed, rain, firework, and twilight.
By using yad, a graphical dialog to choose a color is shown if no\wrong values for them are entered.

Not all modes are supported.
Modes that require more than 1 ram stick are not supported (teleport, flame, voltage, countdown, rhythm, slither).
Modes breath and dynamic are not supported because if set, then you can't set any other mode, you need to turn off the pc (do a cold boot) to 'unlock' .
Setting speed on mode twilight is not supported, this mode will run at full speed.

### USAGE
The option --ram <hex_ram_value> is mandatory. You can enter a single hex value or a comma separated set of hex values.
If you enter e.g. --ram 61,63 on --bus 0, but you really only have ram 61, ram 63 will be skipped.

If the option --bus <i2c_bus_number> is omitted or a wrong/non existent value has been entered, a prompt to select an i2c-bus will be shown.

Use the option --mode <mode_name> to set a mode.
Available modes are 'rainbow' 'prism' 'spectrum' 'slide' 'wind' 'static' 'static_byledcolor' 'lightspeed' 'rain' 'firework' 'twilight'.
Pass 'list' as <mode_name> to get a menu where you can choose a mode to set.

Speed (min 1, max 11) and brightness (min 0, max 100, default 80) are common for every mode. However every mode has it's own available and default parameters also:
- rainbow: speed (default 7); direction (default up).
- prism: speed (default 4); delay (min 1, max 5, default 1).
- spectrum: speed (default 4); delay (min 1, max 3, default 3); direction (default up).
- slide: speed (default 10); delay (min 1, max 4, default 3); lenght (min 1, max 12, default 4); tencolors; backcolor; direction (default down).
- wind: speed (default 10); delay (min 1, max 21, default 1); lenght (min 1, max 32, default 12); direction (default up).
- static: color.
- static_byledcolor: byledcolors.
- lightspeed: speed (default 9); delay (min 1, max 21, default 1); lenght (min 1, max 18, default 7); tencolors; backcolor; direction (default up).
- rain: speed (default 11); tencolors; direction (default down).
- firework: speed (default 11); tencolors; direction (default up).
- twilight: speed (currently not supported, this mode will run at max speed).
 
To set mode parameters you must use options --speed, --delay, --length, --direction, --color, --tencolors, --tencolorsnumber, --backcolor, --byledcolors.
Take care if a given parameter is supported by a given mode, and be careful to stay between min and max values.
Nevertheless don't be worried, if no/wrong parameter has been entered, the parameter will simply be set to the default value or not set at all if not supported by the selected mode.

One color is expressed with 3 comma separated values for RGB. So 255,255,255 means white; 255,0,0 means red; 0,255,0 means green; 0,0,255 means blue.

Option --color <r_value,g_value,b_value> accept 3 comma separated values from 0 to 255.
Use this option to set a color in mode static.

Option --byledcolors <byledcolors_values> accept 36 comma separated values from 0 to 255. Every three values equals a color (36 values are 12 colors, this ram has 12 leds indeed).
Use this option to set every single led color in the supported mode (static_byledcolor).

Option --tencolors <tencolors_values> accept 30 comma separated values from 0 to 255. Every three values equals a color (30 values are 10 colors)
Use this option to cycle through these colors in the supported mode (slide, wind, lightspeed, rain, firework).

Option --tencolorsnumber <tencolorsnumber_value> accept 1 value from 0 to 10.
Use this option to set how many colors will cycle the supported mode (slide, wind, lightspeed, rain, firework).
e.g. '--tencolorsnumber 3' to cycle the first 3 colors out of 10.

Option --backcolor <r_value,g_value,b_value> accept 3 comma separated values from 0 to 255.
Use this option to set the background color in the supported mode (slide, wind).

Option --brightness <brightness_value> accept 1 value from 0 to 100.
Use this option to set the brightness in any mode.

Option --ask, if no/wrong parameter has been entered, will ask for user input instead of automatically set default values.
For color values a graphical dialog to choose a color will be shown.

Option --wait <wait_value> will set the sleep time between i2cset commands. Accept 1 integer or decimal value.
If no\wrong value has been entered, the wait time will default to 0.015.
Anyway this script will retry (for at most 20 times and then will abort) if an i2cset command fails, so you can keep wait time very low and don't worry about write errors.

Option --off will turn off leds on the ram. This option will take full priority over any other options.

### EXAMPLES

show a menu where you can select an i2c-bus, then choose a mode to set for ram 61
# ${kfrgb_name} --ram 61

show a menu where you can choose a mode to set for ram 61 on i2c-bus 0
# ${kfrgb_name} --ram 61 --bus 0

show a graphical dialog to choose a color with brightness at 70 for ram 61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --brightness 70 --mode static --ask --nowarn

set a yellow color to ram 0x61 and 0x63 on i2c-bus 0 (in this case the options --mode static)
# ${kfrgb_name} --ram 61,63 --bus 0 --color 255,255,0

set a every single led color to ram 0x61 and 0x63 on i2c-bus 0
# ${kfrgb_name} --ram 61,63 --bus 0 --mode static_byledcolor --byledcolors 255,0,0,0,255,0,0,0,255,255,0,0,0,255,0,0,0,255,255,0,0,0,255,0,0,0,255,255,0,0,0,255,0,0,0,255

set mode wind with default parameters to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode wind --nowarn

set mode wind with brightness at 100 and direction down to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode wind --brightness 100 --direction down --nowarn

set mode wind with backcolor to violet, brightness at 100 and direction down to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode wind --backcolor 150,70,200 --brightness 100 --direction down --nowarn

set mode slide with speed at 8 and direction up to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode slide --speed 8 --direction up --nowarn

set mode rainbow with speed at 1 to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode rainbow --speed 1 --nowarn

set mode slide and 10 colors to cycle through to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode slide --tencolors 255,0,0,0,255,0,255,100,0,0,0,255,238,238,0,128,0,128,0,109,119,255,200,0,255,85,255,60,125,255 --nowarn

set mode slide and 3 colors (you can omit the remaining 7 colors) to cycle through to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode slide --tencolors 255,0,0,0,255,0,255,100,0 --tencolorsnumber 3 --nowarn

set mode wind and, asking for user input, 10 colors to cycle through to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode wind --ask --nowarn

set mode wind and, asking for user input, 3 colors to cycle through to ram 0x61 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 61 --bus 0 --mode wind --tencolorsnumber 3 --ask --nowarn

Turn off leds to ram 0x63 on i2c-bus 0 without the warning before apply the settings
# ${kfrgb_name} --ram 63 --bus 0 --off --nowarn

### NOTE ABOUT COMMA SEPARATED VALUES
As explained above, RGB values can be set in a comma separated format e.g.:
--tencolors 255,0,0,0,255,0,255,100,0,0,0,255,238,238,0,128,0,128,0,109,119,255,200,0,255,85,255,60,125,255

but also comma/space separated and must be enclosed in single quotes e.g.:
--tencolors '255 0 0,0 255 0,255 100 0,0 0 255,238 238 0,128 0 128,0 109 119,255 200 0,255 85 255,60 125 255'

I prefer the latter because i can visually separate every RGB triplet.


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
-l, --brightness <value>       Enter  1 value between 0 and 100. Default is 80.
-o, --off                      Turn off all leds.
-w, --wait <value>             Enter a sleep time between i2cset commands. Default is 0.015.
-n, --nowarn                   Apply settings without warning.
-h, --help                     Show this help.
"
}

function initialize() {

	if [[ "${EUID}" != '0' ]]; then
		echo -e "\e[1;31m* ${kfrgb_name} needs to run as root.\e[0m"
		exit 1
	fi

	for bin in i2cset yad perl; do
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
}

kfrgb_name="$(echo "${0}" | rev | awk -F'/' '{print $1}' | rev)"
if ! command -v "${kfrgb_name}" > /dev/null; then
	kfrgb_name="$(readlink -f "${0}")"
fi

modes='rainbow prism spectrum slide wind static static_byledcolor lightspeed rain firework breath dynamic twilight teleport flame voltage countdown rhythm slither'
supported_modes='rainbow prism spectrum slide wind static static_byledcolor lightspeed rain firework twilight'
unsupported_modes='breath dynamic teleport flame voltage countdown rhythm slither'
supported_speed='rainbow prism spectrum slide wind lightspeed rain firework breath dynamic' #twilight
supported_delay='prism spectrum slide wind lightspeed'
supported_length='slide wind lightspeed'
supported_tencolors='slide wind lightspeed rain firework breath dynamic'
supported_backcolor='slide wind'
supported_byledcolor='static_byledcolor breath'
supported_allcolor='static'
supported_direction='rainbow spectrum slide wind lightspeed rain firework'


for opt in "$@"; do
	shift
	case "$opt" in
		'--bus')				set -- "$@" '-s' ;;
		'--ram')				set -- "$@" '-m' ;;
		'--mode')				set -- "$@" '-d' ;;
		'--speed')				set -- "$@" '-p' ;;
		'--delay')				set -- "$@" '-e' ;;
		'--length')				set -- "$@" '-q' ;;
		'--direction')			set -- "$@" '-i' ;;
		'--color')				set -- "$@" '-c' ;;
		'--byledcolors')		set -- "$@" '-b' ;;
		'--tencolors')			set -- "$@" '-t' ;;
		'--tencolorsnumber')	set -- "$@" '-u' ;;
		'--backcolor')			set -- "$@" '-k' ;;
		'--brightness')			set -- "$@" '-l' ;;
		'--off')				set -- "$@" '-o' ;;
		'--wait')				set -- "$@" '-w' ;;
		'--nowarn')				set -- "$@" '-n' ;;
		'--ask')				set -- "$@" '-a' ;;
		'--help')				set -- "$@" '-h' ;;
		*)						set -- "$@" "$opt"
	esac
done

while getopts "s:m:d:p:e:q:i:c:b:t:u:k:l:ow:nah" opt; do
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
		q ) length="${OPTARG}"
		;;
		i ) direction="${OPTARG}"
		;;
		c ) color="${OPTARG}"
		;;
		b ) byledcolors="${OPTARG}"
		;;
		t ) tencolors="${OPTARG}"
		;;
		u ) tencolorsnumber="${OPTARG}"
		;;
		k ) backcolor="${OPTARG}"
		;;
		l ) brightness="${OPTARG}"
		;;
		o ) off='true'
		;;
		w ) wait="${OPTARG}"
		;;
		n ) nowarn='true'
		;;
		a ) ask='true'; ask_stored="${ask}"
		;;
		h ) givemehelp; exit 0
		;;
		*) echo -e "\e[1;31m## ERROR\e[0m"; givemehelp; exit 1
	esac
done

initialize

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
	mode='static'
	color='0,0,0'
	brightness='0'
fi

initialize_modes
if [[ -z "${mode}" ]]; then
	mode='list'
fi
if check_mode "${modes} list"; then
	if [[ "${mode}" = 'list' ]]; then
		list_modes
	fi
	if check_mode "${unsupported_modes}"; then
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
