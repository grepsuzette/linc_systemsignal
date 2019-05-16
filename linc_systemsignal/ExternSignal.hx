package linc_systemsignal;

import linc_systemsignal.SigNum;
import linc_systemsignal.Sig;

@:keep
@:include('linc_signal.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('signal'))
#end
extern class ExternSignal {

    @:native("linc::ns_signal::_ignore")
    static function _ignore(signum:SigNum) : Void;

    @:native("linc::ns_signal::_reset")
    static function _reset(signum:SigNum) : Void;

    @:native("linc::ns_signal::_on")
    static function _on(signum:SigNum, cb:cpp.Callable<Int->Void>) : Void;
}
