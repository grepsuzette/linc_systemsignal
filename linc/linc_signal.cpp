//hxcpp include should be first
#include <hxcpp.h>
#include "./linc_signal.h"

namespace linc {

    namespace ns_signal {

        void _ignore(int sig) {
            ::signal(sig, SIG_IGN);
        }

        void _reset(int sig) {
            ::signal(sig, SIG_DFL);
        }

        void _on(int sig, void (*handler)(int)) {
            ::signal(sig, handler);
        }
    } 

} //linc
