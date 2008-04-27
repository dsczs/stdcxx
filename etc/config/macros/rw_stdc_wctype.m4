#
# Licensed to the Apache Software  Foundation (ASF) under one or more
# contributor  license agreements.  See  the NOTICE  file distributed
# with  this  work  for  additional information  regarding  copyright
# ownership.   The ASF  licenses this  file to  you under  the Apache
# License, Version  2.0 (the  License); you may  not use  this file
# except in  compliance with the License.   You may obtain  a copy of
# the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the  License is distributed on an  "AS IS" BASIS,
# WITHOUT  WARRANTIES OR CONDITIONS  OF ANY  KIND, either  express or
# implied.   See  the License  for  the  specific language  governing
# permissions and limitations under the License.
#
# Copyright 1999-2008 Rogue Wave Software, Inc.
#

# RW_STDC_WCTYPE
# -------------
# Performs all standard C library config checks for <wctype.h> header.
AC_DEFUN([RW_STDC_WCTYPE],
[
  AC_CHECK_HEADER([wctype.h],
  [
    AC_PATH_HEADER([_RWSTD_ANSI_C_WCTYPE_H], [wctype.h])

    AC_CHECK_TYPE([wctype_t],
                  [AC_CHECK_TYPEOF([wctype_t], [_RWSTD_WCTYPE_T],
                                   [@%:@include <wctype.h>])],
                  [AC_DEFINE([_RWSTD_NO_WCTYPE_T], [1],
[Define if 1 if <wctype.h> header does not define `wctype_t' type.])],
                  [@%:@include <wctype.h>])

    AC_CHECK_TYPE([wctrans_t],
                  [AC_CHECK_TYPEOF([wctrans_t], [_RWSTD_WCTRANS_T],
                                   [@%:@include <wctype.h>])],
                  [AC_DEFINE([_RWSTD_NO_WCTRANS_T], [1],
[Define if 1 if <wctype.h> header does not define `wctrans_t' type.])],
                  [@%:@include <wctype.h>])

    RW_CHECK_FUNCS([iswalnum iswalpha iswblank iswcntrl iswctype \
iswdigit iswgraph iswlower iswprint iswpunct iswspace iswupper iswxdigit \
towctrans towlower towupper wctrans wctype])
  ], [
    AC_DEFINE([_RWSTD_NO_WCTYPE_H], [1],
[Define to 1 if you don't have the <wctype.h> header file.])
  ])
])# RW_STDC_WCTYPE

