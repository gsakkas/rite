/***********************************************************************/
/*                                                                     */
/*                           Objective Caml                            */
/*                                                                     */
/*            Xavier Leroy, projet Cristal, INRIA Rocquencourt         */
/*                                                                     */
/*  Copyright 2004 Institut National de Recherche en Informatique et   */
/*  en Automatique.  All rights reserved.  This file is distributed    */
/*  under the terms of the GNU Library General Public License, with    */
/*  the special exception on linking described in file ../LICENSE.     */
/*                                                                     */
/***********************************************************************/

/* $Id: signals_osdep.h,v 1.8.4.5 2007/11/26 16:58:51 doligez Exp $ */

/* Processor- and OS-dependent signal interface */

/****************** Alpha, all OS */

#if defined(TARGET_alpha)

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig, int code, struct sigcontext * context)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_handler = (void (*)(int)) (name); \
     sigact.sa_flags = 0

  typedef long context_reg;
  #define CONTEXT_PC (context->sc_pc)
  #define CONTEXT_EXCEPTION_POINTER (context->sc_regs[15])
  #define CONTEXT_YOUNG_LIMIT (context->sc_regs[13])
  #define CONTEXT_YOUNG_PTR (context->sc_regs[14])

/****************** AMD64, Linux */

#elif defined(TARGET_amd64) && defined (SYS_linux)

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig, siginfo_t * info, ucontext_t * context)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_sigaction = (void (*)(int,siginfo_t *,void *)) (name); \
     sigact.sa_flags = SA_SIGINFO

  typedef greg_t context_reg;
  #define CONTEXT_PC (context->uc_mcontext.gregs[REG_RIP])
  #define CONTEXT_EXCEPTION_POINTER (context->uc_mcontext.gregs[REG_R14])
  #define CONTEXT_YOUNG_PTR (context->uc_mcontext.gregs[REG_R15])
  #define CONTEXT_FAULTING_ADDRESS ((char *) context->uc_mcontext.gregs[REG_CR2])

/****************** I386, Linux */

#elif defined(TARGET_i386) && defined(SYS_linux_elf)

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig, struct sigcontext context)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_handler = (void (*)(int)) (name); \
     sigact.sa_flags = 0

  #define CONTEXT_FAULTING_ADDRESS ((char *) context.cr2)

/****************** I386, BSD */

#elif defined(TARGET_i386) && defined(SYS_bsd)

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig, siginfo_t * info, void * context)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_sigaction = (name); \
     sigact.sa_flags = SA_SIGINFO

  #define CONTEXT_FAULTING_ADDRESS ((char *) info->si_addr)

/****************** I386, MacOS X */

#elif defined(TARGET_i386) && defined(SYS_macosx)

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig, siginfo_t * info, void * context)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_sigaction = (name); \
     sigact.sa_flags = SA_SIGINFO

  #include <sys/ucontext.h>
  #include <AvailabilityMacros.h>

#if !defined(MAC_OS_X_VERSION_10_5) || MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_X_VERSION_10_5
    #define CONTEXT_REG(r) r
  #else
    #define CONTEXT_REG(r) __##r
  #endif

  #define CONTEXT_STATE (((ucontext_t *)context)->uc_mcontext->CONTEXT_REG(ss))
  #define CONTEXT_PC (CONTEXT_STATE.CONTEXT_REG(eip))
  #define CONTEXT_FAULTING_ADDRESS ((char *) info->si_addr)

/****************** MIPS, all OS */

#elif defined(TARGET_mips)

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig, int code, struct sigcontext * context)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_handler = (void (*)(int)) (name); \
     sigact.sa_flags = 0

  typedef int context_reg;
  #define CONTEXT_PC (context->sc_pc)
  #define CONTEXT_EXCEPTION_POINTER (context->sc_regs[30])
  #define CONTEXT_YOUNG_LIMIT (context->sc_regs[22])
  #define CONTEXT_YOUNG_PTR (context->sc_regs[23])

/****************** PowerPC, MacOS X */

#elif defined(TARGET_power) && defined(SYS_rhapsody)

  #define DECLARE_SIGNAL_HANDLER(name) \
     static void name(int sig, siginfo_t * info, void * context)

  #include <sys/ucontext.h>
  #include <AvailabilityMacros.h>  

  #ifdef __LP64__
    #define SET_SIGACT(sigact,name) \
       sigact.sa_sigaction = (name); \
       sigact.sa_flags = SA_SIGINFO | SA_64REGSET
    
    typedef unsigned long long context_reg;
    
    #define CONTEXT_MCONTEXT (((ucontext64_t *)context)->uc_mcontext64)
  #else
    #define SET_SIGACT(sigact,name) \
       sigact.sa_sigaction = (name); \
       sigact.sa_flags = SA_SIGINFO
    
    typedef unsigned long context_reg;
    
    #define CONTEXT_MCONTEXT (((ucontext_t *)context)->uc_mcontext)
  #endif
  
#if !defined(MAC_OS_X_VERSION_10_5) || MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_X_VERSION_10_5
    #define CONTEXT_REG(r) r
  #else
    #define CONTEXT_REG(r) __##r
  #endif

  #define CONTEXT_STATE (CONTEXT_MCONTEXT->CONTEXT_REG(ss))
  #define CONTEXT_PC (CONTEXT_STATE.CONTEXT_REG(srr0))
  #define CONTEXT_EXCEPTION_POINTER (CONTEXT_STATE.CONTEXT_REG(r29))
  #define CONTEXT_YOUNG_LIMIT (CONTEXT_STATE.CONTEXT_REG(r30))
  #define CONTEXT_YOUNG_PTR (CONTEXT_STATE.CONTEXT_REG(r31))
  #define CONTEXT_SP (CONTEXT_STATE.CONTEXT_REG(r1))
  #define CONTEXT_FAULTING_ADDRESS ((char *) info->si_addr)

/****************** PowerPC, ELF (Linux) */

#elif defined(TARGET_power) && defined(SYS_elf)

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig, struct sigcontext * context)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_handler = (void (*)(int)) (name); \
     sigact.sa_flags = 0

  typedef unsigned long context_reg;
  #define CONTEXT_PC (context->regs->nip)
  #define CONTEXT_EXCEPTION_POINTER (context->regs->gpr[29])
  #define CONTEXT_YOUNG_LIMIT (context->regs->gpr[30])
  #define CONTEXT_YOUNG_PTR (context->regs->gpr[31])

/****************** PowerPC, BSD */

#elif defined(TARGET_power) && defined(SYS_bsd)

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig, int code, struct sigcontext * context)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_handler = (void (*)(int)) (name); \
     sigact.sa_flags = 0

  typedef unsigned long context_reg;
  #define CONTEXT_EXCEPTION_POINTER (context->sc_frame.fixreg[29])
  #define CONTEXT_YOUNG_LIMIT (context->sc_frame.fixreg[30])
  #define CONTEXT_YOUNG_PTR (context->sc_frame.fixreg[31])

/****************** SPARC, Solaris */

#elif defined(TARGET_sparc) && defined(SYS_solaris)

  #include <ucontext.h>

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig, siginfo_t * info, ucontext_t * context)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_sigaction = (void (*)(int,siginfo_t *,void *)) (name); \
     sigact.sa_flags = SA_SIGINFO

  typedef long context_reg;
  #define CONTEXT_PC (context->uc_mcontext.gregs[REG_PC])
    /* Local register number N is saved on the stack N words
       after the stack pointer */
  #define SPARC_L_REG(n) ((long *)(context->uc_mcontext.gregs[REG_SP]))[n]
  #define CONTEXT_EXCEPTION_POINTER (SPARC_L_REG(5))
  #define CONTEXT_YOUNG_LIMIT (SPARC_L_REG(7))
  #define CONTEXT_YOUNG_PTR (SPARC_L_REG(6))

/******************** Default */

#else

  #define DECLARE_SIGNAL_HANDLER(name) \
    static void name(int sig)

  #define SET_SIGACT(sigact,name) \
     sigact.sa_handler = (name); \
     sigact.sa_flags = 0

#endif
