#!/bin/sh

LED_RED=140
LED_BLUE=10
GPIO_PATH=/sys/class/gpio

led_ctl()
{
	local led=$1
	local ctl=$2

	if ! [ -d $GPIO_PATH/gpio$led ]; then
		echo $led > $GPIO_PATH/export
	fi

	echo "out" > $GPIO_PATH/gpio$led/direction
	echo $ctl > $GPIO_PATH/gpio$led/value
}

led_ctl $LED_RED 1
led_ctl $LED_BLUE 0
