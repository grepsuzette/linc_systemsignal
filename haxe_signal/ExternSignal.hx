package haxe_signal;

import haxe_signal.SigNum;
import haxe_signal.Sig;

@:keep
@:include('linc_signal.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('signal'))
#end
extern class ExternSignal {

    @:native("linc::ns_signal::_trap")
    static function _trap(signum:SigNum) : Void;

    @:native("linc::ns_signal::_resetDefault")
    static function _resetDefault(signum:SigNum) : Void;

    @:native("linc::ns_signal::_setHandler")
    static function _setHandler(signum:SigNum, cb:cpp.Callable<Int->Void>) : Void;
}
