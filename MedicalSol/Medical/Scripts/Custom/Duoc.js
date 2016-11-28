jQuery(document).ready(function () {

    $('#page_duoc_nhapkho_gidview').DataTable();
    $('#page_duoc_nhapkho_gidview').parent().css("overflow-x", "scroll");

    $('#page_duoc_nhapkho_gidview_ct').DataTable();
    $('#page_duoc_nhapkho_gidview_ct').parent().css("overflow-x", "scroll");

});
var strdatafilter = "";
var filter_ds = null;
var khaibaokho_input = "page_duoc_khaibaokho_ma~page_duoc_khaibaokho_ten~page_duoc_khaibaokho_nhomkho~page_duoc_khaibaokho_ghichu";
var khaibaothuoc_input = "page_duoc_khaibaothuoc_ma~page_duoc_khaibaothuoc_ten~page_duoc_khaibaothuoc_sodk~page_duoc_khaibaothuoc_atccode~page_duoc_khaibaothuoc_hamluong~page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat";
//Filter-End
function f_clear_arr(v_obj) {
    try {
        switch (v_obj) {
            case "khos":
                f_dmkho_show(null, 0, false);
                break;
            case "thuocs":
                f_dmthuoc_show(null, 0, false);
                break;
            default:
                break;
        }
    }
    catch (ex)
    { }
}

function f_dmkho_show(v_ds, v_index, v_bool) {
    ms_sval("page_duoc_khaibaokho_ma", "value", ms_gfields(v_ds, v_index, "ma", ""));
    ms_sval("page_duoc_khaibaokho_ma", "selectedvalue", ms_gfields(v_ds, v_index, "id", ""));
    ms_sval("page_duoc_khaibaokho_ten", "value", ms_gfields(v_ds, v_index, "ten", ""));
    ms_sval("page_duoc_khaibaokho_nhomkho", "value", ms_gfields(v_ds, v_index, "nhomkho", ""));
    ms_sval("page_duoc_khaibaokho_nhomkho", "selectedvalue", ms_gfields(v_ds, v_index, "id_nhomkho", ""));
    ms_sval("page_duoc_khaibaokho_ghichu", "value", ms_gfields(v_ds, v_index, "ghichu", ""));
    khaibaokho_enable(v_bool);
}

function f_dmthuoc_show(v_ds, v_index, v_bool) {
    ms_sval("page_duoc_khaibaothuoc_ma", "value", ms_gfields(v_ds, v_index, "ma", ""));
    ms_sval("page_duoc_khaibaothuoc_ma", "selectedvalue", ms_gfields(v_ds, v_index, "id", ""));
    ms_sval("page_duoc_khaibaothuoc_ten", "value", ms_gfields(v_ds, v_index, "ten", ""));
    ms_sval("page_duoc_khaibaothuoc_atccode", "value", ms_gfields(v_ds, v_index, "atc", ""));
    ms_sval("page_duoc_khaibaothuoc_sodk", "value", ms_gfields(v_ds, v_index, "sodk", ""));
    ms_sval("page_duoc_khaibaothuoc_duongdung", "value", ms_gfields(v_ds, v_index, "ten_duongdung", ""));
    ms_sval("page_duoc_khaibaothuoc_duongdung", "selectedvalue", ms_gfields(v_ds, v_index, "id_duongdung", ""));
    ms_sval("page_duoc_khaibaothuoc_hamluong", "value", ms_gfields(v_ds, v_index, "hamluong", ""));
    //ms_sval("page_duoc_khaibaothuoc_hamluong", "selectedvalue", ms_gfields(v_ds, v_index, "ma", ""));
    ms_sval("page_duoc_khaibaothuoc_dang", "value", ms_gfields(v_ds, v_index, "dang", ""));
    //ms_sval("page_duoc_khaibaothuoc_dang", "selectedvalue", ms_gfields(v_ds, v_index, "ma", ""));
    ms_sval("page_duoc_khaibaothuoc_dvt", "value", ms_gfields(v_ds, v_index, "donvidg", ""));
    //ms_sval("page_duoc_khaibaothuoc_dvt", "selectedvalue", ms_gfields(v_ds, v_index, "ma", ""));
    ms_sval("page_duoc_khaibaothuoc_donvisd", "value", ms_gfields(v_ds, v_index, "donvisd", ""));
    //ms_sval("page_duoc_khaibaothuoc_donvisd", "selectedvalue", ms_gfields(v_ds, v_index, "ma", ""));
    ms_sval("page_duoc_khaibaothuoc_nhomduoc", "value", ms_gfields(v_ds, v_index, "ten_loaiduoc", ""));
    ms_sval("page_duoc_khaibaothuoc_nhomduoc", "selectedvalue", ms_gfields(v_ds, v_index, "id_loaiduoc", ""));
    ms_sval("page_duoc_khaibaothuoc_hangsx", "value", ms_gfields(v_ds, v_index, "ten_hangsx", ""));
    ms_sval("page_duoc_khaibaothuoc_hangsx", "selectedvalue", ms_gfields(v_ds, v_index, "id_hangsx", ""));
    ms_sval("page_duoc_khaibaothuoc_quocgia", "value", ms_gfields(v_ds, v_index, "ten_quocgia", ""));
    ms_sval("page_duoc_khaibaothuoc_quocgia", "selectedvalue", ms_gfields(v_ds, v_index, "id_quocgia", ""));
    ms_sval("page_duoc_khaibaothuoc_donggoi1", "value", ms_gfields(v_ds, v_index, "tyle1", ""));
    ms_sval("page_duoc_khaibaothuoc_donggoi2", "value", ms_gfields(v_ds, v_index, "tyle2", ""));
    ms_sval("page_duoc_khaibaothuoc_thanhphan", "value", ms_gfields(v_ds, v_index, "thanhphan", ""));
    ms_sval("page_duoc_khaibaothuoc_hoatchat", "value", ms_gfields(v_ds, v_index, "hoatchat", ""));
    khaibaothuoc_enable(v_bool);
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
            //khaibaokho
            case "page_duoc_khaibaokho_nhomkho":
                ms_filter_hide();
                f_filter_nhomkho_show(aid);
                break;
            //khaibaothuoc
            case "page_duoc_khaibaothuoc_duongdung":
                ms_filter_hide();
                f_filter_duongdung_show(aid);
                break;
            case "page_duoc_khaibaothuoc_dang":
                ms_filter_hide();
                f_filter_dang_show(aid);
                break;
            //khaibaothuoc
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
}


function f_filter_lydo_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_lydo", "1", "id", v_id_active, "ten", "f_filter_lydo_selected");
}

function f_filter_lydo() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "lydonxs",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
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
        var data = {
            Obj: "khos",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
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


function f_filter_duongdung_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_duongdung", "1", "id", v_id_active, "ten", "f_filter_duongdung_selected");
}

function f_filter_duongdung() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "duongdungs",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_duongdung_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_duongdung();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
}

function f_filter_duongdung_selected() {
    //alert(ms_gval("page_duoc_khaibaothuoc_duongdung", "selectedvalue", ""));
}

function f_filter_dang_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_dang", "1", "id", v_id_active, "ten", "f_filter_dang_selected");
}

function f_filter_dang() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "dmdangbds",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_dang_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_dang();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
}

function f_filter_dang_selected() {
    //alert(ms_gval("page_duoc_khaibaothuoc_duongdung", "selectedvalue", ""));
}
//Filter-End

//Input-Start
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
            //khaibaokho
            case "page_duoc_khaibaokho_ten":
                input_onblur(v_this);
                if (ms_gval("page_duoc_khaibaokho_ten", "value", "") != "") {
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
                    ms_focus_arr("page_duoc_khaibaokho_ghichu");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaokho_nhomkho");
                }
                break;
            case "page_duoc_khaibaokho_ghichu":
                ms_focus_arr("page_duoc_khaibaokho_luu");
                break;
            //khaibaothuoc
            case "page_duoc_khaibaothuoc_ten":
                input_onblur(v_this);
                if (ms_gval("page_duoc_khaibaothuoc_ten", "value", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_sodk~page_duoc_khaibaothuoc_atccode~page_duoc_khaibaothuoc_hamluong~page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");                    
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_ten");
                }
                break;
            case "page_duoc_khaibaothuoc_sodk":
                ms_focus_arr("page_duoc_khaibaothuoc_atccode~page_duoc_khaibaothuoc_hamluong~page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                break;
            case "page_duoc_khaibaothuoc_atccode":
                ms_focus_arr("page_duoc_khaibaothuoc_hamluong~page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                break;
            case "page_duoc_khaibaothuoc_hamluong":
                ms_focus_arr("page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                break;
            case "page_duoc_khaibaothuoc_duongdung":
                if (ms_gval("page_duoc_khaibaothuoc_duongdung", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_duongdung");
                }
                break;
            case "page_duoc_khaibaothuoc_dang":
                if (ms_gval("page_duoc_khaibaothuoc_dang", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_dang");
                }
                break;
            case "page_duoc_khaibaothuoc_dvt":
                if (ms_gval("page_duoc_khaibaothuoc_dvt", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_dvt");
                }
                break;
            case "page_duoc_khaibaothuoc_donvisd":
                if (ms_gval("page_duoc_khaibaothuoc_donvisd", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_donvisd");
                }
                break;
            case "page_duoc_khaibaothuoc_nhomduoc":
                if (ms_gval("page_duoc_khaibaothuoc_nhomduoc", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_nhomduoc");
                }
                break;
            case "page_duoc_khaibaothuoc_hangsx":
                //if (ms_gval("page_duoc_khaibaothuoc_hangsx", "value", "") != "") {
                //    ms_focus_arr("page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                //}
                //else {
                //    ms_focus_arr("page_duoc_khaibaothuoc_hangsx");
                //}
                break;
            case "page_duoc_khaibaothuoc_quocgia":
                //if (ms_gval("page_duoc_khaibaothuoc_quocgia", "value", "") != "") {
                //    ms_focus_arr("page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                //}
                //else {
                //    ms_focus_arr("page_duoc_khaibaothuoc_quocgia");
                //}
                break;
            case "page_duoc_khaibaothuoc_donggoi1":
                //if (ms_gval("page_duoc_khaibaothuoc_donggoi1", "value", "") != "") {
                //    ms_focus_arr("page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                //}
                //else {
                //    ms_focus_arr("page_duoc_khaibaothuoc_donggoi1");
                //}
                break;
            case "page_duoc_khaibaothuoc_donggoi2":
                //if (ms_gval("page_duoc_khaibaothuoc_donggoi2", "value", "") != "") {
                //    ms_focus_arr("page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                //}
                //else {
                //    ms_focus_arr("page_duoc_khaibaothuoc_donggoi2");
                //}
                break;
            case "page_duoc_khaibaothuoc_thanhphan":
                //if (ms_gval("page_duoc_khaibaothuoc_thanhphan", "value", "") != "") {
                //    ms_focus_arr("page_duoc_khaibaothuoc_hoatchat");
                //}
                //else {
                //    ms_focus_arr("page_duoc_khaibaothuoc_thanhphan");
                //}
                break;
            case "page_duoc_khaibaothuoc_hoatchat":
                //if (ms_gval("page_duoc_khaibaothuoc_hoatchat", "value", "") != "") {
                //}
                //else {
                //    ms_focus_arr("page_duoc_khaibaothuoc_hoatchat");
                //}
                break;

            case "page_duoc_nhapkho_kho":
                ms_filter_get_selected();
                ms_filter_hide();
                break;
            case "page_duoc_nhapkho_lydo":
                ms_filter_get_selected();
                ms_filter_hide();
                break;
                //var khaibaothuoc_input = "page_duoc_khaibaothuoc_ma~page_duoc_khaibaothuoc_ten~page_duoc_khaibaothuoc_sodk~page_duoc_khaibaothuoc_atccode~page_duoc_khaibaothuoc_hamluong~page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_nhomduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_donggoi1~page_duoc_khaibaothuoc_donggoi2~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat";
            default:
                break;
        }
    }
}

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
        case "page_duoc_khaibaothuoc_duongdung":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_duongdung_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_duongdung_show(aid_active);
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
                    f_filter_duongdung_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_khaibaothuoc_dang":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_dang_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_dang_show(aid_active);
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
                    f_filter_dang_show(aid_active);
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
            break;
    }
}

function input_onblur(v_this) {
    switch (v_this.id) {
        case "page_duoc_khaibaokho_ten":
            ms_caps(v_this);
            break;
            //dmthuoc
        case "page_duoc_khaibaothuoc_ten":
            ms_caps(v_this);
            break;
        default:
            break;
    }
}
//Input-End

//btn-Start
function btn_click(v_this) {
    switch (v_this.id) {
        //dmkho
        case "page_duoc_khaibaokho_ds_themmoi":
            f_tab_show("danhsach", "thonhtin");
            f_clear_arr("khos");
            ms_enable_arr("page_duoc_khaibaokho_sua", false);
            break;
        case "page_duoc_khaibaokho_themmoi":
            f_set_val("page_duoc_khaibaokho_ma", "khos", "ma");
            f_clear_arr("khos");
            khaibaokho_enable(true);
            ms_enable_arr("page_duoc_khaibaokho_xoa", false);
            ms_focus_arr("page_duoc_khaibaokho_ten");
            break;
        case "page_duoc_khaibaokho_boqua":
            f_clear_arr("khos");
            ms_enable_arr("page_duoc_khaibaokho_sua", false);
            break;
        case "page_duoc_khaibaokho_luu":
            f_save_data("khos");
            break;
        case "page_duoc_khaibaokho_sua":
            khaibaokho_enable(true);
            ms_enable_arr("page_duoc_khaibaokho_xoa", false);
            break;
        case "page_duoc_khaibaokho_xoa":
            f_gridview_del_record("khos", ms_gval("page_duoc_khaibaokho_ma", "selectedvalue"));
            f_clear_arr("khos");
            ms_enable_arr("page_duoc_khaibaokho_sua", false);
            break;
        case "page_duoc_khaibaokho_ketthuc":
            window.location.href = "../Trangchu/index";
            break;
        //dmthuoc
        case "page_duoc_khaibaothuoc_ds_themmoi":
            f_tab_show("danhsach", "thonhtin");
            f_clear_arr("thuocs");
            ms_enable_arr("page_duoc_khaibaothuoc_sua", false);
            break;
        case "page_duoc_khaibaothuoc_themmoi":
            f_clear_arr("thuocs");
            khaibaothuoc_enable(true);
            ms_enable_arr("page_duoc_khaibaothuoc_xoa", false);
            ms_focus_arr("page_duoc_khaibaothuoc_ten");
            break;
        case "page_duoc_khaibaothuoc_sua":
            khaibaothuoc_enable(true);
            ms_enable_arr("page_duoc_khaibaothuoc_xoa", false);
            break;
        case "page_duoc_khaibaothuoc_xoa":
            f_gridview_del_record("thuocs", ms_gval("page_duoc_khaibaothuoc_ma", "selectedvalue"));
            f_clear_arr("thuocs");
            ms_enable_arr("page_duoc_khaibaothuoc_sua", false);
            break;
        case "page_duoc_khaibaothuoc_luu":
            f_save_data("thuocs");
            break;
        case "page_duoc_khaibaothuoc_boqua":
            f_clear_arr("thuocs");
            ms_enable_arr("page_duoc_khaibaothuoc_sua", false);
            break;
        case "page_duoc_khaibaothuoc_ketthuc":
            window.location.href = "../Trangchu/index";
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
//btn-End

//Enable-Start
function khaibaokho_enable(v_bool) {
    ms_enable_arr(khaibaokho_input + "~page_duoc_khaibaokho_luu", v_bool);
    ms_enable_arr("page_duoc_khaibaokho_boqua~page_duoc_khaibaokho_sua~page_duoc_khaibaokho_xoa", v_bool);
    ms_enable_arr("page_duoc_khaibaokho_themmoi", !v_bool);

    ms_enable_arr("page_duoc_khaibaokho_ma", false);
}

function khaibaothuoc_enable(v_bool) {
    ms_enable_arr(khaibaothuoc_input + "~page_duoc_khaibaothuoc_luu", v_bool);
    ms_enable_arr("page_duoc_khaibaothuoc_boqua~page_duoc_khaibaothuoc_sua~page_duoc_khaibaothuoc_xoa", v_bool);
    ms_enable_arr("page_duoc_khaibaothuoc_themmoi", !v_bool);

    ms_enable_arr("page_duoc_khaibaothuoc_ma", false);
}
//Enable-End

//Default-Start

//Default-End