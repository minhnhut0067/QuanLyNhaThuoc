jQuery(document).ready(function () {
    $('#page_duoc_khaibaokho_gidview').DataTable();
});
//JavaScript
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
    var filter_ds = null;
    ms_filter_show(v_id_active, "", "f_filter_kp", "1", "id", "page_duoc_xuatban_cosoyte", "ten", "f_filter_kp_selected");
}

function f_filter_kp() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    var aid = "";
    g_filter_cur_val = atext;
    //cm_baocao_bn.f_filter_dieutri(s_conn, aid, atext, g_filter_limit, f_filter_kp_callback);
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
    var jsonString = ms_gval(v_id_active + "_hidden", "value", "");
    filter_ds = JSON.parse(jsonString);
    ms_filter_show(v_id_active, "", "f_filter_nhomkho", "1", "id", "page_duoc_khaibaokho_nhomkho", "ten", "f_filter_nhomkho_selected");
}

function f_filter_nhomkho() {        
    var atext = ms_gval(g_filter_active_ct, "value", "");
    var aid = "";
    g_filter_cur_val = atext;
    //cm_baocao_bn.f_filter_dieutri(s_conn, aid, atext, g_filter_limit, f_filter_kp_callback);
    f_filter_nhomkho_callback(filter_ds)
}

function f_filter_nhomkho_callback(res) {
    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_kp();
            return;
        }
    }
    ms_filter_load(filter_ds, "ma~ten", "Mã~Tên");
    g_filter_cur_val = "";
}

function f_filter_nhomkho_selected() {
    if (ms_gfields(g_filter_ds, g_filter_index, "id", "") != "") {
        ms_sval("page_duoc_xuatban_cosoyte", "selectedvalue", ms_gfields(g_filter_ds, g_filter_index, "id", ""));
    }
}
