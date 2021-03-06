﻿jQuery(document).ready(function () {

    //$('#page_duoc_nhapkho_gidview').DataTable();
    //$('#page_duoc_nhapkho_gidview').parent().css("overflow-x", "scroll");

    //$('#page_duoc_nhapkho_gidview_ct').DataTable();
    //$('#page_duoc_nhapkho_gidview_ct').parent().css("overflow-x", "scroll");

});
var strdatafilter = "";
var filter_ds = null;
var khaibaokho_input = "page_duoc_khaibaokho_ma~page_duoc_khaibaokho_ten~page_duoc_khaibaokho_nhomkho~page_duoc_khaibaokho_ghichu";
var khaibaothuoc_input = "page_duoc_khaibaothuoc_ma~page_duoc_khaibaothuoc_ten~page_duoc_khaibaothuoc_sodk~page_duoc_khaibaothuoc_atccode~page_duoc_khaibaothuoc_hamluong~page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_loaiduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat";
var dsnhapkho_input = "page_duoc_nhapkho_lydo~page_duoc_nhapkho_kho~page_duoc_nhapkho_tn~page_duoc_nhapkho_dn~page_duoc_nhapkho_nhanvien";
var ctnhapkho_input = "page_duoc_nhapkho_ct_lydo~page_duoc_nhapkho_ct_ngayhd~page_duoc_nhapkho_ct_sohd~page_duoc_nhapkho_ct_sotienhd~page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung";
//Filter-End

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
}


function f_filter_dang_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_dang", "1", "id", v_id_active, "ten", "f_filter_dang_selected");
}

function f_filter_dang() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "dangbds",
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
}


function f_filter_donvi_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_donvi", "1", "id", v_id_active, "ten", "f_filter_donvi_selected");
}

function f_filter_donvi() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "donvis",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_donvi_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_donvi();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
}

function f_filter_donvi_selected() {
}


function f_filter_loaiduoc_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_loaiduoc", "1", "id", v_id_active, "ten", "f_filter_loaiduoc_selected");
}

function f_filter_loaiduoc() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "loaiduocs",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_loaiduoc_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_donvi();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
}

function f_filter_loaiduoc_selected() {
}


function f_filter_hangsx_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_hangsx", "1", "id", v_id_active, "ten", "f_filter_hangsx_selected");
}

function f_filter_hangsx() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "hangsxs",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_hangsx_callback(v_ds) {//ress
    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_hangsx();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
}

function f_filter_hangsx_selected() {
}


function f_filter_nhacc_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_nhacc", "1", "id", v_id_active, "ten", "f_filter_nhacc_selected");
}

function f_filter_nhacc() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "nhaccs",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_nhacc_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_nhacc();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
    //g_filter_cur_val = "";
}

function f_filter_nhacc_selected() {
}


function f_filter_hoatchat_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_hoatchat", "1", "id", v_id_active, "ten", "f_filter_hoatchat_selected");
}

function f_filter_hoatchat() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "dmhcs",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_hoatchat_callback(v_ds) {//ress
    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_hoatchat();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
}

function f_filter_hoatchat_selected() {
}


function f_filter_quocgia_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_quocgia", "1", "id", v_id_active, "ten", "f_filter_quocgia_selected");
}

function f_filter_quocgia() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "quocgias",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_quocgia_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_quocgia();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
}

function f_filter_quocgia_selected() {
}


function f_filter_thuoc_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_thuoc", "1", "id", v_id_active, "ten", "f_filter_thuoc_selected");
}

function f_filter_thuoc() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "thuocs",
            Col: "sodk~ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_thuoc_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_thuoc();
            return;
        }
    }
    ms_filter_load(v_ds, "sodk~ma~ten", "Số ĐK~Mã~Tên");
}

function f_filter_thuoc_selected() {
    var v_dk = ms_gval("page_duoc_nhapkho_ct_idnhapkho_hidden", "value", "") + "~" + ms_gval("page_duoc_nhapkho_ct_tenthuoc", "selectedvalue", "");
    var data = { obj: "nhapkhocts", request: v_dk }
    $.ajax({
        type: "POST",
        url: "../Process/Check",
        data: data,
        success: function (result) {
            if (result == "True") {
                var r = confirm(ms_gval("page_duoc_nhapkho_ct_tenthuoc", "value", "") + " đã được cấp. \nBạn đồng ý cập nhật lại số liệu cũ ?");
                if (r == true) {
                    ms_sval("page_duoc_nhapkho_ct_sodk", "value", ms_gfields(g_filter_ds, g_filter_index, "sodk", ""));
                    ms_sval("page_duoc_nhapkho_ct_ma", "value", ms_gfields(g_filter_ds, g_filter_index, "ma", ""));
                    ms_sval("page_duoc_nhapkho_ct_hoatchat", "value", ms_gfields(g_filter_ds, g_filter_index, "hoatchat", ""));
                    ms_sval("page_duoc_nhapkho_ct_donvidg", "value", ms_gfields(g_filter_ds, g_filter_index, "donvidg", ""));
                    ms_sval("page_duoc_nhapkho_ct_donvisd", "value", ms_gfields(g_filter_ds, g_filter_index, "donvisd", "") == "" ? ms_gfields(g_filter_ds, g_filter_index, "dang", "") : ms_gfields(g_filter_ds, g_filter_index, "donvisd", ""));
                    ms_sval("page_duoc_nhapkho_ct_hangsx", "selectedvalue", ms_gfields(g_filter_ds, g_filter_index, "id_hangsx", ""));
                    ms_sval("page_duoc_nhapkho_ct_hangsx", "value", ms_gfields(g_filter_ds, g_filter_index, "ten_hangsx", ""));
                    ms_sval("page_duoc_nhapkho_ct_dongiacu", "value", ms_gfields(g_filter_ds, g_filter_index, "dongiacu", "0"));
                    ms_sval("page_duoc_nhapkho_ct_dongiadgcu", "value", ms_gfields(g_filter_ds, g_filter_index, "dongiadgcu", "0"));
                    if (ms_gfields(g_filter_ds, g_filter_index, "donvidg", "") == "") {
                        ms_sval("page_duoc_nhapkho_ct_dongiadg", "value", "0");
                        ms_enable_arr("page_duoc_nhapkho_ct_dongiadg", false);
                    }
                    ms_focus_arr("page_duoc_nhapkho_ct_soluong");
                } else {
                    ms_sval("page_duoc_nhapkho_ct_tenthuoc", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_tenthuoc", "selectedvalue", "");
                    ms_sval("page_duoc_nhapkho_ct_sodk", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_ma", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_hoatchat", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_donvidg", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_donvisd", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_hangsx", "selectedvalue", "");
                    ms_sval("page_duoc_nhapkho_ct_hangsx", "value", "");
                    ms_enable_arr("page_duoc_nhapkho_ct_dongiadg", true);
                    ms_focus_arr("page_duoc_nhapkho_ct_tenthuoc");
                }
            }
            else {
                ms_sval("page_duoc_nhapkho_ct_sodk", "value", ms_gfields(g_filter_ds, g_filter_index, "sodk", ""));
                ms_sval("page_duoc_nhapkho_ct_ma", "value", ms_gfields(g_filter_ds, g_filter_index, "ma", ""));
                ms_sval("page_duoc_nhapkho_ct_hoatchat", "value", ms_gfields(g_filter_ds, g_filter_index, "hoatchat", ""));
                ms_sval("page_duoc_nhapkho_ct_donvidg", "value", ms_gfields(g_filter_ds, g_filter_index, "donvidg", ""));
                ms_sval("page_duoc_nhapkho_ct_donvisd", "value", ms_gfields(g_filter_ds, g_filter_index, "donvisd", "") == "" ? ms_gfields(g_filter_ds, g_filter_index, "dang", "") : ms_gfields(g_filter_ds, g_filter_index, "donvisd", ""));
                ms_sval("page_duoc_nhapkho_ct_hangsx", "selectedvalue", ms_gfields(g_filter_ds, g_filter_index, "id_hangsx", ""));
                ms_sval("page_duoc_nhapkho_ct_hangsx", "value", ms_gfields(g_filter_ds, g_filter_index, "ten_hangsx", ""));
                ms_sval("page_duoc_nhapkho_ct_dongiacu", "value", ms_gfields(g_filter_ds, g_filter_index, "dongiacu", "0"));
                ms_sval("page_duoc_nhapkho_ct_dongiadgcu", "value", ms_gfields(g_filter_ds, g_filter_index, "dongiadgcu", "0"));
                if (ms_gfields(g_filter_ds, g_filter_index, "donvidg", "") == "") {
                    ms_sval("page_duoc_nhapkho_ct_dongiadg", "value", "0");
                    ms_enable_arr("page_duoc_nhapkho_ct_dongiadg", false);
                }
                ms_focus_arr("page_duoc_nhapkho_ct_soluong");
            }
        },
        error: function (result) { }
    });
}


function f_filter_mathuoc_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_mathuoc", "1", "id", v_id_active, "ma", "f_filter_mathuoc_selected");
}

function f_filter_mathuoc() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "mathuocs",
            Col: "sodk~ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_mathuoc_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_mathuoc();
            return;
        }
    }
    ms_filter_load(v_ds, "sodk~ma~ten", "Số ĐK~Mã~Tên");
}

function f_filter_mathuoc_selected() {
    ms_sval("page_duoc_nhapkho_ct_tenthuoc", "value", ms_gfields(g_filter_ds, g_filter_index, "ten", ""));
    ms_sval("page_duoc_nhapkho_ct_tenthuoc", "selectedvalue", ms_gfields(g_filter_ds, g_filter_index, "id", ""));
    var v_dk = ms_gval("page_duoc_nhapkho_ct_idnhapkho_hidden", "value", "") + "~" + ms_gval("page_duoc_nhapkho_ct_tenthuoc", "selectedvalue", "");
    var data = { obj: "nhapkhocts", request: v_dk }
    $.ajax({
        type: "POST",
        url: "../Process/Check",
        data: data,
        success: function (result) {
            if (result == "True") {
                var r = confirm(ms_gval("page_duoc_nhapkho_ct_tenthuoc", "value", "") + " đã được cấp. \nBạn đồng ý cập nhật lại số liệu cũ ?");
                if (r == true) {
                    ms_sval("page_duoc_nhapkho_ct_sodk", "value", ms_gfields(g_filter_ds, g_filter_index, "sodk", ""));
                    ms_sval("page_duoc_nhapkho_ct_hoatchat", "value", ms_gfields(g_filter_ds, g_filter_index, "hoatchat", ""));
                    ms_sval("page_duoc_nhapkho_ct_donvidg", "value", ms_gfields(g_filter_ds, g_filter_index, "donvidg", ""));
                    ms_sval("page_duoc_nhapkho_ct_donvisd", "value", ms_gfields(g_filter_ds, g_filter_index, "donvisd", "") == "" ? ms_gfields(g_filter_ds, g_filter_index, "dang", "") : ms_gfields(g_filter_ds, g_filter_index, "donvisd", ""));
                    ms_sval("page_duoc_nhapkho_ct_hangsx", "selectedvalue", ms_gfields(g_filter_ds, g_filter_index, "id_hangsx", ""));
                    ms_sval("page_duoc_nhapkho_ct_hangsx", "value", ms_gfields(g_filter_ds, g_filter_index, "ten_hangsx", ""));
                    ms_sval("page_duoc_nhapkho_ct_dongiacu", "value", ms_gfields(g_filter_ds, g_filter_index, "dongiacu", "0"));
                    ms_sval("page_duoc_nhapkho_ct_dongiadgcu", "value", ms_gfields(g_filter_ds, g_filter_index, "dongiadgcu", "0"));
                    if (ms_gfields(g_filter_ds, g_filter_index, "donvidg", "") == "") {
                        ms_sval("page_duoc_nhapkho_ct_dongiadg", "value", "0");
                        ms_enable_arr("page_duoc_nhapkho_ct_dongiadg", false);
                    }
                    ms_focus_arr("page_duoc_nhapkho_ct_soluong");
                } else {
                    ms_sval("page_duoc_nhapkho_ct_tenthuoc", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_tenthuoc", "selectedvalue", "");
                    ms_sval("page_duoc_nhapkho_ct_sodk", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_ma", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_hoatchat", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_donvidg", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_donvisd", "value", "");
                    ms_sval("page_duoc_nhapkho_ct_hangsx", "selectedvalue", "");
                    ms_sval("page_duoc_nhapkho_ct_hangsx", "value", "");
                    ms_enable_arr("page_duoc_nhapkho_ct_dongiadg", true);
                    ms_focus_arr("page_duoc_nhapkho_ct_tenthuoc");
                }
            }
            else {
                ms_sval("page_duoc_nhapkho_ct_sodk", "value", ms_gfields(g_filter_ds, g_filter_index, "sodk", ""));
                ms_sval("page_duoc_nhapkho_ct_hoatchat", "value", ms_gfields(g_filter_ds, g_filter_index, "hoatchat", ""));
                ms_sval("page_duoc_nhapkho_ct_donvidg", "value", ms_gfields(g_filter_ds, g_filter_index, "donvidg", ""));
                ms_sval("page_duoc_nhapkho_ct_donvisd", "value", ms_gfields(g_filter_ds, g_filter_index, "donvisd", "") == "" ? ms_gfields(g_filter_ds, g_filter_index, "dang", "") : ms_gfields(g_filter_ds, g_filter_index, "donvisd", ""));
                ms_sval("page_duoc_nhapkho_ct_hangsx", "selectedvalue", ms_gfields(g_filter_ds, g_filter_index, "id_hangsx", ""));
                ms_sval("page_duoc_nhapkho_ct_hangsx", "value", ms_gfields(g_filter_ds, g_filter_index, "ten_hangsx", ""));
                ms_sval("page_duoc_nhapkho_ct_dongiacu", "value", ms_gfields(g_filter_ds, g_filter_index, "dongiacu", "0"));
                ms_sval("page_duoc_nhapkho_ct_dongiadgcu", "value", ms_gfields(g_filter_ds, g_filter_index, "dongiadgcu", "0"));
                if (ms_gfields(g_filter_ds, g_filter_index, "donvidg", "") == "") {
                    ms_sval("page_duoc_nhapkho_ct_dongiadg", "value", "0");
                    ms_enable_arr("page_duoc_nhapkho_ct_dongiadg", false);
                }
                ms_focus_arr("page_duoc_nhapkho_ct_soluong");
            }
        },
        error: function (result) { }
    });
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
            case "page_duoc_nhapkho_ct_donvidg":
            case "page_duoc_nhapkho_ct_donvisd":
            case "page_duoc_khaibaothuoc_dvt":
            case "page_duoc_khaibaothuoc_donvisd":
                ms_filter_hide();
                f_filter_donvi_show(aid);
                break;
                //nhapkho                
            case "page_duoc_nhapkho_ct_lydo":
            case "page_duoc_nhapkho_lydo":
                ms_filter_hide();
                f_filter_lydo_show(aid);
                break;
            case "page_duoc_nhapkho_ct_kho":
            case "page_duoc_nhapkho_kho":
                ms_filter_hide();
                f_filter_kho_show(aid);
                break;
            case "page_duoc_nhapkho_nhanvien":
                ms_filter_hide();
                f_filter_nhanvien_show(aid);
                break;
            case "page_duoc_khaibaothuoc_loaiduoc":
                ms_filter_hide();
                f_filter_loaiduoc_show(aid);
                break;
            case "page_duoc_nhapkho_ct_hangsx":
            case "page_duoc_khaibaothuoc_hangsx":
                ms_filter_hide();
                f_filter_hangsx_show(aid);
                break;
            case "page_duoc_khaibaothuoc_quocgia":
                ms_filter_hide();
                f_filter_quocgia_show(aid);
                break;
            case "page_duoc_nhapkho_ct_nhacc":
                ms_filter_hide();
                f_filter_nhacc_show(aid);
                break;
            case "page_duoc_nhapkho_ct_hoatchat":
                ms_filter_hide();
                f_filter_hoatchat_show(aid);
                break;
            case "page_duoc_nhapkho_ct_tenthuoc":
                ms_filter_hide();
                f_filter_thuoc_show(aid);
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
//Filter-End

//Input-Start
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
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_nhomkho_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
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
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_duongdung_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
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
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_dang_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
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
        case "page_duoc_nhapkho_ct_donvidg":
        case "page_duoc_nhapkho_ct_donvisd":
        case "page_duoc_khaibaothuoc_dvt":
        case "page_duoc_khaibaothuoc_donvisd":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_donvi_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_donvi_show(aid_active);
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
                    f_filter_donvi_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_khaibaothuoc_loaiduoc":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_loaiduoc_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_loaiduoc_show(aid_active);
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
                    f_filter_loaiduoc_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_nhapkho_ct_hangsx":
        case "page_duoc_khaibaothuoc_hangsx":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_hangsx_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_hangsx_show(aid_active);
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
                    f_filter_hangsx_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_khaibaothuoc_quocgia":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_quocgia_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_quocgia_show(aid_active);
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
                    f_filter_quocgia_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_nhapkho_ct_lydo":
        case "page_duoc_nhapkho_lydo":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_lydo_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
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
        case "page_duoc_nhapkho_ct_kho":
        case "page_duoc_nhapkho_kho":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_kho_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
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
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_nhanvien_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
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
        case "page_duoc_nhapkho_ct_nhacc":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_nhacc_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_nhacc_show(aid_active);
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
                    f_filter_nhacc_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_nhapkho_ct_tenthuoc":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_thuoc_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_thuoc_show(aid_active);
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
                    f_filter_thuoc_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_nhapkho_ct_ma":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_mathuoc_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_mathuoc_show(aid_active);
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
                    f_filter_mathuoc_show(aid_active);
                    break;
            }
            break;
        case "page_duoc_nhapkho_ct_hoatchat":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_hoatchat_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_hoatchat_show(aid_active);
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
                    f_filter_hoatchat_show(aid_active);
                    break;
            }
            break;
        default:
            break;
    }
}

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
                    ms_focus_arr("page_duoc_khaibaothuoc_sodk~page_duoc_khaibaothuoc_atccode~page_duoc_khaibaothuoc_hamluong~page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_loaiduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_ten");
                }
                break;
            case "page_duoc_khaibaothuoc_sodk":
                ms_focus_arr("page_duoc_khaibaothuoc_atccode~page_duoc_khaibaothuoc_hamluong~page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_loaiduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                break;
            case "page_duoc_khaibaothuoc_atccode":
                ms_focus_arr("page_duoc_khaibaothuoc_hamluong~page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_loaiduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                break;
            case "page_duoc_khaibaothuoc_hamluong":
                ms_focus_arr("page_duoc_khaibaothuoc_duongdung~page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_loaiduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                break;
            case "page_duoc_khaibaothuoc_duongdung":
                if (ms_gval("page_duoc_khaibaothuoc_duongdung", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_dang~page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_loaiduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_duongdung");
                }
                break;
            case "page_duoc_khaibaothuoc_dang":
                if (ms_gval("page_duoc_khaibaothuoc_dang", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_dvt~page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_loaiduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_dang");
                }
                break;
            case "page_duoc_khaibaothuoc_dvt":
                if (ms_gval("page_duoc_khaibaothuoc_dvt", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_donvisd~page_duoc_khaibaothuoc_loaiduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_dvt");
                }
                break;
            case "page_duoc_khaibaothuoc_donvisd":
                if (ms_gval("page_duoc_khaibaothuoc_donvisd", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_loaiduoc~page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_donvisd");
                }
                break;
            case "page_duoc_khaibaothuoc_loaiduoc":
                if (ms_gval("page_duoc_khaibaothuoc_loaiduoc", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_hangsx~page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_loaiduoc");
                }
                break;
            case "page_duoc_khaibaothuoc_hangsx":
                if (ms_gval("page_duoc_khaibaothuoc_hangsx", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_quocgia~page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_hangsx");
                }
                break;
            case "page_duoc_khaibaothuoc_quocgia":
                if (ms_gval("page_duoc_khaibaothuoc_quocgia", "selectedvalue", "") != "") {
                    ms_focus_arr("page_duoc_khaibaothuoc_thanhphan~page_duoc_khaibaothuoc_hoatchat");
                }
                else {
                    ms_focus_arr("page_duoc_khaibaothuoc_quocgia");
                }
                break;
            case "page_duoc_khaibaothuoc_thanhphan":
                ms_focus_arr("page_duoc_khaibaothuoc_hoatchat");
                break;
            case "page_duoc_khaibaothuoc_hoatchat":
                ms_focus_arr("page_duoc_khaibaothuoc_luu");
                break;
                //nhapkho                
            case "page_duoc_nhapkho_lydo":
                ms_focus_arr("page_duoc_nhapkho_kho~page_duoc_nhapkho_nhanvien~page_duoc_nhapkho_tim");
                break;
            case "page_duoc_nhapkho_kho":
                ms_focus_arr("page_duoc_nhapkho_nhanvien~page_duoc_nhapkho_tim");
                break;
            case "page_duoc_nhapkho_nhanvien":
                ms_focus_arr("page_duoc_nhapkho_tim");
                break;
            case "page_duoc_nhapkho_ct_lydo":
                if (ms_gval("page_duoc_nhapkho_ct_lydo", "selectedvalue", "") != "" && ms_gval("page_duoc_nhapkho_ct_lydo", "value", "") != "") {
                    ms_focus_arr("page_duoc_nhapkho_ct_ngayhd~page_duoc_nhapkho_ct_sohd~page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                }
                else {
                    ms_focus_arr("page_duoc_nhapkho_ct_lydo");
                }
                break;
            case "page_duoc_nhapkho_ct_ngayhd":
                ms_focus_arr("page_duoc_nhapkho_ct_sohd~page_duoc_nhapkho_ct_sotienhd~page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_sohd":
                ms_focus_arr("page_duoc_nhapkho_ct_sotienhd~page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_sotienhd":
                if (!isNaN(ms_to_int(ms_gval("page_duoc_nhapkho_ct_sotienhd", "value", "")))) {
                    ms_sval("page_duoc_nhapkho_ct_sotienhd", "value", ms_money(ms_to_decimal(ms_gval("page_duoc_nhapkho_ct_sotienhd", "value", "0").replace(',', ''))));
                    ms_focus_arr("page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                }
                else {
                    ms_focus_arr("page_duoc_nhapkho_ct_sotienhd");
                }
                break;
            case "page_duoc_nhapkho_ct_sophieu":
                ms_focus_arr("page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_ngayn":
                ms_focus_arr("page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_nguoigiao":
                ms_focus_arr("page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_kho":
                if (ms_gval("page_duoc_nhapkho_ct_kho", "selectedvalue", "") != "" && ms_gval("page_duoc_nhapkho_ct_kho", "value", "") != "") {
                    ms_focus_arr("page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                }
                else {
                    ms_focus_arr("page_duoc_nhapkho_ct_kho");
                }
                break;
            case "page_duoc_nhapkho_ct_nhacc":
                if (ms_gval("page_duoc_nhapkho_ct_nhacc", "selectedvalue", "") != "" && ms_gval("page_duoc_nhapkho_ct_nhacc", "value", "") != "") {
                    ms_focus_arr("page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                }
                else {
                    ms_focus_arr("page_duoc_nhapkho_ct_nhacc");
                }
                break;
            case "page_duoc_nhapkho_ct_ghichu":
                ms_focus_arr("page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_sodk":
                ms_focus_arr("page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_ma":
                ms_focus_arr("page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_tenthuoc":
                if (ms_gval("page_duoc_nhapkho_ct_tenthuoc", "selectedvalue", "") != "" && ms_gval("page_duoc_nhapkho_ct_tenthuoc", "value", "") != "") {
                    ms_focus_arr("page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                }
                else {
                    ms_focus_arr("page_duoc_nhapkho_ct_tenthuoc");
                }
                break;
            case "page_duoc_nhapkho_ct_hoatchat":
                ms_focus_arr("page_duoc_nhapkho_ct_donvidg~page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_donvidg":
                ms_focus_arr("page_duoc_nhapkho_ct_donvisd~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_donvisd":
                ms_focus_arr("page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_hangsx":
                if (ms_gval("page_duoc_nhapkho_ct_hangsx", "selectedvalue", "") != "" && ms_gval("page_duoc_nhapkho_ct_hangsx", "value", "") != "") {
                    ms_focus_arr("page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                }
                else {
                    ms_focus_arr("page_duoc_nhapkho_ct_hangsx");
                }
                break;
                break;
            case "page_duoc_nhapkho_ct_soluong":
                if (ms_gval("page_duoc_nhapkho_ct_soluong", "value", "") != "" && ms_gval("page_duoc_nhapkho_ct_soluong", "value", "") != "0") {
                    if (!isNaN(ms_gval("page_duoc_nhapkho_ct_soluong", "value", ""))) {
                        ms_focus_arr("page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                    }
                    else {
                        ms_focus_arr("page_duoc_nhapkho_ct_soluong");
                    }
                }
                else {
                    ms_focus_arr("page_duoc_nhapkho_ct_soluong");
                }
                break;
            case "page_duoc_nhapkho_ct_nhan":
                if (ms_gval("page_duoc_nhapkho_ct_nhan", "value", "") != "") {
                    if (ms_gval("page_duoc_nhapkho_ct_nhan", "value", "") == "0") {
                        ms_sval("page_duoc_nhapkho_ct_nhan", "value", "1");
                    }
                    else {
                        if (!isNaN(ms_gval("page_duoc_nhapkho_ct_nhan", "value", ""))) {
                            ms_sval("page_duoc_nhapkho_ct_bang", "value", ms_gval("page_duoc_nhapkho_ct_soluong", "value", "") * ms_gval("page_duoc_nhapkho_ct_nhan", "value", ""));
                            ms_focus_arr("page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                        }
                        else {
                            ms_focus_arr("page_duoc_nhapkho_ct_nhan");
                        }
                    }
                }
                else {
                    ms_sval("page_duoc_nhapkho_ct_nhan", "value", "1");
                    ms_sval("page_duoc_nhapkho_ct_bang", "value", ms_gval("page_duoc_nhapkho_ct_soluong", "value", "") * 1);
                    ms_focus_arr("page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                }
                break;
            case "page_duoc_nhapkho_ct_dongia":
                if (ms_gval("page_duoc_nhapkho_ct_dongia", "value", "") == "" || ms_gval("page_duoc_nhapkho_ct_dongia", "value", "") == "0") {
                    //ms_sval("page_duoc_nhapkho_ct_dongia", "value", "0");
                    ms_focus_arr("page_duoc_nhapkho_ct_dongia");
                }
                else {
                    if (!isNaN(ms_gval("page_duoc_nhapkho_ct_dongia", "value", ""))) {
                        ms_focus_arr("page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                    }
                    else {
                        ms_focus_arr("page_duoc_nhapkho_ct_dongia");
                    }
                }
                break;
            case "page_duoc_nhapkho_ct_dongiadg":
                if (ms_gval("page_duoc_nhapkho_ct_donvidg", "value", "") != "" && (ms_gval("page_duoc_nhapkho_ct_dongiadg", "value", "") == "" || ms_gval("page_duoc_nhapkho_ct_dongiadg", "value", "") == "0")) {
                    ms_focus_arr("page_duoc_nhapkho_ct_dongiadg");
                }
                else {
                    if (!isNaN(ms_gval("page_duoc_nhapkho_ct_dongiadg", "value", ""))) {
                        ms_focus_arr("page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                    }
                    else {
                        ms_focus_arr("page_duoc_nhapkho_ct_dongiadg");
                    }
                }
                break;
            case "page_duoc_nhapkho_ct_ck":
                if (ms_gval("page_duoc_nhapkho_ct_ck", "value", "") == "" || ms_gval("page_duoc_nhapkho_ct_ck", "value", "") == "%") {
                    ms_sval("page_duoc_nhapkho_ct_ck", "value", "0%");
                }
                ms_focus_arr("page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_vat":
                if (ms_gval("page_duoc_nhapkho_ct_vat", "value", "") == "" || ms_gval("page_duoc_nhapkho_ct_vat", "value", "") == "%") {
                    ms_sval("page_duoc_nhapkho_ct_vat", "value", "0%");
                }
                ms_focus_arr("page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_losx":
                ms_focus_arr("page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_ngaysx":
                ms_focus_arr("page_duoc_nhapkho_ct_handung");
                break;
            case "page_duoc_nhapkho_ct_handung":
                ms_focus_arr("page_duoc_nhapkho_ct_luu");
                //ms_focus_arr("page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiadg~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu");
                break;
            default:
                break;
        }
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
            f_save_kho();
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
            f_save_thuoc();
            break;
        case "page_duoc_khaibaothuoc_boqua":
            f_clear_arr("thuocs");
            ms_enable_arr("page_duoc_khaibaothuoc_sua", false);
            break;
        case "page_duoc_khaibaothuoc_ketthuc":
            window.location.href = "../Trangchu/index";
            break;
            //nhapkho
        case "page_duoc_nhapkho_tim":
            f_table_reload("nhapkhos");
            break;
        case "page_duoc_nhapkho_themmoi":
            f_tab_show("danhsach", "thonhtin");
            f_clear_arr("nhapkhos");
            f_clear_arr("nhapkhocts_thuoc");
            ms_enable_arr("page_duoc_nhapkho_ct_lydo~page_duoc_nhapkho_ct_ngayhd~page_duoc_nhapkho_ct_sohd~page_duoc_nhapkho_ct_sotienhd~page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu", true);
            ms_enable_arr("page_duoc_nhapkho_ct_xoa~page_duoc_nhapkho_ct_sua", false);
            ms_focus_arr("page_duoc_nhapkho_ct_lydo");
            break;
        case "page_duoc_nhapkho_ct_moi":
            f_clear_arr("nhapkhos");
            ms_enable_arr("page_duoc_nhapkho_ct_lydo~page_duoc_nhapkho_ct_ngayhd~page_duoc_nhapkho_ct_sohd~page_duoc_nhapkho_ct_sotienhd~page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu", true);
            ms_enable_arr("page_duoc_nhapkho_ct_xoa~page_duoc_nhapkho_ct_sua", false);
            ms_focus_arr("page_duoc_nhapkho_ct_lydo");
            break;
        case "page_duoc_nhapkho_ct_them":
            f_clear_arr("nhapkhocts_thuoc");
            ms_enable_arr("page_duoc_nhapkho_ct_moi", true);
            ms_focus_arr("page_duoc_nhapkho_ct_sodk");
            break;
        case "page_duoc_nhapkho_ct_sua":
            ctnhapkho_enable(true);
            ms_enable_arr("page_duoc_nhapkho_ct_lydo~page_duoc_nhapkho_ct_ngayhd~page_duoc_nhapkho_ct_sohd~page_duoc_nhapkho_ct_sotienhd~page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu", true);
            ms_enable_arr("page_duoc_nhapkho_ct_xoa", false);
            break;
        case "page_duoc_nhapkho_ct_xoa":
            f_gridview_del_record("nhapkhos", ms_gval("page_duoc_nhapkho_ct_idnhapkho", "value"));
            f_clear_arr("nhapkhos");
            ms_enable_arr("page_duoc_nhapkho_ct_sua", false);
            break;
        case "page_duoc_nhapkho_ct_luu":
            ms_enable_arr("page_duoc_nhapkho_ct_luu", false);
            f_save_nhapkho();
            break;
        case "page_duoc_nhapkho_ct_boqua":
            f_clear_arr("nhapkhocts_thuoc");
            ctnhapkho_enable(false);
            ms_enable_arr("page_duoc_nhapkho_ct_sua", true);
            break;
        case "page_duoc_nhapkho_ct_in":
            //f_clear_arr("nhapkhocts_thuoc");
            //ctnhapkho_enable(false);
            f_phieunhap_in();
            break;
        case "page_duoc_nhapkho_ct_ketthuc":
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
            case "page_duoc_khaibaothuoc_luu":
                ms_filter_get_selected();
                ms_filter_hide();
                break;
            case "page_duoc_nhapkho_ct_luu":
                ms_filter_get_selected();
                ms_filter_hide();
                break;
            case "page_duoc_nhapkho_tim":
                ms_filter_get_selected();
                ms_filter_hide();
                f_table_reload("nhapkhos");
                break;
            default:
                break;
        }
    }
}
//btn-End

//Action-Start
function f_save_kho() {
    try {
        var data;
        var url = "";
        if (ms_gval("page_duoc_khaibaokho_ten", "value") == "") {
            alert("Vui lòng nhập tên kho");
            ms_focus("page_duoc_khaibaokho_ten");
            return null;
        }
        data = {
            id: ms_gval("page_duoc_khaibaokho_ma", "selectedvalue"),
            ma: ms_gval("page_duoc_khaibaokho_ma", "value"),
            ten: ms_gval("page_duoc_khaibaokho_ten", "value"),
            id_nhomkho: ms_gval("page_duoc_khaibaokho_nhomkho", "selectedvalue"),
            ghichu: ms_gval("page_duoc_khaibaokho_ghichu", "value")
        };
        url = "Savekho";
        f_save_data(url, data);
    }
    catch (ex) {
        alert("Savekho Error");
    }
}

function f_save_thuoc() {
    try {
        var data;
        var url = "";
        if (ms_gval("page_duoc_khaibaothuoc_ten", "value") == "") {
            alert("Vui lòng nhập tên thuốc");
            ms_focus("page_duoc_khaibaothuoc_ten");
            return null;
        }
        if (ms_gval("page_duoc_khaibaothuoc_loaiduoc", "selectedvalue") == "") {
            alert("Vui lòng nhập nhóm thuốc");
            ms_focus("page_duoc_khaibaothuoc_loaiduoc");
            return null;
        }
        data = {
            ma: ms_gval("page_duoc_khaibaothuoc_ma", "value"),
            id: ms_gval("page_duoc_khaibaothuoc_ma", "selectedvalue"),
            ten: ms_gval("page_duoc_khaibaothuoc_ten", "value"),
            atc: ms_gval("page_duoc_khaibaothuoc_atccode", "value"),
            sodk: ms_gval("page_duoc_khaibaothuoc_sodk", "value"),
            ten_duongdung: ms_gval("page_duoc_khaibaothuoc_duongdung", "value"),
            id_duongdung: ms_gval("page_duoc_khaibaothuoc_duongdung", "selectedvalue"),
            hamluong: ms_gval("page_duoc_khaibaothuoc_hamluong", "value"),
            dang: ms_gval("page_duoc_khaibaothuoc_dang", "value"),
            donvidg: ms_gval("page_duoc_khaibaothuoc_dvt", "value"),
            donvisd: ms_gval("page_duoc_khaibaothuoc_donvisd", "value"),
            id_loaiduoc: ms_gval("page_duoc_khaibaothuoc_loaiduoc", "selectedvalue"),
            id_hangsx: ms_gval("page_duoc_khaibaothuoc_hangsx", "selectedvalue"),
            id_quocgia: ms_gval("page_duoc_khaibaothuoc_quocgia", "selectedvalue"),
            thanhphan: ms_gval("page_duoc_khaibaothuoc_thanhphan", "value"),
            hoatchat: ms_gval("page_duoc_khaibaothuoc_hoatchat", "value")
        };
        url = "SaveThuoc";
        f_save_data(url, data);

    }
    catch (ex) {
        alert("SaveThuoc Error");
    }
}

function f_save_nhapkho() {
    try {
        var data;
        var url = "";
        if (ms_gval("page_duoc_nhapkho_ct_lydo", "selectedvalue", "") == "") {
            alert("Vui lòng chọn lý do nhập");
            ms_focus("page_duoc_nhapkho_ct_lydo");
            return null;
        }
        if (ms_gval("page_duoc_nhapkho_ct_kho", "selectedvalue", "") == "") {
            alert("Vui lòng chọn kho nhập");
            ms_focus("page_duoc_nhapkho_ct_kho");
            return null;
        }
        if (ms_gval("page_duoc_nhapkho_ct_tenthuoc", "selectedvalue", "") != "") {
            if (ms_gval("page_duoc_nhapkho_ct_dongia", "value") == "") {
                alert("Vui lòng nhập giá");
                ms_focus("page_duoc_nhapkho_ct_dongia");
                return null;
            }
        }
        data = {
            id: ms_gval("page_duoc_nhapkho_ct_id_hidden", "value", ""),
            idnhapkho: ms_gval("page_duoc_nhapkho_ct_idnhapkho_hidden", "value", ""),
            idlydonx: ms_gval("page_duoc_nhapkho_ct_lydo", "selectedvalue", ""),
            idnhacc: ms_gval("page_duoc_nhapkho_ct_nhacc", "selectedvalue", ""),
            idkho: ms_gval("page_duoc_nhapkho_ct_kho", "selectedvalue", ""),
            ngay: ms_gval("page_duoc_nhapkho_ct_ngay", "value", ""),
            ngayhd: ms_gval("page_duoc_nhapkho_ct_ngayhd", "value", ""),
            sohd: ms_gval("page_duoc_nhapkho_ct_sohd", "value", ""),
            sotienhd: ms_to_decimal(ms_gval("page_duoc_nhapkho_ct_sotienhd", "value", "0")),
            ngaynhan: ms_gval("page_duoc_nhapkho_ct_ngayn", "value", ""),
            sophieu: ms_gval("page_duoc_nhapkho_ct_sophieu", "value", ""),
            nguoigiao: ms_gval("page_duoc_nhapkho_ct_nguoigiao", "value", ""),
            ghichu: ms_gval("page_duoc_nhapkho_ct_ghichu", "value", ""),
            idduoc: ms_gval("page_duoc_nhapkho_ct_tenthuoc", "selectedvalue", ""),
            losx: ms_gval("page_duoc_nhapkho_ct_losx", "value", ""),
            ngaysx: ms_gval("page_duoc_nhapkho_ct_ngaysx", "value", ""),
            handung: ms_gval("page_duoc_nhapkho_ct_handung", "value", ""),
            soluongsd: ms_gval("page_duoc_nhapkho_ct_soluong", "value", ""),
            soluongdg: ms_gval("page_duoc_nhapkho_ct_nhan", "value", ""),
            soluongn: ms_gval("page_duoc_nhapkho_ct_bang", "value", ""),
            dongia: ms_gval("page_duoc_nhapkho_ct_dongia", "value", ""),
            dongiadg: ms_gval("page_duoc_nhapkho_ct_dongiadg", "value", ""),
            chietkhau: ms_gval("page_duoc_nhapkho_ct_ck", "value", "0").toString().replace("%", ""),
            vat: ms_gval("page_duoc_nhapkho_ct_vat", "value", "0").toString().replace("%", ""),
        };
        url = "SaveNhapkho";
        f_save_data(url, data);

    }
    catch (ex) {
        alert("SaveNhapkho Error");
    }
}
//Action-End

//Show-Start
function f_clear_arr(v_obj) {
    try {
        switch (v_obj) {
            case "khos":
                f_dmkho_show(null, 0, true);
                break;
            case "thuocs":
                f_dmthuoc_show(null, 0, true);
                break;
            case "nhapkhos":
                f_ctnhapkho_show(null, 0, true);
                break;
            case "nhapkhocts_thuoc":
                f_ctnhapkho_duoc_show(null, 0, true);
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
    ms_sval("page_duoc_khaibaothuoc_dang", "value", ms_gfields(v_ds, v_index, "dang", ""));
    ms_sval("page_duoc_khaibaothuoc_dvt", "value", ms_gfields(v_ds, v_index, "donvidg", ""));
    ms_sval("page_duoc_khaibaothuoc_donvisd", "value", ms_gfields(v_ds, v_index, "donvisd", ""));
    ms_sval("page_duoc_khaibaothuoc_loaiduoc", "value", ms_gfields(v_ds, v_index, "ten_loaiduoc", ""));
    ms_sval("page_duoc_khaibaothuoc_loaiduoc", "selectedvalue", ms_gfields(v_ds, v_index, "id_loaiduoc", ""));
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

function f_ctnhapkho_show(v_ds, v_index, v_bool) {
    var date = new Date();
    var defaultdate = ms_lpad(date.getDate(), 2, '0') + "/" + ms_lpad(date.getMonth() + 1, 2, '0') + "/" + date.getFullYear();
    ms_sval("page_duoc_nhapkho_ct_idnhapkho_hidden", "value", ms_gfields(v_ds, v_index, "id", ""));
    ms_sval("page_duoc_nhapkho_ct_lydo", "value", ms_gfields(v_ds, v_index, "tenlydonx", ""));
    ms_sval("page_duoc_nhapkho_ct_lydo", "selectedvalue", ms_gfields(v_ds, v_index, "idlydonx", ""));
    ms_sval("page_duoc_nhapkho_ct_ngayhd", "value", ms_gfields(v_ds, v_index, "ngayhd", ""));
    ms_sval("page_duoc_nhapkho_ct_sohd", "value", ms_gfields(v_ds, v_index, "sohd", ""));
    ms_sval("page_duoc_nhapkho_ct_sotienhd", "value", ms_money(ms_to_decimal(ms_gfields(v_ds, v_index, "sotienhd", ""))));
    ms_sval("page_duoc_nhapkho_ct_ngayn", "value", ms_gfields(v_ds, v_index, "ngayn", ""));
    ms_sval("page_duoc_nhapkho_ct_sophieu", "value", ms_gfields(v_ds, v_index, "sophieu", ""));
    ms_sval("page_duoc_nhapkho_ct_nguoigiao", "value", ms_gfields(v_ds, v_index, "nguoigiao", ""));
    ms_sval("page_duoc_nhapkho_ct_kho", "value", ms_gfields(v_ds, v_index, "tenkho", ""));
    ms_sval("page_duoc_nhapkho_ct_kho", "selectedvalue", ms_gfields(v_ds, v_index, "idkho", ""));
    ms_sval("page_duoc_nhapkho_ct_nhacc", "value", ms_gfields(v_ds, v_index, "tennhacc", ""));
    ms_sval("page_duoc_nhapkho_ct_nhacc", "selectedvalue", ms_gfields(v_ds, v_index, "idnhacc", ""));
    ms_sval("page_duoc_nhapkho_ct_ghichu", "value", ms_gfields(v_ds, v_index, "ghichu", ""));
    ms_sval("page_duoc_nhapkho_ct_sotien", "value", ms_money(ms_to_decimal(ms_gfields(v_ds, v_index, "sotien", ""))));
    ms_sval("page_duoc_nhapkho_ct_sotientruck", "value", ms_money(ms_gfields(v_ds, v_index, "sotien", "") - ms_gfields(v_ds, v_index, "sotien", "") * ms_gfields(v_ds, v_index, "chietkhau", "") / 100));
    ms_sval("page_duoc_nhapkho_ct_sotientruckcongvat", "value", ms_money(ms_gfields(v_ds, v_index, "sotien", "") - ms_gfields(v_ds, v_index, "sotien", "") * ms_gfields(v_ds, v_index, "chietkhau", "") / 100 + ms_gfields(v_ds, v_index, "sotien", "") * ms_gfields(v_ds, v_index, "vat", "") / 100));
    if (ms_gval("page_duoc_nhapkho_ct_ngayhd", "value", "") == "") {
        ms_sval("page_duoc_nhapkho_ct_ngayhd", "value", defaultdate);
    }
    if (ms_gval("page_duoc_nhapkho_ct_ngayn", "value", "") == "") {
        ms_sval("page_duoc_nhapkho_ct_ngayn", "value", defaultdate);
    }
    if (v_ds != null && v_ds.Rows.length > 0) {
        $("#page_duoc_nhapkho_ct_ds").html(f_create_table_html("nhapkhocts", JSON.stringify(v_ds.Rows[v_index].nhapkhocts), "page_duoc_nhapkho_ct_ds", "Số ĐK~Mã~Tên thuốc~Đơn vị đóng gói~Đơn vị sử dụng~Ngày SX~Hạn dùng~Đơn giá~Số lượng nhập~Số tiền", "sodk~ma~tenduoc~donvidg~donvisd~ngaysx~handung~dongia~soluongn~sotien", false, "delete"));
    }
    else {
        $("#page_duoc_nhapkho_ct_ds").html(f_create_table_html("nhapkhocts", "[]", "page_duoc_nhapkho_ct_ds", "Số ĐK~Mã~Tên thuốc~Đơn vị đóng gói~Đơn vị sử dụng~Ngày SX~Hạn dùng~Đơn giá~Số lượng nhập~Số tiền", "sodk~ma~tenduoc~donvidg~donvisd~ngaysx~handung~dongia~soluongn~sotien", false, "delete"));
    }
    $('#page_duoc_nhapkho_ct_ds_gidview').DataTable();
    $('#page_duoc_nhapkho_ct_ds_gidview').parent().css({ "max-height": "350px", "overflow": "scroll" });
    $("#page_duoc_nhapkho_ct_ds_gidview_wrapper").children().last().find("#page_duoc_nhapkho_ct_ds_gidview_paginate").css({ "display": "none" });
    $("#page_duoc_nhapkho_ct_ds_gidview_wrapper").children().first().find("#page_duoc_nhapkho_ct_ds_gidview_length").css({ "display": "none" });
    ctnhapkho_enable(v_bool);
}

function f_ctnhapkho_duoc_show(v_ds, v_index, v_bool) {
    ctnhapkho_enable(v_bool);
    ms_enable_arr("page_duoc_nhapkho_ct_xoa~page_duoc_nhapkho_ct_sua", !v_bool);
    ms_sval("page_duoc_nhapkho_ct_id_hidden", "value", ms_gfields(v_ds, v_index, "id", ""));
    ms_sval("page_duoc_nhapkho_ct_sodk", "value", ms_gfields(v_ds, v_index, "sodk", ""));
    ms_sval("page_duoc_nhapkho_ct_ma", "value", ms_gfields(v_ds, v_index, "ma", ""));
    ms_sval("page_duoc_nhapkho_ct_tenthuoc", "value", ms_gfields(v_ds, v_index, "tenduoc", ""));
    ms_sval("page_duoc_nhapkho_ct_tenthuoc", "selectedvalue", ms_gfields(v_ds, v_index, "idduoc", ""));
    ms_sval("page_duoc_nhapkho_ct_hoatchat", "value", ms_gfields(v_ds, v_index, "hoatchat", ""));
    ms_sval("page_duoc_nhapkho_ct_hangsx", "value", ms_gfields(v_ds, v_index, "tenhangsx", ""));
    ms_sval("page_duoc_nhapkho_ct_hangsx", "selectedvalue", ms_gfields(v_ds, v_index, "idhangsx", ""));
    ms_sval("page_duoc_nhapkho_ct_soluong", "value", ms_to_decimal(ms_gfields(v_ds, v_index, "soluongsd", "")));
    ms_sval("page_duoc_nhapkho_ct_nhan", "value", ms_to_decimal(ms_gfields(v_ds, v_index, "soluongdg", "")));
    ms_sval("page_duoc_nhapkho_ct_bang", "value", ms_to_decimal(ms_gfields(v_ds, v_index, "soluongn", "")));
    ms_sval("page_duoc_nhapkho_ct_dongia", "value", ms_to_decimal(ms_gfields(v_ds, v_index, "dongia", "")));
    ms_sval("page_duoc_nhapkho_ct_dongiadg", "value", ms_to_decimal(ms_gfields(v_ds, v_index, "dongiadg", "")));
    ms_sval("page_duoc_nhapkho_ct_ck", "value", ms_gfields(v_ds, v_index, "chietkhau", "") + "%");
    ms_sval("page_duoc_nhapkho_ct_vat", "value", ms_gfields(v_ds, v_index, "vat", "") + "%");
    ms_sval("page_duoc_nhapkho_ct_dongiacu", "value", ms_to_decimal(ms_gfields(v_ds, v_index, "dongiacu", "")));
    ms_sval("page_duoc_nhapkho_ct_dongiadgcu", "value", ms_to_decimal(ms_gfields(v_ds, v_index, "dongiadgcu", "")));
    ms_sval("page_duoc_nhapkho_ct_losx", "value", ms_gfields(v_ds, v_index, "losx", ""));
    ms_sval("page_duoc_nhapkho_ct_ngaysx", "value", ms_gfields(v_ds, v_index, "ngaysx", ""));
    ms_sval("page_duoc_nhapkho_ct_handung", "value", ms_gfields(v_ds, v_index, "handung", ""));
    ms_sval("page_duoc_nhapkho_ct_dongiacu", "value", ms_gfields(v_ds, v_index, "dongiacu", "0"));
    ms_sval("page_duoc_nhapkho_ct_dongiadgcu", "value", ms_gfields(v_ds, v_index, "dongiadgcu", "0"));
}
//Show-End

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

function ctnhapkho_enable(v_bool) {
    ms_enable_arr(ctnhapkho_input + "~page_duoc_nhapkho_ct_luu", v_bool);
    ms_enable_arr("page_duoc_nhapkho_ct_boqua~page_duoc_nhapkho_ct_sua~page_duoc_nhapkho_ct_xoa", v_bool);
    ms_enable_arr("page_duoc_nhapkho_ct_moi~page_duoc_nhapkho_ct_them~page_duoc_nhapkho_ct_moi~page_duoc_nhapkho_ct_in", !v_bool);

    ms_enable_arr("page_duoc_nhapkho_ct_lydo~page_duoc_nhapkho_ct_ngayhd~page_duoc_nhapkho_ct_sohd~page_duoc_nhapkho_ct_sotienhd~page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ghichu", false);
    ms_enable_arr("page_duoc_nhapkho_ct_sotien~page_duoc_nhapkho_ct_sotientruck~page_duoc_nhapkho_ct_sotientruckcongvat~page_duoc_nhapkho_ct_thanhtienck~page_duoc_nhapkho_ct_thanhtienvat~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_dongiadgcu", false);
}
//Enable-End

//Print-Start
function f_phieunhap_in() {
    var page = window.open("", "_blank", "");
    var content = "";

    content += ms_grid_html_header("Phiếu nhập kho");
    page.document.writeln(content);
    content = "";

    content += "<div class = \"container-fluid\">";

    content += "<div class = \"row\" style = \"padding: 20px 0px; font-size:12pt;\">";
    content += "<div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:left\">" + $("#ls_tencoso").html() + "</div>";
    content += "<div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:center\">CỘNG HÒA XÃ HỘI CHŨ NGHĨA VIỆT NAM<br />Độc lập - Tự do - Hạnh phúc</div>";
    content += "<div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:right\">Số phiếu nhập :" + ms_gval("page_duoc_nhapkho_ct_sophieu", "value", "") + "</div>";
    content += "</div>";

    content += "<div class = \"row\" style = \"padding: 20px 0px; font-size:18pt;\">";
    content += "<div class = \"col-lg-12 col-md-12 col-sm-12 col-xs-12\" style =\"text-align:center; text-transform: uppercase;\"><b>PHIẾU NHẬP KHO</b><br /><font style =\"font-size:12pt;\">Ngày :&nbsp;" + ms_gval("page_duoc_nhapkho_ct_ngayn", "value", "") + "</font></div>";
    content += "</div>";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-12 col-md-12 col-sm-12 col-xs-12\" style =\"\"><b>Người giao:</b>&nbsp;" + ms_gval("page_duoc_nhapkho_ct_nguoigiao", "value", "") + "</div>";
    content += "</div>";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-3 col-md-3 col-sm-3 col-xs-3\" style =\"\"><b>Số hóa đơn:</b>&nbsp;" + ms_gval("page_duoc_nhapkho_ct_sohd", "value", "") + "</div>";
    content += "<div class = \"col-lg-3 col-md-3 col-sm-3 col-xs-3\" style =\"\"><b>Ngày hóa đơn:</b>&nbsp;" + ms_gval("page_duoc_nhapkho_ct_ngayhd", "value", "") + "</div>";
    content += "<div class = \"col-lg-3 col-md-3 col-sm-3 col-xs-3\" style =\"\"><b>Số tiền hóa đơn:</b>&nbsp;" + ms_gval("page_duoc_nhapkho_ct_sotienhd", "value", "") + "&nbsp;VNĐ</div>";
    content += "</div>";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-12 col-md-12 col-sm-12 col-xs-12\" style =\"\"><b>Nhà cung cấp:</b>&nbsp;" + ms_gval("page_duoc_nhapkho_ct_nhacc", "value", "") + "</div>";
    content += "</div>";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-12 col-md-12 col-sm-12 col-xs-12\" style =\"\"><b>Kho nhập :</b>&nbsp;" + ms_gval("page_duoc_nhapkho_ct_kho", "value", "") + "</div>";
    content += "</div>";

    content += "<br />";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-12 col-md-12 col-sm-12 col-xs-12\" style =\"\">";
    content += "<table class=\"table table-sm\" width=\"100%\" cellpadding =\"0\" cellspacing= \"0\" style = \"font-size:10pt;border: 2px solid #ccc\">";//table-sm table-striped no-footer table-borderless
    content += "<thead>";
    content += "<tr>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Số thứ tự</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Tên sản phẩm</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Đơn vị</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Mã thuốc</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Số đăng ký</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Lô sx</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Hạn dùng</th>";
    content += "<th class = \"ms_dcell_c\" colspan = \"2\">Số lượng</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Đơn giá</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Chiết khấu</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Đơn giá(VAT)</th>";
    content += "<th class = \"ms_dcell_c\" rowspan = \"2\">Thành tiền(VAT)</th>";
    content += "</tr>";
    content += "<tr>";
    content += "<th class = \"ms_dcell_c\">Chứng từ</th>";
    content += "<th class = \"ms_dcell_c\">Thực tế</th>";
    content += "</tr>";
    content += "</thead>"
    content += "<tbody>";
    if (m_grid_ds != null && m_grid_ds.Rows.length > 0) {
        var t_tongcong = 0;
        for (var i = 0; i < m_grid_ds.Rows.length; i++) {
            content += "<tr>";
            content += "<td class = \"cm_dcell\">" + (i + 1) + "</td>";
            content += "<td class = \"cm_dcell\">" + ms_gfields(m_grid_ds, i, "tenduoc", "") + "</td>";
            content += "<td class = \"cm_dcell\">" + ms_gfields(m_grid_ds, i, "donvisd", "") + "</td>";
            content += "<td class = \"cm_dcell\">" + ms_gfields(m_grid_ds, i, "ma", "") + "</td>";
            content += "<td class = \"cm_dcell\">" + ms_gfields(m_grid_ds, i, "sodk", "") + "</td>";
            content += "<td class = \"cm_dcell\">" + ms_gfields(m_grid_ds, i, "losx", "") + "</td>";
            content += "<td class = \"cm_dcell\">" + ms_gfields(m_grid_ds, i, "handung", "") + "</td>";
            content += "<td class = \"cm_dcell_r\">" + ms_gfields(m_grid_ds, i, "soluongn", "") + "</td>";
            content += "<td class = \"cm_dcell_r\">" + ms_gfields(m_grid_ds, i, "soluongn", "") + "</td>";
            content += "<td class = \"cm_dcell_r\">" + ms_money(ms_to_decimal(ms_gfields(m_grid_ds, i, "dongia", "0"))) + "</td>";
            content += "<td class = \"cm_dcell_r\">" + ms_gfields(m_grid_ds, i, "chietkhau", "0") + "%</td>";
            content += "<td class = \"cm_dcell_r\">" + ms_money(ms_to_decimal(ms_gfields(m_grid_ds, i, "dongia", "")) + ms_to_decimal(ms_gfields(m_grid_ds, i, "dongia", "") * ms_gfields(m_grid_ds, i, "vat", "") / 100)) + "</td>";
            content += "<td class = \"cm_dcell_r\">" + ms_money(ms_gfields(m_grid_ds, i, "soluongn", "") * (ms_to_decimal(ms_gfields(m_grid_ds, i, "dongia", "")) + ms_to_decimal(ms_gfields(m_grid_ds, i, "dongia", "") * ms_gfields(m_grid_ds, i, "vat", "") / 100))) + "</td>";
            content += "</tr>";
            t_tongcong += ms_to_decimal(ms_gfields(m_grid_ds, i, "soluongn", "")) * (ms_to_decimal(ms_gfields(m_grid_ds, i, "dongia", "")) + ms_to_decimal(ms_gfields(m_grid_ds, i, "dongia", "") * ms_gfields(m_grid_ds, i, "vat", "") / 100))
        }
        content += "<tr>";
        content += "<td class = \"cm_dcell_c\" colspan = \"12\" style = \"text-transform:uppercase;text-align: center;\" ><b>Tổng cộng:</b></td><td class = \"cm_dcell_r\"><b>" + ms_money(t_tongcong) + "</b></td>";
        content += "</tr>";
    }
    else {
        content += "<tr><td>Không thể lấy được dữ liệu</td></tr>";
    }
    content += "</tbody>";
    content += "</table>";
    content += "</div>";
    content += "</div>";

    content += "<br />";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-12 col-md-12 col-sm-12 col-xs-12\" style =\"\">Thành tiền :&nbsp;<b>" + ms_money(t_tongcong) + "</b></div>";
    content += "</div>";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-12 col-md-12 col-sm-12 col-xs-12\" style =\"\">Bằng chữ :&nbsp;<b>" + DocTienBangChu(t_tongcong) + "</b></div>";
    content += "</div>";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-8 col-md-8 col-sm-8 col-xs-8\" style =\"\"></div><div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:center\">Ngày ... Tháng ... Năm 20...</div>";
    content += "</div>";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:center;text-transform:uppercase;\"><b>Người lập</b></div>";
    content += "<div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:center;text-transform:uppercase;\"><b>Ngươi giao hàng</b></div>";
    content += "<div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:center;text-transform:uppercase;\"><b>Thủ kho</b></div>";
    content += "</div>";

    content += "<div class = \"row\" style = \"font-size:10pt;\">";
    content += "<div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:center;\">(Ký, họ tên)</div>";
    content += "<div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:center;\">(Ký, họ tên)</div>";
    content += "<div class = \"col-lg-4 col-md-4 col-sm-4 col-xs-4\" style =\"text-align:center;\">(Ký, họ tên)</div>";
    content += "</div>";

    content += "</div>";
    page.document.writeln(content);
    content = "";
    page.document.close();
    //$.ajax({
    //    type: "POST",
    //    url: "../Process/Check",
    //    data: data,
    //    success: function (result) {
    //        var page = window.open("", "_blank", "");
    //        page.document.writeln(content);
    //        content = "";
    //        page.document.close();
    //    },
    //    error: function (result) { }
    //});        
}
//Print_End