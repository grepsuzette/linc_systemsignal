import linc_systemsignal.SystemSignal;
import linc_systemsignal.SigNum;
import linc_systemsignal.Sig;

class Test {
    static function main() {

        trace(Sig.INT);     // SIGINT is usually 2 
        // ----------------------------------------------------------------------------
        SystemSignal.on(Sig.INT, function(signum:Int) { trace('SIGINT ($signum) received'); });     
        trace("Sleeping 5 seconds. I can not be quit with Ctrl-C");
        Sys.sleep(5);
        // ----------------------------------------------------------------------------
        trace("Test 2. Now, press three (3) times CTRL-C to exit, you have 5 seconds.");
        var nTimes = 0;
        SystemSignal.on(Sig.INT, function(signum:Int) {
            if (++nTimes < 3) {trace(' Ctrl-C pressed $nTimes times...');}
            else {
                trace(" ...And a third time -> Quit!");
                Sys.exit(1);
            }
        });
        Sys.sleep(5);
        // ----------------------------------------------------------------------------
        SystemSignal.reset(Sig.INT);
        trace("Now I will reset the SIGINT handler, Ctrl+C should work. You have 3 seconds..");
        Sys.sleep(3);
        // ----------------------------------------------------------------------------
        trace("Too slow! Okay bye");
    }

}
