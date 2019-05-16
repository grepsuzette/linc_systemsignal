# linc_signal

Allows C99 system signal trapping (signal.h) right from [Haxe][https://www.haxe.org] (cpp target). 

The library is ridiculously simple right now, as it only has 3 methods:

1. `SystemSignal.ignore(Int)`
2. `SystemSignal.on(Int, Int->Void)`
3. `SystemSignal.reset(Int)`

The other important file is linc_systemsignal.Sig, which contains the signal numbers compiled for the platform. 

Since all signal names begin by "SIG", we chose to call names as follows, note all of those are Integers:

* Sig.KILL is SIGKILL (is usually 9)
* Sig.USR1 is SIGUSR1
* Sig.INT is SIGINT
* Sig.CHLD is SIGCHLD
* et cetera.

## Ignore system signals

For example to prevent CTRL-C, we must ignore SIGINT:

```haxe
import linc_systemsignal.SystemSignal;
import linc_systemsignal.Sig;

class Test {
    static function main() {
        SystemSignal.ignore(Sig.INT);   // ignore SIGINT
        while (true) {
            trace("Sleeping 5 seconds. I can not be quit with Ctrl-C!");
            Sys.sleep(5);
            break;
        }
        trace("Bye!");
    }
}
```

It may be cancelled with `reset()`.

## Set system signal handler

Instead of ignoring a signal, you may handle it using a simple callback:

```haxe
import linc_systemsignal.SystemSignal;
import linc_systemsignal.Sig;

class Test {
    trace("Now, press three (3) times CTRL-C to exit, you have 5 seconds.");
    var nTimes = 0;
    SystemSignal.on(Sig.INT, function(signum:Int) {
        if (++nTimes < 3) {trace(' Ctrl-C pressed $nTimes times...');}
        else {
            trace(" ...And a third time -> Quit!");
            Sys.exit(1);
        }
    });
    Sys.sleep(5);
    trace("Too slow! bye");
    Sys.exit(0);
}
```

Calling this repeatedly for one specific signal will overwrite previous callback each time.
It may be cancelled with `reset()`.

## Resetting

`SystemSignal.reset(Sig.INT);` would restore ability to break using Ctrl-C in the previous example. Calling this restores the OS default behaviour for the specified signal.

Thanks to [Linc][http://snowkit.github.io/linc/]'s author.
