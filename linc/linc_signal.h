#pragma once

//hxcpp include should always be first    
#ifndef HXCPP_H
#include <hxcpp.h>
#endif

//include other library includes as needed
// #include "../lib/____"
#include <signal.h>

namespace linc {

    namespace ns_signal {
        void _trap(int sig);
        void _resetDefault(int sig);
        void _setHandler(int sig, void (*handler)(int));
    }

} //linc
