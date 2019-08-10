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

        // TODO as of August 09, 2019 
        /* to avoid "Critical Error: Allocating from a GC-free thread" errors */
        /* void _secure_on_callback(int nsig, void (*handler)(int)) { */
            
        /* } */

        void _on(int sig, void (*handler)(int)) {
            // closure
            /* auto f = [](int nsig) -> void { */
            /* }; */
            /* ::signal(sig, _secure_on_callback(sig, handler)); */
            ::signal(sig, handler);
        }
    } 

} //linc
