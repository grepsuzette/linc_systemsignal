package linc_systemsignal;

/**
 * Unused as of now. Maybe useful one day...
 * See help in `man sigaction`, search for `sa_flags`.
 */
#if false
enum SigFlag {
       
    NoChildStop;  // SA_NOCLDSTOP  Do not generate SIGCHLD when  children  stop  or  stopped children continue.
    OnStack;      // SA_ONSTACK If   set  and  an alternate signal stack has been declared with sigaltstack(), the signal shall be delivered to  the calling  process  on  that  stack.  Otherwise, the signal shall be delivered on the current stack.
    ResetHand;    // SA_RESETHAND If set, the disposition of the signal shall be  reset  to SIG_DFL and the SA_SIGINFO flag shall be cleared on entry to the signal handler.
    Restart;      // SA_RESTART This flag affects the  behavior  of  interruptible	 func‐ tions; that is, those specified to fail with errno set to [EINTR].  
    SigInfo;      // SA_SIGINFO    If cleared and the signal is caught, the  signal-catching function shall be entered as: void func(int signo); where  signo  is the only argument to the signal-catching function. In this case, the  application  shall  use  the sa_handler	 member	 to describe the signal-catching func‐ tion and the application shall not modify	the  sa_sigac‐ tion member.
    NoChildWait;  // SA_NOCLDWAIT  If	 set,  and  sig equals SIGCHLD, child processes of the calling processes shall not be  transformed  into	zombie processes	when  they  terminate.	If the calling process subsequently waits for its children, and the process  has no	 unwaited-for children that were transformed into zom‐ bie processes, it shall block until all of	 its  children terminate, and wait(), waitid(), and waitpid() shall fail and set errno to [ECHILD].	 Otherwise, terminating	 child processes shall be transformed into zombie processes, un‐ less SIGCHLD is set to SIG_IGN.
    NoDefer;      // SA_NODEFER    If set and sig is caught, sig shall not be added  to  the thread's  signal  mask on entry to the signal handler un‐ less it is included in sa_mask.  Otherwise, sig shall al‐ ways be added to the thread's signal mask on entry to the signal handler.
}
#end
