#include "logger.h"

void logger::log(string dat) {
    cout << "[sigmaStrap] (" << __FILE__ << ") " << dat << endl;
}