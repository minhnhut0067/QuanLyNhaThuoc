// Jquery
$(document).ready(function () {
    $(".nav-side-menu li").not("ul.sub-menu li").on("click", function () {
        if ($(this).attr("class") == "collapsed") {
            $(".nav-side-menu .menu-list ul.menu-content").children("ul.sub-menu").not($(this).attr("data-target")).removeClass("in");
            $(".nav-side-menu .menu-list ul.menu-content").children("li").removeClass("active");
            $(this).addClass("active");
        }
        else {
            $(this).removeClass("active");
        }
    });
    $("ul.sub-menu li").on("mouseover", function () {
        $(this).addClass("open");
        var left = $(this).width();
        var top = $(this).offset().top - $(window).scrollTop()
        $($(this).data().target).css({ "left": left, "top": top });
    });
    $("ul.sub-menu li").on("mouseout", function () {
        $(this).removeClass("open");
    });

    $("a.input-datepicker").on("click", function () {
        ms_filter_hide();
        var id = $(this)[0].id.replace("_datepicker", "");
        $("#" + id).datepicker("show");
    });
    //$(".ui-datepicker-calendar > tbody > tr > td").on("click", function () {
    //    debugger;
    //});
});
//Javascript

//basic
var m_grid_ds = null;

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

function ms_grid_click(v_this, v_dg) {
    try {
        ms_gobj(ms_gval(v_dg, "lang", "?")).style.color = "#000";
        ms_gobj(ms_gval(v_dg, "lang", "?")).style.backgroundColor = "#fff";
        ms_gobj(ms_gval(v_dg, "lang", "?")).style.background = "Transparent";

        ms_sval(ms_gval(v_dg, "lang", "?") + '_rh', "className", "ms_rcell_c");
    }
    catch (ex) {
    }
    try {
        v_this.style.color = "#915608";
        //v_this.style.fontWeight = 0;
        //v_this.style.backgroundColor = "#fff";
        v_this.style.background = "#f8da4e url(\"../Content/jqueryui/images/ui-bg_glass_55_f8da4e_1x400.png\") repeat-x scroll 50% 50%";
        ms_sval(v_dg, "lang", v_this.id);
        ms_sval(v_this.id + '_rh', "className", "ms_rcell_c_sel");
    }
    catch (ex) {
    }
}

function ms_grid_over(v_this, v_dg) {
    try {
        if (ms_gval(v_dg, "lang", "") == v_this.id) {
            //v_this.style.fontWeight = 700;
            v_this.style.color = "#FF0000";
            //v_this.style.backgroundColor = "#ccffff";
            v_this.style.background = "#6eac2c url(\"../Content/jqueryui/images/ui-bg_gloss-wave_50_6eac2c_500x100.png\") repeat-x scroll 50% 50%";
        }
        else {
            v_this.style.fontWeight = 0;
            //v_this.style.backgroundColor = "#fff";
            v_this.style.background = "#6eac2c url(\"../Content/jqueryui/images/ui-bg_gloss-wave_50_6eac2c_500x100.png\") repeat-x scroll 50% 50%";
            v_this.style.color = "#fff";
            ms_sval(v_this.id + '_rh', "className", "ms_rcell_c_sel");

        }
    }
    catch (ex) {
    }
}

function ms_grid_out(v_this, v_dg) {
    try {
        if (ms_gval(v_dg, "lang", "") == v_this.id) {
            v_this.style.color = "#915608";
            //v_this.style.backgroundColor = "#fff";
            v_this.style.background = "#f8da4e url(\"../Content/jqueryui/images/ui-bg_glass_55_f8da4e_1x400.png\") repeat-x scroll 50% 50%";
            ms_sval(v_this.id + '_rh', "className", "ms_rcell_c_sel");
        }
        else {
            v_this.style.color = "#000";
            v_this.style.background = "Transparent";
            v_this.style.backgroundColor = "#fff";
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

function ms_visible(v_id, v_bool) {
    try {
        ms_gobj(v_id).style.visibility = (v_bool ? "visible" : "hidden");
        return true;
    }
    catch (ex) {
        return false;
    }
    return false;
}

function ms_visible_arr(v_id_arr, v_bool) {
    try {
        for (var i = 0; i < v_id_arr.split('~').length; i++) {
            ms_visible(v_id_arr.split('~')[i], v_bool);
        }
        return true;
    }
    catch (ex) {
        return false;
    }
    return false;
}

function ms_enable(v_id, v_bool) {
    try {
        ms_gobj(v_id).disabled = !v_bool;
        ms_sval(v_id, "className", ms_gval(v_id, "className", "").replace("_dis", "") + (ms_gobj(v_id).disabled ? "_dis" : ""));
        ms_sval(v_id + "_filter", "className", ms_gval(v_id + "_filter", "className", "").replace("_dis", "") + (ms_gobj(v_id).disabled ? "_dis" : ""));
        ms_sval(v_id + "_filter", "onClick", "return false;")
        return true;
    }
    catch (ex) {
        return false;
    }
    return false;
}

function ms_enable_arr(v_id_arr, v_bool) {
    try {
        for (var i = 0; i < v_id_arr.split('~').length; i++) {
            ms_enable(v_id_arr.split('~')[i], v_bool);
        }
        return true;
    }
    catch (ex) {
        return false;
    }
    return false;
}

function ms_enable_arr_from(v_id_start, v_id_arr) {
    try {
        var astart = 0;
        for (var i = 0; i < v_id_arr.split('~').length; i++) {
            if (v_id_arr.split('~')[i] == v_id_start) {
                astart = i;
                break;
            }
        }
        for (var i = astart; i < v_id_arr.split('~').length; i++) {
            if (ms_enable(v_id_arr.split('~')[i])) {
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

function ms_caps(v_this) {
    try {
        var atmp = v_this.value.split(' ');
        var atmp1 = "";
        for (var i = 0; i < atmp.length; i++) {
            if (atmp[i].length > 1) {
                atmp1 += atmp[i].substr(0, 1).toUpperCase() + atmp[i].substr(1) + " ";
            }
            else {
                atmp1 += atmp[i].substr(0, 1).toUpperCase() + " ";
            }
        }
        v_this.value = atmp1.trim();
    }
    catch (ex) {
    }
}

function ms_cap(v_this) {
    try {
        var atmp = v_this.value;
        if (v_this.value.length > 0) {
            v_this.value = v_this.value.substr(0, 1).toUpperCase() + v_this.value.substr(1);
        }
    }
    catch (ex) {
    }
}

function ms_lpad(str, max, char) {
    try {
        str = str.toString();
        return str.length < max ? ms_lpad(char + str, max) : str;
    }
    catch (ex)
    { return ex; }
}

//basic

function f_table_reload(v_obj) {
    try {
        var data = null;
        switch(v_obj)
        {
            case "nhapkhos":
                var v_dk = ms_gval("page_duoc_nhapkho_lydo", "selectedvalue", "") + "~" + ms_gval("page_duoc_nhapkho_kho", "selectedvalue", "") + "~" + ms_gval("page_duoc_nhapkho_nhanvien", "selectedvalue", "") + "~" + ms_gval("page_duoc_nhapkho_tn", "value", "") + "~" + ms_gval("page_duoc_nhapkho_dn", "value", "");
                data = { obj: v_obj, request: v_dk };
                break;
            default:
                data = { obj: v_obj, col: "", val: "" };
                break;
        }
        $.ajax({
            type: "POST",
            url: "../Process/Gridview",
            data: data,
            success: function (result) {
                if (result != "") {
                    switch (v_obj) {
                        case "khos":
                            $("#page_duoc_khaibaokho_ds").html(f_create_table_html(v_obj, result, "page_duoc_khaibaokho", "ID~Nhóm~Mã~Tên~Ghi chú", "id~nhomkho~ma~ten~ghichu", false));
                            $('#page_duoc_khaibaokho_gidview').DataTable();
                            $('#page_duoc_khaibaokho_gidview').parent().css("overflow-x", "scroll");
                            break;
                        case "thuocs":
                            $("#page_duoc_khaibaothuoc_ds").html(f_create_table_html(v_obj, result, "page_duoc_khaibaothuoc", "Số ĐK~Mã~Tên~Loại~Hàm lượng~Hoạt chât~Dạng~Đường dùng~Đơn vị SD", "sodk~ma~ten~ten_loaiduoc~hamluong~hoatchat~dang~ten_duongdung~donvisd", false));
                            $('#page_duoc_khaibaothuoc_gidview').DataTable();
                            $('#page_duoc_khaibaothuoc_gidview').parent().css("overflow-x", "scroll");
                            break;
                        case "nhapkhos":
                            $("#page_duoc_nhapkho_ds").html(f_create_table_html(v_obj, result, "page_duoc_nhapkho_ds", "Số ĐK~Mã~Tên~Loại~Hàm lượng~Hoạt chât~Dạng~Đường dùng~Đơn vị SD", "sodk~ma~ten~ten_loaiduoc~hamluong~hoatchat~dang~ten_duongdung~donvisd", false));
                            $('#page_duoc_nhapkho_ds_gidview').DataTable();
                            $('#page_duoc_nhapkho_ds_gidview').parent().css("overflow-x", "scroll");

                            if ($("#page_duoc_nhapkho_ct_idnhapkho_hidden").val() != "") {
                                $("#page_duoc_nhapkho_ct_ds").html(f_create_table_html("nhapkhos", "[]", "page_duoc_nhapkho_ct", "Số ĐK~Mã~Tên~Loại~Hàm lượng~Hoạt chât~Dạng~Đường dùng~Đơn vị SD", "sodk~ma~ten~ten_loaiduoc~hamluong~hoatchat~dang~ten_duongdung~donvisd", false));
                                $('#page_duoc_nhapkho_ct_gidview').DataTable();
                                $('#page_duoc_nhapkho_ct_gidview').parent().css("overflow-x", "scroll");
                            }
                            else {
                                $("#page_duoc_nhapkho_ct_ds").html(f_create_table_html("nhapkhos", "[]", "page_duoc_nhapkho_ct", "Số ĐK~Mã~Tên~Loại~Hàm lượng~Hoạt chât~Dạng~Đường dùng~Đơn vị SD", "sodk~ma~ten~ten_loaiduoc~hamluong~hoatchat~dang~ten_duongdung~donvisd", false));
                                $('#page_duoc_nhapkho_ct_gidview').DataTable();
                                $('#page_duoc_nhapkho_ct_gidview').parent().css("overflow-x", "scroll");
                            }
                            break;
                        case "nhapkhocts":
                            break;
                        default:
                            break;
                    }
                }
            },
            error: function (result) {
            }
        });
    }
    catch (ex)
    { }
}

function f_create_btn_group(v_id, v_id_arr, v_style_arr, v_name_arr) {
    try {
        rhtml = "";
        if (v_id != "" && v_id_arr != "") {
            for (var i = 0; i < v_id_arr.split('~').length ; i++) {
                rhtml += "<input id=\"" + v_id + "_" + v_id_arr.split('~')[i] + "\" type=\"button\" class=\"btn btn-sm btn-" + v_style_arr.split('~')[i] + " custom-btn\" value=\"" + v_name_arr.split('~')[i] + "\" onclick = \"btn_click(this)\" onkeypress = \"btn_keypress(event,this)\" />";
            }
        }
        return rhtml;
    }
    catch (ex) {
        return "";
    }
}

function f_create_input(v_id, v_type, v_name, v_style) {
    try {
        rhtml = "";
        if (v_id != "") {
            switch (v_type) {
                case "input":
                    rhtml = "<span class=\"input-group-addon input-label\" id=\"" + v_id + "_label\" style=\"\">" + v_name + "</span>";
                    rhtml += "<input id=\"" + v_id + "\" type=\"text\" style = '" + v_style + "' class=\"form-control input-sm\" placeholder=\"\" aria-describedby=\"" + v_id + "_label\" onkeypress=\"input_keypress(event,this);\" onblur=\"input_onblur(this);\" onkeyup=\"input_keyup(event, this);\">";
                    break;
                case "filter":
                    rhtml = "<span class=\"input-group-addon input-label\" id=\"" + v_id + "_label\" style=\"\">" + v_name + "</span>";
                    rhtml += "<input id=\"" + v_id + "\" type=\"text\" class=\"form-control input-sm\" placeholder=\"\" aria-describedby=\"" + v_id + "_label\" onkeypress=\"input_keypress(event,this);\" onblur=\"input_onblur(this);\" onkeyup=\"input_keyup(event, this);\">";
                    rhtml += "<a href=\"#\" class=\"input-group-addon input-filter\" id=\"" + v_id + "_filter\" onclick=\"filter_click(this);\"><i class=\"fa fa-sort-desc\"></i></a>";
                    break;
                case "textarea":
                    rhtml = "<span class=\"input-group-addon input-label\" id=\"" + v_id + "_label\" style=\"\">" + v_name + "</span>";
                    rhtml += "<textarea class=\"form-control\" rows=\"3\" id=\"" + v_id + "\" aria-describedby=\"" + v_id + "_label\" onkeypress=\"input_keypress(event,this);\" onblur=\"input_onblur(this);\" onkeyup=\"input_keyup(event, this);\"></textarea>";
                    break;
                case "datepicker":
                    rhtml = "<div class=\"input-group date\">";
                    rhtml += "<span class=\"input-group-addon input-label\" id=\"" + v_id + "_input_label\" style=\"\">" + v_name + "</span>";
                    rhtml += "<input type=\"text\" class=\"form-control input-sm\" id=\"" + v_id + "\" placeholder=\"" + v_name + "\"/>";
                    rhtml += "<a class=\"input-group-addon input-datepicker\" id=\"" + v_id + "_datepicker\" href=\"#\"><i class=\"fa fa-calendar\"></i></a>";
                    rhtml += "</div>";
                    break;
                case "checkbox":
                    rhtml = "<span class=\"input-group-addon input-label\" id=\"" + v_id + "_label\" style=\"min-width:auto;\">";
                    rhtml += "" + v_name + "&nbsp;<input id=\"" + v_id + "_chk\" class=\"\" type=\"checkbox\" aria-label=\"" + v_name + "\"></span>";
                    break;
                case "hidden":
                    rhtml = "<input id=\"" + v_id + "_hidden\" type=\"hidden\" class=\"form-control input-sm\" placeholder=\"\" aria-describedby=\"" + v_id + "_hidden\">";
                    break;
                default:
                    break;
            }
        }
        return rhtml;
    }
    catch (ex) {
        return "";
    }
}

function f_create_table(v_obj, v_id, v_colname, v_col, v_footer) {
    try {
        var rhtml = "";
        if (v_id != "" && v_obj != "") {
            var data = {
                Obj: v_obj
            };
            $.ajax({
                type: "POST",
                url: "../Process/Gridview",
                data: data,
                success: function (result) {
                    if (result != "") {
                        rhtml = f_create_table_html(v_obj, JSON.parse(result), v_id, v_colname, v_col, v_footer);
                    }
                    else {
                        rhtml = "";
                    }
                },
                error: function (result) {
                    rhtml = "";
                }
            });
        }
        return rhtml;
    }
    catch (ex) {
        return "";
    }
}

function f_create_table_html(v_obj, v_ds, v_id, v_colname, v_col, v_footer) {
    try {
        v_ds = "{\"Name\":\"Table\",\"Rows\":" + v_ds.replace('"', '\"').replace("\'", "'") + "}";
        v_ds = JSON.parse(v_ds);
        m_grid_ds = v_ds;
        rhtml = "";
        rhtml = "<div id=\"" + v_id + "_wrapper\" class=\"dataTables_wrapper form-inline dt-bootstrap\">";
        rhtml += "<div class=\"col-lg-12 col-sm-12 col-md-12 col-xs-12\">";
        rhtml += "<table id=\"" + v_id + "_gidview\" class=\"table table-sm table-striped table-bordered dataTable\" role=\"grid\" aria-describedby=\"" + v_id + "_gidview_info\" style=\"width: 100%;\" width=\"100%\" cellspacing=\"0\">";
        rhtml += "<thead>";
        rhtml += "<tr role=\"row\">";
        if (v_ds.Rows.length > 0) {
            rhtml += "<th class=\"\" tabindex=\"0\" aria-controls=\"" + v_id + "_gidview\" rowspan=\"1\" colspan=\"1\" style=\"width: auto;text-align: center;\" aria-label=\"input-delete\"></th>";
            rhtml += "<th class=\"\" tabindex=\"0\" aria-controls=\"" + v_id + "_gidview\" rowspan=\"1\" colspan=\"1\" style=\"width: auto;text-align: center;\" aria-label=\"input-details\"></th>";//background: rgba(0, 0, 0, 0) linear-gradient(#d4ffff, #ddfefe) repeat scroll 0 0;
        }
        for (var i = 0; i < v_col.split('~').length; i++) {
            if (i <= 0) {
                rhtml += "<th class=\"sorting_asc\" tabindex=\"0\" aria-controls=\"" + v_id + "_gidview\" rowspan=\"1\" colspan=\"1\" style=\"width: auto;text-align: center;vertical-align: middle;\" aria-sort=\"ascending\" aria-label=\"" + v_colname.split('~')[i] + ": activate to sort column descending\">" + v_colname.split('~')[i] + "</th>";
            }
            else {
                rhtml += "<th class=\"sorting\" tabindex=\"0\" aria-controls=\"" + v_id + "_gidview\" rowspan=\"1\" colspan=\"1\" style=\"width: auto;text-align: center;vertical-align: middle;\" aria-label=\"" + v_colname.split('~')[i] + ": activate to sort column ascending\">" + v_colname.split('~')[i] + "</th>";
            }
        }
        rhtml += "</tr>";
        rhtml += "</thead>";
        if (v_footer) {
            rhtml += "<tfoot>";
            rhtml += "<tr>";
            for (var i = 0; i < v_col.split('~').length; i++) {
                rhtml += "<th rowspan=\"1\" colspan=\"1\">" + v_colname.split('~')[i] + "</th>";
            }
            rhtml += "</tr>";
            rhtml += "</tfoot>";
        }
        if (v_ds.Rows.length > 0) {
            rhtml += "<tbody>";
            for (var i = 0; i < v_ds.Rows.length; i++) {
                rhtml += "<tr>";

                rhtml += "<td style =\"text-align:center;vertical-align: middle;padding:10px;\"><a href=\"#\" onclick=\"f_gridview_del_record('" + v_obj + "','" + ms_gfields(v_ds, i, "id", "") + "')\" style = \"color:red; font-size:13px;\"><i class=\"fa fa-trash\" aria-hidden=\"true\" /></a></td>";
                rhtml += "<td style =\"text-align:center;vertical-align: middle;padding:10px;\"><a href=\"#\" onclick=\"f_gridview_show_record('" + v_obj + "','" + i + "')\" style = \"color:blue; font-size:13px;\"><i class=\"fa fa-pencil\" aria-hidden=\"true\" /></a></td>";
                for (var j = 0; j < v_col.split('~').length ; j++) {
                    rhtml += "<td style=\"witch:auto;\">" + ms_gfields(v_ds, i, v_col.split('~')[j], "") + "</td>";
                }
                rhtml += "</tr>";
            }
            rhtml += "</tbody>";
        }
        rhtml += "</table>";
        rhtml += "</div>";
        rhtml += "</div>";
        return rhtml;
    }
    catch (ex) {
        return ex.message;
    }
}

function f_call_action_no_data(action, controller) {
    $.ajax({
        url: '@Url.Action("' + action + '","' + controller + '")',
        success: function (data) {
            alert(data);
        }
    });
}

function f_tab_show(v_tab_in, v_tab_to) {
    try {
        $(".nav-tabs").find("[aria-controls=\"" + v_tab_in + "\"]").parent().removeClass("active");
        $("#" + v_tab_in + "").removeClass("in active");
        $(".nav-tabs").find("[aria-controls=\"" + v_tab_to + "\"]").parent().addClass("active");
        $("#" + v_tab_to + "").addClass("in active");
    }
    catch (ex)
    { }
}

function f_tab_click(v_this, v_obj, v_bool) {
    try {
        if (v_bool) {
            if (!$(v_this).parent().hasClass("active")) {
                f_table_reload(v_obj);
            }
        }
    }
    catch (ex)
    { }
}

function f_filter_select(v_data) {
    try {
        $.ajax({
            type: "POST",
            url: "../Process/Filter",
            data: v_data,
            success: function (result) {
                if (result == "") {
                    result = "{\"Name\":\"Table\",\"Rows\":[]}";
                }
                switch (v_data.Obj) {
                    case "nhomkhos":
                        f_filter_nhomkho_callback(JSON.parse(result));
                        break;
                    case "lydonxs":
                        f_filter_lydo_callback(JSON.parse(result));
                        break;
                    case "khos":
                        f_filter_kho_callback(JSON.parse(result));
                        break;
                    case "nhanviens":
                        f_filter_nhanvien_callback(JSON.parse(result));
                        break;
                    case "duongdungs":
                        f_filter_duongdung_callback(JSON.parse(result));
                        break;
                    case "dangbds":
                        f_filter_dang_callback(JSON.parse(result));
                        break;
                    case "donvis":
                        f_filter_donvi_callback(JSON.parse(result));
                        break;
                    case "loaiduocs":
                        f_filter_loaiduoc_callback(JSON.parse(result));
                        break;
                    case "hangsxs":
                        f_filter_hangsx_callback(JSON.parse(result));
                        break;
                    case "quocgias":
                        f_filter_quocgia_callback(JSON.parse(result));
                        break;
                    default:
                        break;
                }
            },
            error: function (result) {
                switch (data.Obj) {
                    case "nhomkhos":
                        f_filter_nhomkho_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    case "lydonxs":
                        f_filter_lydo_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    case "khos":
                        f_filter_kho_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    case "nhanviens":
                        f_filter_nhanvien_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    case "duongdungs":
                        f_filter_duongdung_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    case "dangbds":
                        f_filter_dang_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    case "donvis":
                        f_filter_donvi_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    case "loaiduocs":
                        f_filter_loaiduoc_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    case "hangsx":
                        f_filter_hangsx_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    case "quocgias":
                        f_filter_quocgia_callback(JSON.parse("{\"Name\":\"Table\",\"Rows\":[]}"));
                        break;
                    default:
                        break;
                }
            }
        });
    }
    catch (ex) {
        return "";
    }
}

function f_save_data(v_url, v_data) {
    try {
        $.ajax({
            type: "POST",
            url: "../Process/" + v_url,
            data: v_data,
            success: function (result) {
                switch (v_url) {
                    case "Savekho":
                        f_dmkho_show(JSON.parse(result != "" ? result : "{\"Name\":\"Table\",\"Rows\":[]}"), 0, false);
                        ms_enable_arr("page_duoc_khaibaokho_sua~page_duoc_khaibaokho_xoa", true);
                        break;
                    case "SaveThuoc":
                        f_dmthuoc_show(JSON.parse(result != "" ? result : "{\"Name\":\"Table\",\"Rows\":[]}"), 0, false);
                        ms_enable_arr("page_duoc_khaibaothuoc_sua~page_duoc_khaibaothuoc_xoa", true);
                        break;
                    default:
                        break;
                }
            },
            error: function (result) {
            }
        });
    }
    catch (ex) {
        alert(ex);
    }
}

function f_set_val(v_id, v_obj, v_val) {
    try {
        var data = { Obj: v_obj, Val: v_val };
        $.ajax({
            type: "POST",
            url: "../Process/CreateVal",
            data: data,
            success: function (result) {
                resultval = result;
                ms_sval(v_id, "value", result);
            },
            error: function (result) {
                ms_sval(v_id, "value", "");
            }
        });
    }
    catch (ex) {
        ms_sval(v_id, "value", "");
    }
}

function f_gridview_del_record(v_obj, v_id) {
    try {
        if (v_id == null || v_id == "") {
            alert("Vui lòng chọn nội dung muốn xóa");
        }
        var data = { obj: v_obj, key: v_id };
        $.ajax({
            type: "POST",
            url: "../Process/DelRecode",
            data: data,
            success: function (result) {
                if (result == "True") {
                    f_table_reload(v_obj);
                    alert("Xóa dữ liệu thành công !");
                }
                //resultval = result;
                //ms_sval(v_id, "value", result);
            },
            error: function (result) {
                //ms_sval(v_id, "value", "");
            }
        });
    }
    catch (ex) {
        aler("Lỗi hệ thống ! Không xóa được dữ liệu")
    }
}

function f_gridview_show_record(v_obj, v_index) {
    try {
        var v_ds = m_grid_ds;
        f_tab_show("danhsach", "thonhtin");
        switch (v_obj) {
            case "khos":
                f_dmkho_show(v_ds, v_index, false)
                ms_enable_arr("page_duoc_khaibaokho_xoa~page_duoc_khaibaokho_sua", true);
                break;
            case "thuocs":
                f_dmthuoc_show(v_ds, v_index, false)
                ms_enable_arr("page_duoc_khaibaothuoc_xoa~page_duoc_khaibaothuoc_sua", true);
                break;
            default:
                break;
        }
    }
    catch (ex) {
        alert("Lỗi hệ thống ! Không lấy được dữ liệu")
    }
}



