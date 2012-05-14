#include <linux/input.h>

#include "recovery_ui.h"
#include "common.h"
#include "extendedcommands.h"


int device_toggle_display(volatile char* key_pressed, int key_code) {
    return 0;
}

int device_handle_key(int key_code, int visible) {
    if (visible) {
        switch (key_code) {
            case 114:
                return HIGHLIGHT_DOWN;

            case 115:
                return HIGHLIGHT_UP;

            case 102:
                return SELECT_ITEM;
                }
        }

    return NO_ACTION;
}
int device_perform_action(int which) {
    return which;
}

int device_wipe_data() {
    return 0;
}
int device_reboot_now(volatile char* key_pressed, int key_code) {
    // Reboot if the power key is pressed five times in a row, with
    // no other keys in between.
    static int presses = 0;
    if (key_code == 116) { // power button
        ++presses;
        return presses == 5;
    } else {
        presses = 0;
        return 0;
    }
}

int device_recovery_start() {
    return 0;
}


char* MENU_HEADERS[] = { "Use vol keys to highlight and home to select.",
                         "",
                         NULL };

char* MENU_ITEMS[] = { "Reboot system now",
                       "Apply sdcard:update.zip",
                       "Wipe data/factory reset",
                       "Wipe cache partition",
                       "Install zip from sdcard",
                       "Backup and Restore",
                       "Mounts and Storage",
                       "Advanced",
                       "Power Off",
NULL };
			
