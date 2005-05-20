dnl @synopsis AX_CC_VENDOR
dnl
dnl Determine the vendor of the C compiler, e.g., gnu, intel, ibm,
dnl sun, hp, borland, comeau, dec, cray, kai, lcc, metrowerks, sgi, 
dnl microsoft, watcom, etc.  Returned in $ax_cv_cc_vendor cache variable.

AC_DEFUN([AX_CC_VENDOR],
[
AC_CACHE_CHECK([for C compiler vendor], ax_cv_cc_vendor,
 [ax_cv_cc_vendor=unknown
  # note: don't check for gcc first since some other compilers define __GNUC__
  for ventest in intel:__ICC,__ECC,__INTEL_COMPILER ibm:__xlc__,__xlC__,__IBMC__,__IBMCPP__ gnu:__GNUC__ sun:__SUNPRO_C,__SUNPRO_CC hp:__HP_cc,__HP_aCC dec:__DECC,__DECCXX,__DECC_VER,__DECCXX_VER borland:__BORLANDC__,__TURBOC__ comeau:__COMO__ cray:_CRAYC kai:__KCC lcc:__LCC__ metrowerks:__MWERKS__ sgi:__sgi,sgi microsoft:_MSC_VER watcom:__WATCOMC__ portland:__PGI; do 
    vencpp="defined("`echo $ventest | cut -d: -f2 | sed 's/,/) || defined(/g'`")"
    AC_COMPILE_IFELSE([AC_LANG_PROGRAM(,[
#if $vencpp
  return 1;
#else
  thisisanerror;
#endif
])], [ax_cv_cc_vendor=`echo $ventest | cut -d: -f1`; break])
  done
 ])
])
