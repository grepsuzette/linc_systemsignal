package linc_systemsignal;

import linc_systemsignal.SigNum;

/**
 * Defined in signal.h.
 * To use: Sig.KILL  (compiling to e.g. 9.)
 */
@:include("signal.h")
extern class Sig {

    @:native("SIG_ERR"   ) public static var _ERR   : SigNum;   // special: error
    @:native("SIG_DFL"   ) public static var _DFL   : SigNum;   // special: default handler
    @:native("SIG_IGN"   ) public static var _IGN   : SigNum;   // special: ignore
    @:native("SIG_HOLD"  ) public static var _HOLD  : SigNum;   // special
    @:native("SIGINT"    ) public static var INT    : SigNum;
    @:native("SIGILL"    ) public static var ILL    : SigNum;
    @:native("SIGABRT"   ) public static var ABRT   : SigNum;
    @:native("SIGFPE"    ) public static var FPE    : SigNum;
    @:native("SIGSEGV"   ) public static var SEGV   : SigNum;
    @:native("SIGTERM"   ) public static var TERM   : SigNum;
    @:native("SIGHUP"    ) public static var HUP    : SigNum;
    @:native("SIGQUIT"   ) public static var QUIT   : SigNum;
    @:native("SIGTRAP"   ) public static var TRAP   : SigNum;
    @:native("SIGKILL"   ) public static var KILL   : SigNum;
    @:native("SIGPIPE"   ) public static var PIPE   : SigNum;
    @:native("SIGALRM"   ) public static var ALRM   : SigNum;
    @:native("SIGTTIN"   ) public static var TTIN   : SigNum;
    @:native("SIGTTOU"   ) public static var TTOU   : SigNum;
    @:native("SIGXCPU"   ) public static var XCPU   : SigNum;
    @:native("SIGXFSZ"   ) public static var XFSZ   : SigNum;
    @:native("SIGVTALRM" ) public static var VTALRM : SigNum;
    @:native("SIGPROF"   ) public static var PROF   : SigNum;
    @:native("SIGWINCH"  ) public static var WINCH  : SigNum;
    @:native("SIGRTMIN"  ) public static var RTMIN  : SigNum;
    @:native("SIGSTKFLT" ) public static var STKFLT : SigNum;
    @:native("SIGPWR"    ) public static var PWR    : SigNum;
    @:native("SIGBUS"    ) public static var BUS    : SigNum;
    @:native("SIGUSR1"   ) public static var USR1   : SigNum;
    @:native("SIGUSR2"   ) public static var USR2   : SigNum;
    @:native("SIGCHLD"   ) public static var CHLD   : SigNum;
    @:native("SIGCONT"   ) public static var CONT   : SigNum;
    @:native("SIGSTOP"   ) public static var STOP   : SigNum;
    @:native("SIGTSTP"   ) public static var TSTP   : SigNum;
    @:native("SIGURG"    ) public static var URG    : SigNum;
    @:native("SIGPOLL"   ) public static var POLL   : SigNum;
    @:native("SIGSYS"    ) public static var SYS    : SigNum;
    @:native("SIGRTMAX"  ) public static var RTMAX  : SigNum;
    @:native("_NSIG"     ) public static var _NSIG  : SigNum;   // number of signals

}
