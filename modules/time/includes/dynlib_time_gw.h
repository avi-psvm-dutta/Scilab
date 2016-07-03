/*
 *  Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 *  Copyright (C) 2010-2010 - DIGITEO - Bruno JOFRET
 *
 * Copyright (C) 2012 - 2016 - Scilab Enterprises
 *
 * This file is hereby licensed under the terms of the GNU GPL v2.0,
 * pursuant to article 5.3.4 of the CeCILL v.2.1.
 * This file was originally licensed under the terms of the CeCILL v2.1,
 * and continues to be available under such terms.
 * For more information, see the COPYING file which you should have received
 * along with this program.
 *
 */
#ifndef __DYNLIB_TIME_GW_H__
#define __DYNLIB_TIME_GW_H__

#ifdef _MSC_VER
#if TIME_GW_EXPORTS
#define EXTERN_TIME_GW __declspec (dllexport)
#else
#define EXTERN_TIME_GW __declspec (dllimport)
#endif
#else
#define EXTERN_TIME_GW
#endif

#endif /* !__DYNLIB_TIME_GW_H__ */