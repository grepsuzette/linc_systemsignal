package haxe_signal;

import haxe_signal.SigNum;
import haxe_signal.ExternSignal;

/**
 * Very minimal implementation of system signals.
 */
@:keep
@:include('linc_signal.h')
class Signal {

    /**
     * Trap some signal (ignoring it).
     * There is no way to restore the original handler as of now
     * (it can be implemented but it's a lot of work).
     */
    public static function trap(signum:SigNum) : Void {
        ExternSignal._trap(signum); 

    } 

    /**
     * Trap some signals (ignoring them).
     */
    public inline static function trapSignals(aSignum:Array<SigNum>) : Void {
        if (aSignum != null) for (n in aSignum) trap(n);
    } 

    /** {{{2 [ unimplemented ]
     * sigaction — examine and change a signal action.
     * The sigaction() function allows the calling process to  examine	and/or
     * specify	the  action to be associated with a specific signal. The argu‐
     * ment sig specifies the signal; acceptable values are defined  in	 <sig‐
     * nal.h>.
     * The structure sigaction, used to describe an action to be taken, is de‐
     * fined in the <signal.h> header to include at least the  following  mem‐
     * bers:
     *┌────────────────┬───────────────┬───────────────────────────────────────┐
     *│	 Member Type   │ Member Name   │	     Description	               │
     *├────────────────┼───────────────┼───────────────────────────────────────┤
     *│void(*) (int)   │ sa_handler    │Pointer to a signal-catching function  │
     *│		           │	           │or one of the macros SIG_IGN or	       │
     *│		           │	           │SIG_DFL.			                   │
     *│sigset_t	       │ sa_mask       │Additional set of signals to be	       │
     *│		           │	           │blocked during execution of signal-    │
     *│		           │	           │catching function.		               │
     *│int	           │ sa_flags      │Special flags to affect behavior of    │
     *│		           │	           │signal.				                   │
     *│void(*) (int,   │ sa_sigaction  │Pointer to a signal-catching function. │
     *│	 siginfo_t *,  │	           │				                       │
     *│void *)	       │	           │				                       │
     *└────────────────┴───────────────┴───────────────────────────────────────┘
     *
     * @param (SigNum) E.g. SIGKILL
     * @param (SigAction act) if not null, this is the action to be associated
     * with the specified signum. 
     *      If null, signal handling is unchanged (i.e. it's a mere enquiry).
     * @param (SigAction oact) if not null, the original action is stored to
     * oact. 
     * The SIGKILL and SIGSTOP signals shall  not  be
     * added  to  the signal mask using this mechanism; this restriction shall
     * be enforced by the system without causing an error to be indicated.
     *
     * If the SA_SIGINFO flag (see SigFlag) is cleared in the sa_flags field  of
     * the  sigaction structure, the sa_handler field identifies the action to
     * be associated with the specified signal.	 If the SA_SIGINFO flag is set
     * in the sa_flags field, the sa_sigaction field specifies a signal-catch‐
     * ing function.
     * @return (Bool) Success
     * }}}
     */
    // public static function sigaction(signum:SigNum, act:SigAction, oact:SigAction) : Bool {}

}
// vim: fdm=marker
