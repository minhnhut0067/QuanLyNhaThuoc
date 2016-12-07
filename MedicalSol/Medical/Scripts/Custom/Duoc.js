jQuery(document).ready(function () {

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
var ctnhapkho_input = "page_duoc_nhapkho_ct_ngay~page_duoc_nhapkho_ct_lydo~page_duoc_nhapkho_ct_ngayhd~page_duoc_nhapkho_ct_sohd~page_duoc_nhapkho_ct_kho~page_duoc_nhapkho_ct_nhacc~page_duoc_nhapkho_ct_ngayn~page_duoc_nhapkho_ct_sophieu~page_duoc_nhapkho_ct_ngaykn~page_duoc_nhapkho_ct_sokn~page_duoc_nhapkho_ct_nguoigiao~page_duoc_nhapkho_ct_ghichu~page_duoc_nhapkho_ct_sodk~page_duoc_nhapkho_ct_ma~page_duoc_nhapkho_ct_tenthuoc~page_duoc_nhapkho_ct_hoatchat~page_duoc_nhapkho_ct_hangsx~page_duoc_nhapkho_ct_losx~page_duoc_nhapkho_ct_ngaysx~page_duoc_nhapkho_ct_handung~page_duoc_nhapkho_ct_soluong~page_duoc_nhapkho_ct_nhan~page_duoc_nhapkho_ct_bang~page_duoc_nhapkho_ct_dongia~page_duoc_nhapkho_ct_dongiacu~page_duoc_nhapkho_ct_ck~page_duoc_nhapkho_ct_thanhtienck~page_duoc_nhapkho_ct_vat~page_duoc_nhapkho_ct_thanhtienvat";
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

            case "page_duoc_khaibaothuoc_dvt":
            case "page_duoc_khaibaothuoc_donvisd":
                ms_filter_hide();
                f_filter_donvi_show(aid);
                break;
                //nhapkho
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
            case "page_duoc_khaibaothuoc_loaiduoc":
                ms_filter_hide();
                f_filter_loaiduoc_show(aid);
                break;
            case "page_duoc_khaibaothuoc_hangsx":
                ms_filter_hide();
                f_filter_hangsx_show(aid);
                break;
            case "page_duoc_khaibaothuoc_quocgia":
                ms_filter_hide();
                f_filter_quocgia_show(aid);
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
            f_save_thuoc();
            break;
        case "page_duoc_khaibaothuoc_boqua":
            f_clear_arr("thuocs");
            ms_enable_arr("page_duoc_khaibaothuoc_sua", false);
            break;
        case "page_duoc_khaibaothuoc_ketthuc":
            window.location.href = "../Trangchu/index";
            break;
        case "page_duoc_nhapkho_tim":
            f_table_reload("nhapkhos");
            break;
        case "page_duoc_nhapkho_themmoi":
            f_tab_show("danhsach", "chitiet");
            f_clear_arr("nhapkhos");
            ms_enable_arr("page_duoc_nhapkho_ct_sua", false);
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

function nhapkho_enable(v_bool) {
    ms_enable_arr(ctnhapkho_input + "~page_duoc_nhapkho_ct_luu", v_bool);
    ms_enable_arr("page_duoc_nhapkho_ct_boqua~page_duoc_nhapkho_ct_sua~page_duoc_nhapkho_ct_xoa", v_bool);
    ms_enable_arr("page_duoc_nhapkho_ct_themmoi", !v_bool);

    ms_enable_arr("page_duoc_nhapkho_ct_sotien~page_duoc_nhapkho_ct_sotientruck~page_duoc_nhapkho_ct_sotientruckcongvat~page_duoc_nhapkho_ct_dongiacu", false);
}
//Enable-End

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
//Action-End

//Show-Start
function f_clear_arr(v_obj) {
    try {
        switch (v_obj) {
            case "khos":
                f_dmkho_show(null, 0, false);
                break;
            case "thuocs":
                f_dmthuoc_show(null, 0, false);
                break;
            case "nhapkhos":
                f_nhapkho_show(null, 0, false);
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

function f_nhapkho_show(v_ds, v_index, v_bool) {
    ms_sval("page_duoc_nhapkho_ct_ngay", "value", ms_gfields(v_ds, v_index, "ngay", ""));
    ms_sval("page_duoc_nhapkho_ct_lydo", "value", ms_gfields(v_ds, v_index, "tenlydonx", ""));
    ms_sval("page_duoc_nhapkho_ct_lydo", "selectedvalue", ms_gfields(v_ds, v_index, "idlydonx", ""));
    ms_sval("page_duoc_nhapkho_ct_ngayhd", "value", ms_gfields(v_ds, v_index, "ngayhd", ""));
    ms_sval("page_duoc_nhapkho_ct_sohd", "value", ms_gfields(v_ds, v_index, "sohd", ""));
    ms_sval("page_duoc_nhapkho_ct_kho", "value", ms_gfields(v_ds, v_index, "tenkho", ""));
    ms_sval("page_duoc_nhapkho_ct_kho", "selectedvalue", ms_gfields(v_ds, v_index, "idkho", ""));
    ms_sval("page_duoc_nhapkho_ct_nhacc", "value", ms_gfields(v_ds, v_index, "tennhacc", ""));
    ms_sval("page_duoc_nhapkho_ct_nhacc", "selectedvalue", ms_gfields(v_ds, v_index, "idnhacc", ""));
    ms_sval("page_duoc_nhapkho_ct_ngayn", "value", ms_gfields(v_ds, v_index, "ngayn", ""));
    ms_sval("page_duoc_nhapkho_ct_sophieu", "value", ms_gfields(v_ds, v_index, "sophieu", ""));
    ms_sval("page_duoc_nhapkho_ct_ngaykn", "value", ms_gfields(v_ds, v_index, "ngaykn", ""));
    ms_sval("page_duoc_nhapkho_ct_sokn", "value", ms_gfields(v_ds, v_index, "spkn", ""));
    ms_sval("page_duoc_nhapkho_ct_nguoigiao", "value", ms_gfields(v_ds, v_index, "nguoigiao", ""));
    ms_sval("page_duoc_nhapkho_ct_ghichu", "value", ms_gfields(v_ds, v_index, "ghichu", ""));
    //ms_sval("page_duoc_nhapkho_ct_sodk", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_ma", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_tenthuoc", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_hoatchat", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_hangsx", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_losx", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_ngaysx", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_handung", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_soluong", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_nhan", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_bang", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_dongia", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_dongiacu", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_ck", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_thanhtienck", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_vat", "value", ms_gfields(v_ds, v_index, "ma", ""));
    //ms_sval("page_duoc_nhapkho_ct_thanhtienvat", "value", ms_gfields(v_ds, v_index, "ma", ""));
    nhapkho_enable(v_bool);
}
//Show-End