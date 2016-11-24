jQuery(document).ready(function () {
    $('#page_duoc_khaibaokho_gidview').DataTable();
    $('#page_duoc_khaibaokho_gidview').parent().css("overflow-x", "scroll");

    $('#page_duoc_khaibaothuoc_gidview').DataTable();
    $('#page_duoc_khaibaothuoc_gidview').parent().css("overflow-x", "scroll");

    $('#page_duoc_nhapkho_gidview').DataTable();
    $('#page_duoc_nhapkho_gidview').parent().css("overflow-x", "scroll");

    $('#page_duoc_nhapkho_gidview_ct').DataTable();
    $('#page_duoc_nhapkho_gidview_ct').parent().css("overflow-x", "scroll");

    enable(false);
});
var strdatafilter = "";
var filter_ds = null;
var khaibaokho_input = "page_duoc_khaibaokho_ma~page_duoc_khaibaokho_ten~page_duoc_khaibaokho_nhomkho~page_duoc_khaibaokho_ghichu";
//Filter-End
function f_clear_arr(v_id_arr) {

}

function f_dmkho_show(v_ds, v_bool)
{
    ms_sval("page_duoc_khaibaokho_ma","value",ms_gfields(v_ds,0,"ma",""));
    ms_sval("page_duoc_khaibaokho_ma","selectedvalue",ms_gfields(v_ds,0,"id",""));
    ms_sval("page_duoc_khaibaokho_ten","value",ms_gfields(v_ds,0,"ten",""));
    ms_sval("page_duoc_khaibaokho_nhomkho", "value", ms_gfields(v_ds, 0, "nhomkho", ""));
    ms_sval("page_duoc_khaibaokho_nhomkho", "selectedvalue", ms_gfields(v_ds, 0, "id_nhomkho", ""));
    ms_sval("page_duoc_khaibaokho_ghichu", "value", ms_gfields(v_ds, 0, "ghichu", ""));
    enable(v_bool);
}

function filter_click(v_this) {
    try {
        var aid = v_this.id;
        if (aid.length > 7) {
            aid = aid.substr(0, aid.length - 7);
        }
        if (!ms_can_focus(aid)) {
            return;
        }
        var g_filter_limit = 100;
        ms_sval(aid, "value", "");
        switch (aid) {
            case "page_duoc_khaibaokho_nhomkho":
                ms_filter_hide();
                f_filter_nhomkho_show(aid);
                break;
            case "page_duoc_nhapkho_lydo":
                ms_filter_hide();
                f_filter_lydo_show(aid);
                break;
            case "page_duoc_nhapkho_kho":
                ms_filter_hide();
                f_filter_kho_show(aid);
                break;
            case "page_duoc_nhapkho_nhanvien":
                ms_filter_hide();
                f_filter_nhanvien_show(aid);
                break;
            default:
                alert(aid);
                break;
        }
        ms_focus(aid);
        g_filter_limit = 20;
    }
    catch (ex) {
        alert(ex);
    }
}

function f_filter_nhomkho_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_hidden", "value", "");
    //g_filter_id_container = "page_duoc_khaibaokho_nhomkho";
    ms_filter_show(v_id_active, "", "f_filter_nhomkho", "1", "id", v_id_active, "ten", "f_filter_nhomkho_selected");
}

function f_filter_nhomkho() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        g_filter_cur_val = atext;
        f_filter_select("nhomkhos", atext);
    }
}

function f_filter_nhomkho_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_nhomkho();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
    //g_filter_cur_val = "";
}

function f_filter_nhomkho_selected() {
}


function f_filter_lydo_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_lydo", "1", "id", v_id_active, "ten", "f_filter_lydo_selected");
}

function f_filter_lydo() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        g_filter_cur_val = atext;
        f_filter_select("lydonxs", atext);
    }
}

function f_filter_lydo_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_lydo();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
    //g_filter_cur_val = "";
}

function f_filter_lydo_selected() {
}


function f_filter_kho_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_kho", "1", "id", v_id_active, "ten", "f_filter_kho_selected");
}

function f_filter_kho() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        g_filter_cur_val = atext;
        f_filter_select("khos", atext);
    }
}

function f_filter_kho_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_kho();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
    //g_filter_cur_val = "";
}

function f_filter_kho_selected() {
}


function f_filter_nhanvien_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_nhanvien", "1", "id", v_id_active, "ten", "f_filter_nhanvien_selected");
}

function f_filter_nhanvien() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        //var data = {
        //    Value: atext,
        //    Datafilter: strdatafilter
        //};
        var data = {
            Obj: "nhanviens",
            Col: "id~hoten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_nhanvien_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_nhanvien();
            return;
        }
    }
    ms_filter_load(v_ds, "iduser~hoten", "Mã~Tên");
    //g_filter_cur_val = "";
}

function f_filter_nhanvien_selected() {
}
//Filter-End

//Keypress-Start
function input_keypress(event, v_this) {
    var keyCode;
    if (typeof (event.keyCode) != "undefined") {
        keyCode = event.keyCode;
    }
    else {
        keyCode = event.which;
    }
    if (keyCode.toString() == "13") {
        switch (v_this.id) {
            case "page_duoc_khaibaokho_ten":
                if (ms_gval("page_duoc_khaibaokho_ten", "value", "") != "") {
                    //khaibaokho_input = "page_duoc_khaibaokho_ma~page_duoc_khaibaokho_ten~page_duoc_khaibaokho_nhomkho~page_duoc_khaibaokho_ghichu";
                    ms_focus_arr("page_duoc_khaibaokho_nhomkho~page_duoc_khaibaokho_ghichu");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaokho_ten");
                }
                break;
            case "page_duoc_khaibaokho_nhomkho":
                ms_filter_get_selected();
                ms_filter_hide();
                if (ms_gval("page_duoc_khaibaokho_nhomkho", "selectedvalue", "") != "") {
                    //khaibaokho_input = "page_duoc_khaibaokho_ma~page_duoc_khaibaokho_ten~page_duoc_khaibaokho_nhomkho~page_duoc_khaibaokho_ghichu";
                    ms_focus_arr("page_duoc_khaibaokho_ghichu");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaokho_nhomkho");
                }
                break;
            case "page_duoc_khaibaokho_ghichu":
                ms_focus_arr("page_duoc_khaibaokho_luu");
                break;
            case "page_duoc_nhapkho_kho":
                ms_filter_get_selected();
                ms_filter_hide();
                break;
            case "page_duoc_nhapkho_lydo":
                ms_filter_get_selected();
                ms_filter_hide();
                break;
            case "page_duoc_nhanvien_nhanvien":
                ms_filter_get_selected();
                ms_filter_hide();
                break;
            default:
                break;
        }
    }
}
//Ketpress-End

//Keyup-Start
function input_keyup(event, v_this) {
    var keyCode;
    if (typeof (event.keyCode) != "undefined") {
        keyCode = event.keyCode;
    }
    else {
        keyCode = event.which;
    }
    var aid_active = "";
    switch (v_this.id) {
        case "page_duoc_khaibaokho_nhomkho":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_nhomkho_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_nhomkho_show(aid_active);
                    }
                    break;
                case "27"://ESC
                    ms_filter_hide();
                    break;
                case "37"://Left
                case "39"://Right
                    break;
                case "13"://Enter
                    ms_filter_get_selected();
                    ms_filter_hide();
                    break;
                case "32"://Space
                default:
                    f_filter_nhomkho_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_nhapkho_lydo":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_lydo_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_lydo_show(aid_active);
                    }
                    break;
                case "27"://ESC
                    ms_filter_hide();
                    break;
                case "37"://Left
                case "39"://Right
                    break;
                case "13"://Enter
                    ms_filter_get_selected();
                    ms_filter_hide();
                    break;
                case "32"://Space
                default:
                    f_filter_lydo_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_nhapkho_kho":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_kho_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_kho_show(aid_active);
                    }
                    break;
                case "27"://ESC
                    ms_filter_hide();
                    break;
                case "37"://Left
                case "39"://Right
                    break;
                case "13"://Enter
                    ms_filter_get_selected();
                    ms_filter_hide();
                    break;
                case "32"://Space
                default:
                    f_filter_kho_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_nhapkho_nhanvien":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_nhanvien_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_nhanvien_show(aid_active);
                    }
                    break;
                case "27"://ESC
                    ms_filter_hide();
                    break;
                case "37"://Left
                case "39"://Right
                    break;
                case "13"://Enter
                    ms_filter_get_selected();
                    ms_filter_hide();
                    break;
                case "32"://Space
                default:
                    f_filter_nhanvien_show(aid_active);
                    break;
            }
            break;
        default:
            switch (keyCode.toString()) {
                case "32":
                    break;
                default:
                    input_onblur(v_this);
                    break;
            }
            break;
    }
}
//Keyup-End

//Onblur-Start
function input_onblur(v_this) {
    switch (v_this.id) {
        case "page_duoc_khaibaokho_ds_themmoi":
            break;
        case "page_duoc_khaibaokho_themmoi":
            break;
        case "page_duoc_khaibaokho_boqua":
            break;
        case "page_duoc_khaibaokho_luu":
            break;
        case "page_duoc_khaibaokho_ten":
            ms_caps(v_this);
            break;
        default:
            break;
    }
}
//Onblur-End

//btn-clck-Start
function btn_click(v_this) {
    switch (v_this.id) {
        case "page_duoc_khaibaokho_ds_themmoi":
            f_tab_show("danhsach", "thonhtin");
            break;
        case "page_duoc_khaibaokho_themmoi":
            f_set_val("page_duoc_khaibaokho_ma", "khos", "ma");
            enable(true);
            ms_focus_arr("page_duoc_khaibaokho_ten");
            break;
        case "page_duoc_khaibaokho_boqua":
            f_clear_arr(khaibaokho_input);
            break;
        case "page_duoc_khaibaokho_luu":
            f_save_data("khos");
            break;
        default:
            break;
    }
}

function btn_keypress(event, v_this) {
    var keyCode;
    if (typeof (event.keyCode) != "undefined") {
        keyCode = event.keyCode;
    }
    else {
        keyCode = event.which;
    }
    if (keyCode.toString() == "13") {
        switch (v_this.id) {
            case "page_duoc_khaibaokho_luu":
                ms_filter_get_selected();
                ms_filter_hide();
                break;
            default:
                break;
        }
    }
}
//btn-clck-End

//Enable-Start
function enable(v_bool) {
    ms_enable_arr(khaibaokho_input + "~page_duoc_khaibaokho_luu", v_bool);
    ms_enable_arr("page_duoc_khaibaokho_boqua~page_duoc_khaibaokho_sua~page_duoc_khaibaokho_xoa", v_bool);
    ms_enable_arr("page_duoc_khaibaokho_themmoi", !v_bool);

    ms_enable_arr("page_duoc_khaibaokho_ma", false);
}
//Enable-End

//Default-Start

//Default-End