#include "stage1.h"

void sigmastrap::startStage1() {
    // this code is VERY unsafe
    // but, the user is USING a cfw, that is extreamly experimental
    // so.....

    // the bootstrap is already inside the ramdisk, we just need to extract it
    ifstream bootstrap_dp("/usr/share/xnucfw/bootstrap.tar");
    string bootstrapPath = "/usr/share/xnucfw/bootstrap.tar";
    if (!bootstrap_dp) {
        logger::log("(WARN) bootstrap not found in /usr/share/xnucfw, using /usr/share");
        bootstrapPath = "/usr/share/bootstrap.tar";
    }

    logger::log("extracting bootstrap.....");
    string extractCmd = "tar --preserve-permissions -xkf " + bootstrapPath + " -C /";
    system(extractCmd.c_str());

    logger::log("stage 1 complete!");
}