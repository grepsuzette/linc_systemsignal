# linc_signal

Allow system signal trapping (signal.h) from [Haxe][https://www.haxe.org] (cpp target). 

Example:

```haxe
import haxe_signal.Signal;
import haxe_signal.Sig;

class Test {
    static function main() {
        Signal.trap(Sig.INT);   // ignore SIGINT
        while (true) {
            trace("Sleeping 5 seconds. I can not be quit with Ctrl-C!");
            Sys.sleep(5);
            break;
        }
        trace("Bye!");
    }
}
```

For this very early version you can just ignore signals (which we call `trap()`).  It is not yet possible to define a handler.

Thanks to [Linc][http://snowkit.github.io/linc/]'s author.
