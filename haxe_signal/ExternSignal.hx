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
}
