# linc_systemsignal

Allows C99 system signal trapping (signal.h) right from [Haxe](https://www.haxe.org) (cpp target). 

This Haxe [Linc](http://snowkit.github.io/linc/) library deals with system signals (on most platforms, Linux, OSX, Windows, POSIX-compatible), through 3 simple methods demonstrated below:

1. `SystemSignal.ignore(signum:Int)`
2. `SystemSignal.on(signum:Int, cb:Int->Void)`
3. `SystemSignal.reset(signum:Int)`

## Signal names

They are defined in linc_systemsignal.Sig as such:

* `Sig.TERM` for "SIGTERM" (usually mapped to 15)
* `Sig.USR1` for "SIGUSR1" 
* `Sig.INT` for "SIGINT" (e.g. ctrl-C)
* `Sig.STOP` for "SIGSTOP" (e.g. ctrl-Z)
* `Sig.CHLD` for "SIGCHLD" 
* and so on. Note SIGKILL is useless to map, as the system never sends this signal to the process.

There are no exceptions to this naming scheme.

## Ignore system signals

Suppose user must be prevented from interrupting with CTRL-C. 

This can be achieved by ignoring SIGINT:

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

## Set system signal handler

Sometimes it is not enough to just ignore a signal, callbacks may be used also: 

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

## Resetting

To stop ignoring or specific actions (callback), the OS default handler for a specific signal may be restored using `SystemSignal.reset(<signal_number>);`

## How to install

You just need to `haxelib git` this repo, and target CPP with a `-lib linc_signal`.

Thanks to [Linc](http://snowkit.github.io/linc/).
