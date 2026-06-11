#!/bin/sh

#==========================================================================
# pwmfan.sh - Collectd Exec plugin script to read PWM fan speed
# and report it to collectd.
# This script is used to read the PWM fan speed and report it to collectd.
# It reads the PWM value from the specified sysfs path, converts it to RPM,
# and sends the data to collectd using the PUTVAL command.
#==========================================================================

# Set the hostname and interval for data collection
HOSTNAME="${COLLECTD_HOSTNAME:-$(uname -n)}"
INTERVAL=1
MAX_RPM=5500

# Main loop to read the PWM value and report it to collectd
while sleep "$INTERVAL"; do
    # Read the raw PWM value from the sysfs path
    RAW=$(cat /sys/class/hwmon/hwmon2/pwm1)
    # Convert the raw PWM value to RPM (assuming a linear relationship)
    RPM=$(( RAW * MAX_RPM / 255 ))
    # Send the RPM value to collectd using the PUTVAL command
    echo "PUTVAL \"$HOSTNAME/exec-pwmfan/fanspeed-fan1\" interval=$INTERVAL N:$RPM"
done
