jQuery(document).ready(function () {

    //$('#page_duoc_nhapkho_gidview').DataTable();
    //$('#page_duoc_nhapkho_gidview').parent().css("overflow-x", "scroll");

    //$('#page_duoc_nhapkho_gidview_ct').DataTable();
    //$('#page_duoc_nhapkho_gidview_ct').parent().css("overflow-x", "scroll");

});
var strdatafilter = "";
var filter_ds = null;
var khaibaophongban_input = "page_nhansu_khaibaophongban_ma~page_nhansu_khaibaophongban_ten~page_nhansu_khaibaophongban_ghichu";
var khaibaonhanvien_input = "page_nhansu_khaibaonhanvien_id~page_nhansu_khaibaonhanvien_hoten~page_nhansu_khaibaonhanvien_phai~page_nhansu_khaibaonhanvien_ngaysinh~page_nhansu_khaibaonhanvien_namsinh~page_nhansu_khaibaonhanvien_sdt~page_nhansu_khaibaonhanvien_email~page_nhansu_khaibaonhanvien_diachi~page_nhansu_khaibaonhanvien_phongban~page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong";
//Filter-End

function f_filter_phai_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_phai", "1", "id", v_id_active, "ten", "f_filter_phai_selected");
}

function f_filter_phai() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "dmphais",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_phai_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_phai();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
    //g_filter_cur_val = "";
}

function f_filter_phai_selected() {
}


function f_filter_phongban_show(v_id_active) {
    strdatafilter = ms_gval(v_id_active + "_val", "value", "");
    ms_filter_show(v_id_active, "0", "f_filter_phongban", "1", "id", v_id_active, "ten", "f_filter_phongban_selected");
}

function f_filter_phongban() {
    var atext = ms_gval(g_filter_active_ct, "value", "");
    if (atext != null) {
        var data = {
            Obj: "phongbans",
            Col: "ma~ten",
            Val: atext
        };
        g_filter_cur_val = atext;
        f_filter_select(data);
    }
}

function f_filter_phongban_callback(v_ds) {//res

    if (ms_gobj(g_filter_active_ct) != null) {
        if (g_filter_cur_val != ms_gobj(g_filter_active_ct).value) {
            f_filter_phongban();
            return;
        }
    }
    ms_filter_load(v_ds, "ma~ten", "Mã~Tên");
    //g_filter_cur_val = "";
}

function f_filter_phongban_selected() {
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
                //khaibaothuoc
            case "page_nhansu_khaibaonhanvien_phai":
                ms_filter_hide();
                f_filter_phai_show(aid);
                break;
            case "page_nhansu_khaibaonhanvien_phongban":
                ms_filter_hide();
                f_filter_phongban_show(aid);
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
        case "page_nhansu_khaibaonhanvien_phai":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_phai_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_phai_show(aid_active);
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
                    f_filter_phai_show(aid_active);
                    break;
            }
            break;
        case "page_nhansu_khaibaonhanvien_phongban":
            aid_active = v_this.id;
            switch (keyCode.toString()) {
                case "38"://Up
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_up();
                    }
                    else {
                        f_filter_phongban_show(aid_active);
                    }
                    break;
                case "40"://Down
                    if (ms_gobj(g_filter_display_ct) != null && ms_gobj(g_filter_display_ct).style.display == 'block') {
                        ms_filter_down();
                    }
                    else {
                        f_filter_phongban_show(aid_active);
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
                    f_filter_phongban_show(aid_active);
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
            //khaibaophongban
            case "page_nhansu_khaibaophongban_ten":
                input_onblur(v_this);
                if (ms_gval("page_nhansu_khaibaophongban_ten", "value", "") != "") {
                    ms_focus_arr("page_nhansu_khaibaophongban_ghichu");
                }
                else {
                    ms_focus_arr("page_nhansu_khaibaophongban_ten");
                }
                break;
            case "page_nhansu_khaibaophongban_ghichu":
                ms_focus_arr("page_nhansu_khaibaophongban_luu");
                break;
                //khaibaothuoc
            case "page_nhansu_khaibaonhanvien_hoten":
                input_onblur(v_this);
                if (ms_gval("page_nhansu_khaibaonhanvien_hoten", "value", "") != "") {
                    ms_focus_arr("page_nhansu_khaibaonhanvien_phai~page_nhansu_khaibaonhanvien_ngaysinh~page_nhansu_khaibaonhanvien_namsinh~page_nhansu_khaibaonhanvien_sdt~page_nhansu_khaibaonhanvien_email~page_nhansu_khaibaonhanvien_diachi~page_nhansu_khaibaonhanvien_phongban~page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong");
                }
                else {
                    ms_focus_arr("page_nhansu_khaibaonhanvien_hoten");
                }
                break;
            case "page_nhansu_khaibaonhanvien_phai":
                if (ms_gval("page_nhansu_khaibaonhanvien_phai", "selectedvalue", "") != "") {
                    ms_focus_arr("page_nhansu_khaibaonhanvien_ngaysinh~page_nhansu_khaibaonhanvien_namsinh~page_nhansu_khaibaonhanvien_sdt~page_nhansu_khaibaonhanvien_email~page_nhansu_khaibaonhanvien_diachi~page_nhansu_khaibaonhanvien_phongban~page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong");
                }
                else {
                    ms_focus_arr("page_nhansu_khaibaonhanvien_phai");
                }
                break;
            case "page_nhansu_khaibaonhanvien_ngaysinh":
                ms_focus_arr("page_nhansu_khaibaonhanvien_namsinh~page_nhansu_khaibaonhanvien_sdt~page_nhansu_khaibaonhanvien_email~page_nhansu_khaibaonhanvien_diachi~page_nhansu_khaibaonhanvien_phongban~page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong");
                break;
            case "page_nhansu_khaibaonhanvien_namsinh":
                if (ms_gval("page_nhansu_khaibaonhanvien_namsinh", "value", "") != "") {
                    ms_focus_arr("page_nhansu_khaibaonhanvien_sdt~page_nhansu_khaibaonhanvien_email~page_nhansu_khaibaonhanvien_diachi~page_nhansu_khaibaonhanvien_phongban~page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong");
                }
                else {
                    if (ms_gval("page_nhansu_khaibaonhanvien_ngaysinh", "value", "") != "") {
                        ms_focus_arr("page_nhansu_khaibaonhanvien_sdt~page_nhansu_khaibaonhanvien_email~page_nhansu_khaibaonhanvien_diachi~page_nhansu_khaibaonhanvien_phongban~page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong");
                    }
                    else {
                        ms_focus_arr("page_nhansu_khaibaonhanvien_namsinh");
                    }
                }
                break;
            case "page_nhansu_khaibaonhanvien_sdt":
                ms_focus_arr("page_nhansu_khaibaonhanvien_email~page_nhansu_khaibaonhanvien_diachi~page_nhansu_khaibaonhanvien_phongban~page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong");
                break;
            case "page_nhansu_khaibaonhanvien_email":
                ms_focus_arr("page_nhansu_khaibaonhanvien_diachi~page_nhansu_khaibaonhanvien_phongban~page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong");
                break;
            case "page_nhansu_khaibaonhanvien_diachi":
                ms_focus_arr("page_nhansu_khaibaonhanvien_phongban~page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong");
                break;
            case "page_nhansu_khaibaonhanvien_phongban":
                if (ms_gval("page_nhansu_khaibaonhanvien_phongban", "selectedvalue", "") != "") {
                    ms_focus_arr("page_nhansu_khaibaonhanvien_capbac~page_nhansu_khaibaonhanvien_mucluong");
                }
                else {
                    ms_focus_arr("page_nhansu_khaibaonhanvien_phongban");
                }
                break;
            case "page_nhansu_khaibaonhanvien_capbac":
                ms_focus_arr("page_nhansu_khaibaonhanvien_mucluong");
                break;
            case "page_nhansu_khaibaonhanvien_mucluong":
                ms_focus_arr("page_nhansu_khaibaonhanvien_luu");
                break;
            default:
                break;
        }
    }
}

function input_onblur(v_this) {
    switch (v_this.id) {
        case "page_nhansu_khaibaophongban_ten":
            ms_caps(v_this);
            break;
            //dmthuoc
        case "page_nhansu_khaibaonhanvien_ten":
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
        case "page_nhansu_khaibaophongban_ds_themmoi":
            f_tab_show("danhsach", "thonhtin");
            f_clear_arr("phongbans");
            ms_enable_arr("page_nhansu_khaibaophongban_sua", false);
            break;
        case "page_nhansu_khaibaophongban_themmoi":
            f_set_val("page_nhansu_khaibaophongban_ma", "phongbans", "ma");
            f_clear_arr("phongbans");
            khaibaophongban_enable(true);
            ms_enable_arr("page_nhansu_khaibaophongban_xoa", false);
            ms_focus_arr("page_nhansu_khaibaophongban_ten");
            break;
        case "page_nhansu_khaibaophongban_boqua":
            f_clear_arr("phongbans");
            ms_enable_arr("page_nhansu_khaibaophongban_sua", false);
            break;
        case "page_nhansu_khaibaophongban_luu":
            f_save_phongban();
            break;
        case "page_nhansu_khaibaophongban_sua":
            khaibaophongban_enable(true);
            ms_enable_arr("page_nhansu_khaibaophongban_xoa", false);
            break;
        case "page_nhansu_khaibaophongban_xoa":
            f_gridview_del_record("phongbans", ms_gval("page_nhansu_khaibaophongban_ma", "selectedvalue"));
            f_clear_arr("phongbans");
            ms_enable_arr("page_nhansu_khaibaophongban_sua", false);
            break;
        case "page_nhansu_khaibaophongban_ketthuc":
            window.location.href = "../Trangchu/index";
            break;
            //nhanvien
        case "page_nhansu_khaibaonhanvien_ds_themmoi":
            f_tab_show("danhsach", "thonhtin");
            f_clear_arr("thuocs");
            ms_enable_arr("page_nhansu_khaibaonhanvien_sua", false);
            break;
        case "page_nhansu_khaibaonhanvien_themmoi":
            f_clear_arr("nhanviens");
            khaibaonhanvien_enable(true);
            ms_enable_arr("page_nhansu_khaibaonhanvien_xoa", false);
            ms_focus_arr("page_nhansu_khaibaonhanvien_hoten");
            break;
        case "page_nhansu_khaibaonhanvien_sua":
            khaibaonhanvien_enable(true);
            ms_enable_arr("page_nhansu_khaibaonhanvien_xoa", false);
            break;
        case "page_nhansu_khaibaonhanvien_xoa":
            f_gridview_del_record("thuocs", ms_gval("page_nhansu_khaibaonhanvien_ma", "selectedvalue"));
            f_clear_arr("nhanviens");
            ms_enable_arr("page_nhansu_khaibaonhanvien_sua", false);
            break;
        case "page_nhansu_khaibaonhanvien_luu":
            f_save_nhanvien();
            break;
        case "page_nhansu_khaibaonhanvien_boqua":
            f_clear_arr("nhanviens");
            ms_enable_arr("page_nhansu_khaibaonhanvien_sua", false);
            break;
        case "page_nhansu_khaibaonhanvien_ketthuc":
            window.location.href = "../Trangchu/Nhanvien";
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
            case "page_nhansu_khaibaophongban_luu":
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
function khaibaophongban_enable(v_bool) {
    ms_enable_arr(khaibaophongban_input + "~page_nhansu_khaibaophongban_luu", v_bool);
    ms_enable_arr("page_nhansu_khaibaophongban_boqua~page_nhansu_khaibaophongban_sua~page_nhansu_khaibaophongban_xoa", v_bool);
    ms_enable_arr("page_nhansu_khaibaophongban_themmoi", !v_bool);

    ms_enable_arr("page_nhansu_khaibaophongban_ma", false);
}

function khaibaonhanvien_enable(v_bool) {
    ms_enable_arr(khaibaonhanvien_input + "~page_nhansu_khaibaonhanvien_luu", v_bool);
    ms_enable_arr("page_nhansu_khaibaonhanvien_boqua~page_nhansu_khaibaonhanvien_sua~page_nhansu_khaibaonhanvien_xoa", v_bool);
    ms_enable_arr("page_nhansu_khaibaonhanvien_themmoi", !v_bool);

    ms_enable_arr("page_nhansu_khaibaonhanvien_id", false);
}
//Enable-End

//Action-Start
function f_save_phongban() {
    try {
        var data;
        var url = "";
        if (ms_gval("page_nhansu_khaibaophongban_ten", "value") == "") {
            alert("Vui lòng nhập tên kho");
            ms_focus("page_nhansu_khaibaophongban_ten");
            return null;
        }
        data = {
            id: ms_gval("page_nhansu_khaibaophongban_ma", "selectedvalue"),
            ma: ms_gval("page_nhansu_khaibaophongban_ma", "value"),
            ten: ms_gval("page_nhansu_khaibaophongban_ten", "value"),
            ghichu: ms_gval("page_nhansu_khaibaophongban_ghichu", "value")
        };
        url = "SavePhongban";
        f_save_data(url, data);
    }
    catch (ex) {
        alert("SavePhongban Error");
    }
}

function f_save_nhanvien() {
    try {
        var data;
        var url = "";
        if (ms_gval("page_nhansu_khaibaonhanvien_ten", "value") == "") {
            alert("Vui lòng nhập tên thuốc");
            ms_focus("page_nhansu_khaibaonhanvien_ten");
            return null;
        }
        if (ms_gval("page_nhansu_khaibaonhanvien_loaiduoc", "selectedvalue") == "") {
            alert("Vui lòng nhập nhóm thuốc");
            ms_focus("page_nhansu_khaibaonhanvien_loaiduoc");
            return null;
        }
        data = {
            ma: ms_gval("page_nhansu_khaibaonhanvien_ma", "value"),
            id: ms_gval("page_nhansu_khaibaonhanvien_ma", "selectedvalue"),
            ten: ms_gval("page_nhansu_khaibaonhanvien_ten", "value"),
            atc: ms_gval("page_nhansu_khaibaonhanvien_atccode", "value"),
            sodk: ms_gval("page_nhansu_khaibaonhanvien_sodk", "value"),
            ten_duongdung: ms_gval("page_nhansu_khaibaonhanvien_duongdung", "value"),
            id_duongdung: ms_gval("page_nhansu_khaibaonhanvien_duongdung", "selectedvalue"),
            hamluong: ms_gval("page_nhansu_khaibaonhanvien_hamluong", "value"),
            dang: ms_gval("page_nhansu_khaibaonhanvien_dang", "value"),
            donvidg: ms_gval("page_nhansu_khaibaonhanvien_dvt", "value"),
            donvisd: ms_gval("page_nhansu_khaibaonhanvien_donvisd", "value"),
            id_loaiduoc: ms_gval("page_nhansu_khaibaonhanvien_loaiduoc", "selectedvalue"),
            id_hangsx: ms_gval("page_nhansu_khaibaonhanvien_hangsx", "selectedvalue"),
            id_quocgia: ms_gval("page_nhansu_khaibaonhanvien_quocgia", "selectedvalue"),
            thanhphan: ms_gval("page_nhansu_khaibaonhanvien_thanhphan", "value"),
            hoatchat: ms_gval("page_nhansu_khaibaonhanvien_hoatchat", "value")
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
            case "phongbans":
                f_dmphongban_show(null, 0, false);
                break;
            case "nhanviens":
                f_nhanvien_show(null, 0, false);
                break;
            default:
                break;
        }
    }
    catch (ex)
    { }
}

function f_dmphongban_show(v_ds, v_index, v_bool) {
    ms_sval("page_nhansu_khaibaophongban_ma", "value", ms_gfields(v_ds, v_index, "ma", ""));
    ms_sval("page_nhansu_khaibaophongban_ma", "selectedvalue", ms_gfields(v_ds, v_index, "id", ""));
    ms_sval("page_nhansu_khaibaophongban_ten", "value", ms_gfields(v_ds, v_index, "ten", ""));
    ms_sval("page_nhansu_khaibaophongban_ghichu", "value", ms_gfields(v_ds, v_index, "ghichu", ""));
    khaibaophongban_enable(v_bool);
}

function f_nhanvien_show(v_ds, v_index, v_bool) {
    ms_sval("page_nhansu_khaibaonhanvien_id", "value", ms_gfields(v_ds, v_index, "id", ""));
    ms_sval("page_nhansu_khaibaonhanvien_id", "selectedvalue", ms_gfields(v_ds, v_index, "id", ""));
    ms_sval("page_nhansu_khaibaonhanvien_hoten", "value", ms_gfields(v_ds, v_index, "hoten", ""));
    ms_sval("page_nhansu_khaibaonhanvien_phai", "value", ms_gfields(v_ds, v_index, "tenphai", ""));
    ms_sval("page_nhansu_khaibaonhanvien_phai", "selectedvalue", ms_gfields(v_ds, v_index, "idphai", ""));
    ms_sval("page_nhansu_khaibaonhanvien_ngaysinh", "value", ms_gfields(v_ds, v_index, "ngaysinh", ""));
    ms_sval("page_nhansu_khaibaonhanvien_namsinh", "value", ms_gfields(v_ds, v_index, "namsinh", ""));
    ms_sval("page_nhansu_khaibaonhanvien_sdt", "value", ms_gfields(v_ds, v_index, "sdt", ""));
    ms_sval("page_nhansu_khaibaonhanvien_email", "value", ms_gfields(v_ds, v_index, "email", ""));
    ms_sval("page_nhansu_khaibaonhanvien_diachi", "value", ms_gfields(v_ds, v_index, "diachi", ""));
    ms_sval("page_nhansu_khaibaonhanvien_phongban", "value", ms_gfields(v_ds, v_index, "tenphongban", ""));
    ms_sval("page_nhansu_khaibaonhanvien_phongban", "selectedvalue", ms_gfields(v_ds, v_index, "idphongban", ""));
    ms_sval("page_nhansu_khaibaonhanvien_capbac", "value", ms_gfields(v_ds, v_index, "ten_loaiduoc", ""));
    ms_sval("page_nhansu_khaibaonhanvien_mucluong", "selectedvalue", ms_gfields(v_ds, v_index, "id_loaiduoc", ""));

    khaibaonhanvien_enable(v_bool);
}
//Show-End