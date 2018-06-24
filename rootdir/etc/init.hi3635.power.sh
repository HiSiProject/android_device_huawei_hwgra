#i keep it in memory but we don't have /system/bin/init.hi3635.power.sh actually
#!/system/bin/sh
#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export PATH=/system/bin

for ddrfreq_gov in /sys/class/devfreq/ddrfreq/governor
do
	echo "interactive" > $ddrfreq_gov
done

for ddrfreq_up_threshold_gov in /sys/class/devfreq/ddrfreq_up_threshold/governor
do
	echo "interactive" > $ddrfreq_up_threshold_gov
done

for gpufreq_gov in /sys/class/devfreq/gpufreq/governor
do
        echo "interactive" > $gpufreq_gov
done
