/*
 * Copyright (C) 2016 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "HI3635 PowerHAL"

#define STATE_ON "state=1"

#define KERNEL_HMP_PATH "/sys/kernel/hmp/"
#define DDRFREQ__PATH "/sys/devices/ddrfreq/devfreq/ddrfreq/"
#define GPUFREQ_PATH "/sys/devices/e8600000.mali/devfreq/gpufreq/"
#define GPU_ONDEMAND_PATH "/sys/devices/e8600000.mali/devfreq/gpufreq/mali_ondemand/"

#define CPUFREQ_PATH0 "/sys/devices/system/cpu/cpu0/cpufreq/"
#define CPUFREQ_PATH1 "/sys/devices/system/cpu/cpu4/cpufreq/"

#define INTERACTIVE_PATH0 "/sys/devices/system/cpu/cpu0/cpufreq/interactive/"
#define INTERACTIVE_PATH1 "/sys/devices/system/cpu/cpu4/cpufreq/interactive/"

#define TAP_TO_WAKE_NODE "/sys/touchscreen/easy_wakeup_gesture"
#define TAP_TO_WAKE_ENABLE "/sys/touchscreen/wakeup_gesture_enable"

#define VID_ENC_TIMER_RATE 30000
#define VID_ENC_IO_IS_BUSY 0

enum {
    PROFILE_POWER_SAVE = 0,
    PROFILE_BALANCED,
    PROFILE_HIGH_PERFORMANCE,
    PROFILE_MAX
};

typedef struct interactive_governor_settings {
    int scaling_max_freq;
    int scaling_min_freq;
    int boost_hmp;
    int boostpulse_duration;
    int go_hispeed_load;
    int hispeed_freq;
    int io_is_busy;
    int min_sample_time;
    char *target_loads;
    int timer_rate;
    int timer_slack;
} power_profile_cpu;

typedef struct other_settings {
    int hmp_down;
    int hmp_prio;
    int hmp_up;
    unsigned long ddr_max_freq;
    unsigned long ddr_min_freq;
    int ddr_polling_interval;
    unsigned long gpu_max_freq;
    unsigned long gpu_min_freq;
    int gpu_polling_interval;
    int animation_boost;
    unsigned long animation_boost_freq;
} power_profile_other;

static power_profile_cpu profiles0[PROFILE_MAX] = {
    [PROFILE_POWER_SAVE] = {
        .scaling_max_freq = 1017600,
        .scaling_min_freq = 403200,
        .boost_hmp = 0,
        .boostpulse_duration = 40000,
        .go_hispeed_load = 99,
        .hispeed_freq = 806400,
        .io_is_busy = 0,
        .min_sample_time = 100000,
        .target_loads = "80",
        .timer_rate = 30000,
        .timer_slack = 40000,
    },
    [PROFILE_BALANCED] = {
        .scaling_max_freq = 1516800,
        .scaling_min_freq = 403200,
        .boost_hmp = 1,
        .boostpulse_duration = 40000,
        .go_hispeed_load = 80,
        .hispeed_freq = 1017600,
        .io_is_busy = 1,
        .min_sample_time = 300000,
        .target_loads = "20 403200:30 806400:50 1017600:60 1209600:70",
        .timer_rate = 30000,
        .timer_slack = 40000,
    },
    [PROFILE_HIGH_PERFORMANCE] = {
        .scaling_max_freq = 1516800,
        .scaling_min_freq = 403200,
        .boost_hmp = 1,
        .boostpulse_duration = 80000,
        .go_hispeed_load = 60,
        .hispeed_freq = 1209600,
        .io_is_busy = 1,
        .min_sample_time = 300000,
        .target_loads = "20 403200:30 806400:50 1017600:60 1209600:70",
        .timer_rate = 30000,
        .timer_slack = 40000,
    },
};

static power_profile_cpu profiles1[PROFILE_MAX] = {
    [PROFILE_POWER_SAVE] = {
        .scaling_max_freq = 1209600,
        .scaling_min_freq = 1017600,
        .boost_hmp = 0,
        .boostpulse_duration = 40000,
    	.go_hispeed_load = 99,
    	.hispeed_freq = 1209600,
        .io_is_busy = 0,
        .min_sample_time = 100000,
        .target_loads = "80",
        .timer_rate = 40000,
        .timer_slack = 50000,
    },
    [PROFILE_BALANCED] = {
        .scaling_max_freq = 2016000,
        .scaling_min_freq = 1017600,
        .boost_hmp = 1,
        .boostpulse_duration = 40000,
        .go_hispeed_load = 80,
    	.hispeed_freq = 1401600,
        .io_is_busy = 1,
        .min_sample_time = 300000,
        .target_loads = "75",
        .timer_rate = 40000,
        .timer_slack = 50000,
    },
    [PROFILE_HIGH_PERFORMANCE] = {
        .scaling_max_freq = 2016000,
        .scaling_min_freq = 1017600,
        .boost_hmp = 1,
        .boostpulse_duration = 80000,
        .go_hispeed_load = 60,
    	.hispeed_freq = 1612800,
        .io_is_busy = 1,
        .min_sample_time = 300000,
        .target_loads = "70",
        .timer_rate = 40000,
        .timer_slack = 50000,
    },
};

static power_profile_other profiles2[PROFILE_MAX] = {
    [PROFILE_POWER_SAVE] = {
        .hmp_down = 768,
        .hmp_prio = 140,
        .hmp_up = 1008,
        .ddr_max_freq = 400000000,
        .ddr_min_freq = 120000000,
        .ddr_polling_interval = 20,
        .gpu_max_freq = 360000000,
        .gpu_min_freq = 288000000,
        .gpu_polling_interval = 20,
        .animation_boost = 0,
        .animation_boost_freq = 360000000,
    },
    [PROFILE_BALANCED] = {
        .hmp_down = 672,
        .hmp_prio = 140,
        .hmp_up = 978,
        .ddr_max_freq = 800000000,
        .ddr_min_freq = 120000000,
        .ddr_polling_interval = 40,
        .gpu_max_freq = 600000000,
        .gpu_min_freq = 288000000,
        .gpu_polling_interval = 40,
        .animation_boost = 1,
        .animation_boost_freq = 600000000,
    },
    [PROFILE_HIGH_PERFORMANCE] = {
        .hmp_down = 200,
        .hmp_prio = 140,
        .hmp_up = 500,
        .ddr_max_freq = 800000000,
        .ddr_min_freq = 120000000,
        .ddr_polling_interval = 50,
        .gpu_max_freq = 680000000,
        .gpu_min_freq = 288000000,
        .gpu_polling_interval = 50,
        .animation_boost = 1,
        .animation_boost_freq = 680000000,
    },
};
