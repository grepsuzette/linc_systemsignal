# linc_signal

Allows system signal trapping (signal.h) right from [Haxe](https://www.haxe.org) (cpp target). 

This Haxe [Linc](http://snowkit.github.io/linc/) library deals with system signals (on most platforms, Linux, OSX, Windows, POSIX-compatible), through 3 simple methods demonstrated below:

1. `SystemSignal.ignore(signum:Int)`
2. `SystemSignal.on(signum:Int, cb:Int->Void)`
3. `SystemSignal.reset(signum:Int)`

## Signal names

They are defined in linc_systemsignal.Sig as such:

* "SIGKILL" is Sig.KILL (usually maps to 9)
* "SIGUSR1" is Sig.USR1
* "SIGINT" is Sig.INT
* "SIGCHLD" is Sig.CHLD
* and so on (there is no exception to this naming scheme).

## Ignore system signals

Suppose we need to prevent the user from interrupting the program using CTRL-C. We must therefore inhibit SIGINT:

```haxe
import linc_systemsignal.SystemSignal;
import linc_systemsignal.Sig;

class Test {
    static function main() {
        SystemSignal.ignore(Sig.INT);   // inhibit SIGINT
        while (true) {
            trace("Sleeping 5 seconds. I can not be quit with Ctrl-C!");
            Sys.sleep(5);
            break;
        }
        trace("Bye!");
    }
}
```

`ignore()` may be cancelled with `reset()`, which will reset default system implementation for this signal.

## Set system signal handler

Sometimes it is not enough to just ignore a signal, we may need a *specific action*, i.e. a callback as here: 

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
It may be cancelled again with `reset()`.

## Resetting

`SystemSignal.reset(Sig.INT);` would restore ability to break using Ctrl-C in the two previous examples. Calling this restores the OS default behaviour for the specified signal.

## How to install

You just need to `haxelib git` this library, and target CPP with a `-lib linc_signal`.

Thanks to [Linc](http://snowkit.github.io/linc/).
