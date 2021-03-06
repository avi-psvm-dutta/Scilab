//  Scicos
//
//  Copyright (C) 2016 - Pulkit Mittal <mittal.pulkit08@gmail.com>
//  Copyright (C) INRIA - METALAU Project <scicos@inria.fr>
//
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
//
// See the file ../license.txt
//

function [x,y,typ]=NEW_TKSCALE(job,arg1,arg2)
    //Source block; output defined by tk widget scale
    x=[];
    y=[];
    typ=[];
    select job
    case "set" then
        x=arg1;
        graphics=arg1.graphics;
        exprs=graphics.exprs
        model=arg1.model;

        // Add a label 'Name of TKSCALE' of type 'str' and set its dimension to 1
        // This adds a new field where the title of Tk Source can be changed
        //
        //  @autor Pulkit Mittal    <mittal.pulkit08@gmail.com>
        //
        //
        [ok,a,b,f,name_tk,exprs]=scicos_getvalue("Set scale block parameters",..
        ["Min value";"Max value";"Normalization";"Name of TKSCALE"],..
        list("vec",1,"vec",1,"vec",1,"str",1),exprs)

        // tk widget returns a scalar, the value is divided by
        // Normalization factor
        if ok then
            graphics.exprs=exprs
            model.rpar=[a;b;f]

            // Use a scilab object of type model and include the field label which can be used to identify a 
            // block in order to access or modify its parameters
            //
            // @author Pulkit Mittal    <mittal.pulkit08@gmail.com>
            //
            //
            name_tk = stripblanks(name_tk);
            name_tk = strsubst(name_tk,' ','_')
            model.label=string(name_tk);
            x.graphics=graphics;
            x.model=model
        end
    case "define" then
        a=-10;
        b=10;
        f=1;
        name_tk="NIL";// default parameter values
        model=scicos_model()
        model.sim=list("new_tkscaleblk",5)
        model.out=1
        model.evtin=1
        model.rpar=[a;b;f]
        // Set the label field of model object equal to the name given by user
        //
        // @author Pulkit Mittal    <mittal.pulkit08@gmail.com>
        //
        // 
        model.label=string(name_tk)
        model.blocktype="d"
        model.dep_ut=[%f %f]
        //
        // exprs a vector of strings including formal expressions
        //
        exprs=[sci2exp(a);sci2exp(b);sci2exp(f);string(name_tk)]
        gr_i=[]
        x=standard_define([3 2],model,exprs,gr_i)
    end
endfunction




