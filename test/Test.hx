import haxe_signal.Signal;
import haxe_signal.SigNum;
import haxe_signal.Sig;

class Test {
    static function main() {
        trace(Sig.INT);
        Signal.trap(Sig.INT);
        while (true) {
            trace("Sleeping 5 seconds. I can not be quit with Ctrl-C");
            Sys.sleep(5);
            break;
        }
        trace("Bye!");
    }
}
