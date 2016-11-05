// Jquery
$(document).ready(function () {
    //debugger;
    //$("ul.sub-menu ul.menu-level").each(function () {
    //    var top = $(this).parent().offset().top;
    //    $(this).css({ "left": 0, "top": top });
    //});
    $(".nav-side-menu li").not("ul.sub-menu li").on("click", function () {
        if ($(this).attr("class") == "collapsed") {
            $(".nav-side-menu .menu-list ul.menu-content").children("ul.sub-menu").not($(this).attr("data-target")).removeClass("in");
            $(".nav-side-menu .menu-list ul.menu-content").children("li").removeClass("active");
            $(this).addClass("active");
        }
        else {
            $(this).removeClass("active");
        }
        //if($(this).attr("class") == "active") {
        //    $(this).removeClass("active");
        //}
        //else {
        //    $(".nav-side-menu .menu-list ul.menu-content").children("li").removeClass("active");
        //    $(".nav-side-menu .menu-list ul.menu-content").children("ul.sub-menu").not($(this).attr("data-target")).removeClass("in");
        //    $(this).addClass("active");                        
        //}
    });
    //$("ul.sub-menu li").on("click", function () {
    //    if($(this).attr("class") == "dropdown open")
    //    {
    //        $(this).removeClass("open");
    //    }
    //    else
    //    {
    //        $(this).addClass("open");
    //        var left = $(this).width();
    //        var top = $(this).offset().top
    //        $($(this).data().target).css({ "left": left, "top": top });
    //    }
    //});
    $("ul.sub-menu li").on("mouseover", function () {
        $(this).addClass("open");
        var left = $(this).width();
        var top = $(this).offset().top
        $($(this).data().target).css({ "left": left, "top": top });
        //if ($(this).attr("class") == "dropdown open") {
        //    $(this).removeClass("open");
        //}
        //else {
        //    $(this).addClass("open");
        //    var left = $(this).width();
        //    var top = $(this).offset().top
        //    $($(this).data().target).css({ "left": left, "top": top });
        //}
    });
    $("ul.sub-menu li").on("mouseout", function () {
        $(this).removeClass("open");
        //if ($(this).attr("class") == "dropdown open") {
        //    $(this).removeClass("open");
        //}
        //else {
        //    $(this).addClass("open");
        //    var left = $(this).width();
        //    var top = $(this).offset().top
        //    $($(this).data().target).css({ "left": left, "top": top });
        //}
    });
});

//Javascript

//basic
function ms_left(v_id) {
    var ax = 0;
    try {
        var elm = ms_gobj(v_id);
        while (elm != null) {
            ax += elm.offsetLeft;
            elm = elm.offsetParent;
        }
        return parseInt(ax, 10);
    }
    catch (ex) {
        ax = 0;
    }
    return ax;
}

function ms_top(v_id) {
    var ax = 0;
    try {
        var elm = ms_gobj(v_id);
        while (elm != null) {
            ax += elm.offsetTop;
            elm = elm.offsetParent;
        }
        return parseInt(ax, 10);
    }
    catch (ex) {
        ax = 0;
    }
    return ax;
}

function ms_can_focus(v_id) {
    try {
        var aobj = ms_gobj(v_id);
        if (aobj != null) {
            if (aobj.disabled == true || aobj.style.visibility == 'hidden' || aobj.style.display == 'none') {
                return false;
            }
            else {
                return true;
            }
        }
        return true;
    }
    catch (ex) {
        return false;
    }
    return true;
}

function ms_focus(v_id) {
    try {
        var aobj = ms_gobj(v_id);
        if (aobj != null) {
            if (aobj.disabled == true || aobj.style.visibility == 'hidden' || aobj.style.display == 'none') {
            }
            else {
                aobj.focus();
                aobj.select();
                return true;
            }
        }
        return false;
    }
    catch (ex) {
        return false;
    }
    return false;
}

function ms_focus_arr(v_id_arr) {
    try {
        for (var i = 0; i < v_id_arr.split('~').length; i++) {
            if (ms_focus(v_id_arr.split('~')[i])) {
                return true;
            }
        }
        return false;
    }
    catch (ex) {
        return false;
    }
    return false;
}

function ms_focus_arr_from(v_id_start, v_id_arr) {
    try {
        v_id_start = v_id_start + "~";
        var astart = -1;
        var atmp = "";
        for (var ii = 0; ii < v_id_start.split('~').length; ii++) {
            atmp = v_id_start.split('~')[ii] + "~";
            for (var i = 0; i < v_id_arr.split('~').length; i++) {
                if (atmp.indexOf(v_id_arr.split('~')[i] + "~") >= 0) {
                    if (ms_gobj(v_id_arr.split('~')[i]) != null) {
                        if (!ms_gobj(v_id_arr.split('~')[i]).disabled && ms_gobj(v_id_arr.split('~')[i]).style.visibility != "hidden") {
                            astart = i;
                            break;
                        }
                    }
                }
            }
            if (astart >= 0) {
                break;
            }
        }
        for (var i = astart; i < v_id_arr.split('~').length; i++) {
            if (ms_focus(v_id_arr.split('~')[i])) {
                return true;
            }
        }
        return false;
    }
    catch (ex) {
        return false;
    }
    return false;
}

function ms_cobj(v_id_cha, v_tag, v_id) {
    try {
        if (ms_gobj(v_id) == null) {
            var act = document.createElement(v_tag);
            act.setAttribute('id', v_id);
            if (ms_gobj(v_id_cha) == null || v_id_cha == "") {
                document.body.appendChild(act);
            }
            else {
                ms_gobj(v_id_cha).appendChild(act);
            }
        }
    }
    catch (ex) {
    }
}

function ms_gobj(v_id) {
    try {
        return document.getElementById(v_id);
    }
    catch (ex) {
        return null;
    }
    return null;
}

function ms_gval(v_id, v_name, v_val_default) {
    try {
        var arr = v_id.split('~');
        for (var i = 0; i < arr.length; i++) {
            if (arr[i] != "") {
                if (ms_gobj(arr[i]) != null) {
                    if (ms_gobj(arr[i])[v_name] == null) {
                        return v_val_default;
                    }
                    return ms_gobj(arr[i])[v_name];
                }
            }
        }
        return v_val_default;
    }
    catch (ex) {
        return v_val_default;
    }
    return v_val_default;
}

function ms_sval(v_id, v_name, v_val) {
    try {
        var arr = v_id.split('~');
        for (var i = 0; i < arr.length; i++) {
            try {
                if (ms_gobj(arr[i]) != null) {
                    ms_gobj(arr[i])[v_name] = v_val;
                }
            }
            catch (ex1) {
            }
        }
    }
    catch (ex) {
    }
    return ms_gval(v_id, v_name, v_val);
}

function ms_satt(v_id, v_name, v_val) {
    try {
        if (ms_gobj(v_id) != null) {
            ms_gobj(v_id).setAttribute("'" + v_name + "'", "'" + v_val + "'");
        }
    }
    catch (ex) {
    }
}

function ms_to_int(v_text) {
    var art = 0;
    try {
        v_text = v_text.toString();
        if (v_text.indexOf(".") > 0) {
            v_text = v_text.split('.')[0];
        }
        v_text = v_text.replace(/[^0-9]/g, '')
        art = parseInt(v_text, 10);
        if (art.toString() == 'NaN') {
            art = 0;
        }
    }
    catch (ex) {
        art = 0;
    }
    return art;
}
function ms_to_int_l(v_text, v_limit) {
    var art = ms_to_int(v_text);
    if (art < v_limit) {
        art = v_limit;
    }
    return art;
}
function ms_to_int_n(v_text, v_limit) {
    var art = ms_to_int(v_text);
    if (art > v_limit) {
        art = v_limit;
    }
    return art;
}

function ms_to_decimal(v_text) {
    var art = 0;
    try {
        v_text = v_text.toString();
        if (v_text.indexOf(".") > 0) {
            v_text = v_text.split('.')[0].replace(/[^0-9]/g, '') + "." + v_text.split('.')[1];
        }
        else {
            v_text = v_text.replace(/[^0-9]/g, '')
        }

        art = parseFloat(v_text);
        if (art.toString() == 'NaN') {
            art = 0;
        }
    }
    catch (ex) {
        art = 0;
    }
    return art;
}

function ms_to_decimal_l(v_text, v_limit) {
    var art = ms_to_decimal(v_text);
    if (art < v_limit) {
        art = v_limit;
    }
    return art;
}

function ms_to_decimal_n(v_text, v_limit) {
    var art = ms_to_decimal(v_text);
    if (art > v_limit) {
        art = v_limit;
    }
    return art;
}

function ms_gfields(v_ds, v_i, v_field, v_default) {
    var art = "";
    try {
        art = (v_ds.Rows[v_i][v_field] ? v_ds.Rows[v_i][v_field].toString() : v_default);
    }
    catch (ex) {
        art = v_default;
    }
    return art;
}

function ms_sfields(v_ds, v_i, v_field, v_val) {
    try {
        v_ds.Rows[i][v_field] = v_val;
    }
    catch (ex) {
    }
}

function ms_gdelimiter(v_delimiter_text, v_delimiter, v_index, v_default) {
    var art = "";
    try {
        art = v_delimiter_text.split(v_delimiter)[v_index];
    }
    catch (ex) {
        art = v_default;
    }
    if (art == null) {
        art = v_default;
    }
    return art;
}

function ms_grid_click(v_this,v_dg)
{
    try
    {
        ms_gobj(ms_gval(v_dg,"lang","?")).style.color="#505050";
        ms_gobj(ms_gval(v_dg,"lang","?")).style.backgroundColor="Transparent";

        ms_sval(ms_gval(v_dg,"lang","?")+'_rh',"className","ms_rcell_c");
    }
    catch(ex)
    {
    }
    try
    {
        v_this.style.color="#A80000";
        v_this.style.backgroundColor="#D3F09E";
        ms_sval(v_dg,"lang",v_this.id);
        ms_sval(v_this.id+'_rh',"className","ms_rcell_c_sel");
    }
    catch(ex)
    {
    }
}

function ms_grid_over(v_this, v_dg) {
    try {
        if (ms_gval(v_dg, "lang", "") == v_this.id) {
            v_this.style.color = "#FF0000";
            v_this.style.backgroundColor = "#D3F09E";
        }
        else {
            v_this.style.backgroundColor = "#D3F09E";
            ms_sval(v_this.id + '_rh', "className", "ms_rcell_c_sel");
        }
    }
    catch (ex) {
    }
}

function ms_grid_out(v_this, v_dg) {
    try {
        if (ms_gval(v_dg, "lang", "") == v_this.id) {
            v_this.style.color = "#A80000";
            v_this.style.backgroundColor = "#D3F09E";
            ms_sval(v_this.id + '_rh', "className", "ms_rcell_c_sel");
        }
        else {
            v_this.style.color = "#505050";
            v_this.style.backgroundColor = "Transparent";
            ms_sval(v_this.id + '_rh', "className", "ms_rcell_c");
        }
    }
    catch (ex) {
    }
}

function ms_grid_scroll(v_divH, v_divM) {
    if (ms_gobj(v_divH) != null && ms_gobj(v_divM) != null) {
        ms_gobj(v_divH).style.left = (ms_gobj(v_divM).scrollLeft * -1 - 1) + "px";
    }
}
//basic

function f_create_input() {
    rhtml = "";
    return rhtml;
}

function f_call_action_no_data(action, controller) {
    $.ajax({
        url: '@Url.Action("' + action + '","' + controller + '")',
        success: function (data) {
            alert(data);
        }
    });
}

function f_call_action(action, controller, value) {
    $.ajax({
        url: '<%= Url.Action("' + action + '", "' + controller + '") %>',
        data: value,
        success: function (data) {
            alert(data);
        }
    });
}


