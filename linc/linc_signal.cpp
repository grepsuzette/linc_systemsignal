//hxcpp include should be first
#include <hxcpp.h>
#include "./linc_signal.h"

namespace linc {

    namespace ns_signal {

        void _trap(int sig) {
            ::signal(sig, SIG_IGN);
        }

        void _resetDefault(int sig) {
            ::signal(sig, SIG_DFL);
        }

        void _setHandler(int sig, void (*handler)(int)) {
            ::signal(sig, handler);
        }
    } 

} //linc
