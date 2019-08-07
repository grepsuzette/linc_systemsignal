package linc_systemsignal;

import linc_systemsignal.SigNum;
import linc_systemsignal.ExternSignal;

/**
 * Minimal implementation of ISO C99 system signals.
 * Note according to `man 2 signal`, the signals 
 * SIGKILL and SIGSTOP cannot be caught or ignored. 
 *
 * There are 3 functions which are quite easily exemplified:
 *
 * SystemSignal.ignore(Sig.USR1);        // ignore SIGUSR1 signal
 * SystemSignal.reset(Sig.HUP);         // reset SIGHUP to its default handler
 * SystemSignal.on(Sig.INT, function() { trace("oh, have mercy!"); });  // call cb on SIGINT
 */
@:keep
@:include('linc_signal.h')
class SystemSignal {
    private static var _map = new Map<Int, Int->Void >();

    /**
     * Ignore default handler for specified signal.
     * For instance, `SystemSignal.ignore(Sig.INT)` will prevent Ctrl-C from
     * breaking execution.
     * It can be cancelled with `SystemSignal.reset()`.
     */
    public static function ignore(signum:SigNum) : Void { ExternSignal._ignore(signum); } 

    /**
     * Reset default handler for specified signal.
     * This is usable after `ignore()` as well as after `on()`.
     */
    public static function reset(signum:SigNum) : Void { 
        _map.remove(signum);
        ExternSignal._reset(signum); 
    }

    /**
     * Execute specified callback upon specified signal.
     * It can be cancelled with `SystemSignal.reset()`.
     * @note Calling this repeatedly for one specific signal will overwrite previous
     * callback each time.
     */
    public static function on(signum:SigNum, cb:SigNum->Void) : Void {
        _map.set(signum, cb);
        ExternSignal._on( signum, cpp.Function.fromStaticFunction(_onsignal) );
    }


    static function _onsignal(n:Int) : Void {
        if (_map != null && _map.exists(n)) _map[n](n);
    }

}
// vim: fdm=marker
