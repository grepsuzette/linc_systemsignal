package haxe_signal;

import haxe_signal.SigNum;
import haxe_signal.ExternSignal;

// @:keep class _SignalMapper {
//     static var mapSigNumCb = new Map< Int, Int->Void >>();    // mapping SigNum to its callback
//     static public function nativeCallack(signum:Int) {
//         trace("nativeCallack #" + signum);
        
//         if (cb != null) cb(signum);
//     }

//     public static function setCallback(signum:Int, func:Int->Void) : Void {
//         mapSigNumCb.set(signum, func);
//         // ExternSignal._setHandler
//     }
// }

/**{{{
 * Very minimal implementation of system signals.
 * Note according to `man 2 signal`, the signals 
 * SIGKILL and SIGSTOP cannot be caught or ignored. 
 */
@:keep
@:include('linc_signal.h')
class Signal {

    public static function trap(signum:SigNum) : Void { ExternSignal._trap(signum); } 

    public static function resetDefault(signum:SigNum) : Void { ExternSignal._resetDefault(signum); }

    public static function setHandler(signum:SigNum, cb:SigNum->Void) : Void {
        ExternSignal._setHandler(
            signum, 
            cpp.Function.fromStaticFunction(hablospanol)
            // cb
            
        );
    }

    public static function hablospanol(n:Int) : Void {
        trace("Hablo " + n);
    }

}
// vim: fdm=marker
