/*
 * Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
 * Copyright (C) 2007 - INRIA - Vincent COUVERT
 * Copyright (C) 2011 - DIGITEO - Vincent COUVERT
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

extern "C"
{
#include "GetUicontrol.h"
}

/* Get the label of an uimenu */
void* GetUimenuLabel(void* _pvCtx, int iOobjUID)
{
    char *label = NULL;
    void* status = NULL;

    getGraphicObjectProperty(iOobjUID, __GO_UI_LABEL__, jni_string, (void **)&label);

    if (label == NULL)
    {
        Scierror(999, _("'%s' property does not exist for this handle.\n"), "Label");
        return NULL;
    }
    else
    {
        status = sciReturnString(label);
        free(label);
        return status;
    }
}