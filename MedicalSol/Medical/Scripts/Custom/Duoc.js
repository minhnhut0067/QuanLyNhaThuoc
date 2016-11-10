jQuery(document).ready(function () {
    $('#page_duoc_khaibaokho_gidview').DataTable();
    enable(false);
});

//Filter-End
var strdatafilter = "";
var filter_ds = null;
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
            case "page_duoc_xuatban_cosoyte":
                f_filter_kp_show(aid);
                break;
                //case "ct_form_page1_giuong":
                //    ms_filter_get_selected();
                //    ms_filter_hide();
                //    ct_form_page1_giuong_filter(aid);
                //    break;
                break;
            case "page_duoc_khaibaokho_nhomkho":
                ms_filter_hide();
                f_filter_nhomkho_show(aid);
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

function f_filter_kp_show(v_id_active) {
    ms_filter_show(v_id_active, "", "f_filter_kp", "1", "id", "page_duoc_xuatban_cosoyte", "ten", "f_filter_kp_selected");
}

function f_filter_kp() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    var aid = "";
    g_filter_cur_val = atext;
}

function f_filter_kp_callback(res) {
    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_kp();
            return;
        }
    }
    ms_filter_load(res.value, "ten~id", "Điều trị~Mã");
    g_filter_cur_val = "";
}

function f_filter_kp_selected() {
    if (ms_gfields(g_filter_ds, g_filter_index, "id", "") != "") {
        ms_sval("page_duoc_xuatban_cosoyte", "selectedvalue", ms_gfields(g_filter_ds, g_filter_index, "id", ""));
    }
}

function f_filter_nhomkho_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_hidden", "value", "");
    ms_filter_show(v_id_active, "", "f_filter_nhomkho", "1", "id", "page_duoc_khaibaokho_nhomkho", "ten", "f_filter_nhomkho_selected");
}

function f_filter_nhomkho() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        //var data = {
        //    Value: atext,
        //    Datafilter: strdatafilter
        //};
        var data = {
            Obj: "nhomkhos",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
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
    if (ms_gfields(g_filter_ds, g_filter_index, "id", "") != "") {
        ms_sval("page_duoc_xuatban_cosoyte", "selectedvalue", ms_gfields(g_filter_ds, g_filter_index, "id", ""));
    }
}
//Filter-End

var khaibaokho_input = "page_duoc_khaibaokho_ma~page_duoc_khaibaokho_ten~page_duoc_khaibaokho_nhomkho~page_duoc_khaibaokho_ghichu";
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
            case "page_duoc_khaibaokho_nhomkho":
                ms_filter_get_selected();
                ms_filter_hide();
                break;
            default:
                break;
        }
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
    }
}
//Keyup-End

//Onblur-Start
function input_onblur(v_this) {
}
//Onblur-End

//btn-clck-Start
function btn_click(v_this) {
    switch (v_this.id) {
        case "page_duoc_khaibaokho_themmoi":
            enable(true);
            break;
        default:
            break;
    }
}
//btn-clck-End

//Enable-Start
function enable(v_bool) {
    ms_enable_arr(khaibaokho_input + "~page_duoc_khaibaokho_luu", v_bool);
    ms_enable_arr("page_duoc_khaibaokho_boqua~page_duoc_khaibaokho_sua~page_duoc_khaibaokho_xoa", v_bool);
    ms_enable_arr("page_duoc_khaibaokho_themmoi", !v_bool);
}
//Enable-End