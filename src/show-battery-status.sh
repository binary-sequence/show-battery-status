#!/bin/bash

# This file is part of 'show-battery-status'.
#
# Copyright 2012-2020 Sergio Lindo <sergiolindo.empresa@gmail.com>
#
# 'show-battery-status' is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# 'show-battery-status' is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
# You should have received a copy of the GNU General Public License along with
# 'show-battery-status'. If not, see <http://www.gnu.org/licenses/>.

batteryFile='/org/freedesktop/UPower/devices/battery_BAT0'

if [ ! -f /sys/class/power_supply/BAT0/uevent ]; then
  echo "n/d"
  exit 1
fi

state=`upower -i $batteryFile | grep "state" | sed 's/ //g' |  cut -d: -f2`
percentage=`upower -i $batteryFile | grep "percentage" | sed 's/ //g' | cut -d: -f2`
timeTo=`upower -i $batteryFile | grep "time to" | sed 's/ //g; s/,[0-9]*//; s/minutes/min/' | cut -d: -f2`

echo "($percentage) $state: $timeTo"
