#include "stage1.h"

void sigmastrap::startStage1() {
    // this code is VERY unsafe
    // but, the user is USING a cfw, that is extreamly experimental
    // so.....

    // the bootstrap is already inside the ramdisk, we just need to extract it
    ifstream bootstrap_dp("/usr/share/xnucfw/bootstrap-iphoneos-arm64.tar");
    if (!bootstrap_dp) {
        logger::log("bootstrap not found in /usr/share/xnucfw, using /usr/share");
        system("tar --preserve-permissions -xkf /usr/share/bootstrap.tar -C /");
    } else {
        system("tar --preserve-permissions -xkf /usr/share/xnucfw/bootstrap.tar -C /");
    }
}