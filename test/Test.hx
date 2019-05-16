import haxe_signal.Signal;
import haxe_signal.SigNum;
import haxe_signal.Sig;

class Test {
    static function main() {
        trace(Sig.INT);
        // Signal.trap(Sig.INT);
        Signal.setHandler(Sig.INT, function(n:Int) { trace("Anything"); });
        while (true) {
            trace("Sleeping 5 seconds. I can not be quit with Ctrl-C");
            Sys.sleep(5);
            break;
        }
        trace("Bye!");
    }
}
