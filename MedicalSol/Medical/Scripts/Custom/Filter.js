// JScript File
var g_filter_working = false;
var g_filter_function = "";//ten ham ajax
var g_filter_active_ct = "";//id control chua text can filter
var g_filter_selected_none = "";//1: cho phep khong chon trong danh sach, nguoc lai bat buoc phai chon
var g_filter_selected_field = "";//ten field se tra ve khi chon tu list
var g_filter_selected_val = "";//gia tri key tra ve khi chon tu danh sach
var g_filter_selected_func = "";//ten function khi select
var g_filter_selected_ct_delimiter = "";//danh sach control se nhan gia tri tu filter (~)
var g_filter_selected_field_delimiter = "";//danh sach field se lay gia tri tu filter (~)
var g_filter_display_ct = "ct_filter_list";//ten control se chua list display
var g_filter_display_position = "1";//1: hien thi ben duoi control, nguoc lai hien thi ben tren
var g_filter_display_height = "205";//chieu cao mat dinh cua control
var g_filter_ds = null;
var g_filter_index = 0;
var g_filter_cur_val = "";
var g_filter_limit = 50;
var g_filter_id_container = "";

function ms_create_filter() {
    if (ms_gobj(g_filter_display_ct) == null) {
        ms_cobj("", "div", g_filter_display_ct);
        ms_satt(g_filter_display_ct, "class", "ms_form_dg");
        ms_sval(g_filter_display_ct, "className", "ms_form_dg");
        ms_gobj(g_filter_display_ct).style.display = "none";
    }
}
function ms_filter_hide() {
    g_filter_working = false; try { ms_gobj("ct_div_filter").scrollTop = 0; } catch (e) { };
    if (ms_gobj(g_filter_display_ct) != null) {
        ms_gobj(g_filter_display_ct).style.display = "none";
        ms_gobj(g_filter_display_ct).style.top = "-2000px";
    };
}
function ms_filter_show(v_filter_active_ct, v_filter_width, v_filter_function, v_filter_selected_none, v_filter_selected_field, v_filter_selected_ct_delimiter, v_filter_selected_field_delimiter, v_filter_selected_func) {
    ms_filter_show_left(v_filter_active_ct, "", v_filter_width, v_filter_function, v_filter_selected_none, v_filter_selected_field, v_filter_selected_ct_delimiter, v_filter_selected_field_delimiter, v_filter_selected_func);
}
function ms_filter_show_left(v_filter_active_ct, v_left, v_filter_width, v_filter_function, v_filter_selected_none, v_filter_selected_field, v_filter_selected_ct_delimiter, v_filter_selected_field_delimiter, v_filter_selected_func) {
    if (g_filter_working == true) {
        return;
    }
    g_filter_working = true;
    g_filter_active_ct = v_filter_active_ct;
    g_filter_function = v_filter_function;
    g_filter_selected_none = v_filter_selected_none;
    g_filter_selected_field = v_filter_selected_field;
    g_filter_selected_ct_delimiter = v_filter_selected_ct_delimiter;
    g_filter_selected_field_delimiter = v_filter_selected_field_delimiter;
    g_filter_selected_func = v_filter_selected_func;

    if (ms_gobj(g_filter_display_ct) == null) {
        ms_cobj("", "div", g_filter_display_ct);
        ms_satt(g_filter_display_ct, "class", "ms_form_dg");
        ms_sval(g_filter_display_ct, "className", "ms_form_dg");
    }
    var aleft = ms_to_decimal(v_left);
    var atop = 0;
    var awidth = 0;
    var aheight = 0;

    if (aleft == 0) {
        aleft = ms_left(g_filter_selected_ct_delimiter.split('~')[0]);
    }
    if (v_filter_width == "" || v_filter_width == "0") {
        var atmp = 0;
        var alen = g_filter_selected_ct_delimiter.split('~').length;
        if (alen >= 1) {
            awidth = ms_left(g_filter_selected_ct_delimiter.split('~')[alen - 1]) - ms_left(g_filter_selected_ct_delimiter.split('~')[0]) + ms_gval(g_filter_selected_ct_delimiter.split('~')[alen - 1], "offsetWidth", "0");
        }
    }
    else {
        awidth = v_filter_width;
    }
    if (awidth <= 0) {
        awidth = 100;
    }
    aheight = ms_gval(g_filter_active_ct, "offsetHeight", "0")    
    //atop = ms_top(g_filter_active_ct);
    if (g_filter_id_container != "") {
        var ascrolltop = 0;
        try {
            ascrolltop = ms_gobj(g_filter_id_container).scrollTop;
        }
        catch (ex) {
            ascrolltop = 0;
        }
        atop = atop - ascrolltop;
    }

    g_filter_display_position = "1";
    if (atop - g_filter_display_height - 6 < 0) {
        atop = atop + ms_top(g_filter_active_ct) + aheight + 2 + 0;
        g_filter_display_position = "0";
    }
    else {
        atop = atop - g_filter_display_height - 2 - 8;
    }
    //awidth = awidth - 10;
    awidth = awidth + 32;    

    ms_sval(g_filter_display_ct, "innerHTML", "");
    var aobj = ms_gobj(g_filter_display_ct);
    aobj.style.position = "absolute";
    aobj.style.display = "block";
    aobj.style.left = aleft.toString() + "px";
    aobj.style.top = atop.toString() + "px";
    //aobj.style.width = awidth.toString() + "px";
    aobj.style.width = awidth < 250 ? "auto" : awidth.toString() + "px";
    aobj.style.minWidth = awidth.toString() + "px";
    aobj.style.height = g_filter_display_height.toString() + "px";
    aobj.style.zIndex = "1000";
    if (g_filter_function != "") {
        eval(g_filter_function + "()");
    };
}
function ms_filter_html_toolbar(v_top) {
    var ahtml = "";
    ahtml += "<tr>";
    ahtml += "<td class=\"ms_toolbar\" style=\"text-align:right;cursor:pointer;padding-top:1px;padding-bottom:1px;padding-right:1px;height:14px;border-left:solid 1px #FFFFFF;" + (v_top != "1" ? "border-top:solid 1px #FFFFFF;border-bottom:solid 0px #e0e0e0;" : "border-top:solid 1px #FFFFFF;border-bottom:solid 1px #b0b0b0;") + "background-color:#81daff;\">";
    ahtml += "<table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"right\" style=\"height:100%;\">";
    ahtml += "<tr>";
    ahtml += "<td class=\"ms_tb\" style=\"width:25px;\" onclick=\"ms_filter_up();\" title=\"" + _lang_filter(0, "Trước") + "\" ><</td>";
    ahtml += "<td class=\"ms_tb\" style=\"width:25px;\" onclick=\"ms_filter_dbclick();\" title=\"" + _lang_filter(2, "Chọn") + "\" >OK</td>";
    if (g_filter_selected_none == "1") {
        ahtml += "<td class=\"ms_tb\" style=\"width:25px;\" onclick=\"g_filter_index=-1;ms_filter_dbclick();\" title=\"" + _lang_filter(4, "Chọn dòng trống (none)") + "\" >[ ]</td>";
    }
    ahtml += "<td class=\"ms_tb\" style=\"width:25px;\" onclick=\"ms_filter_down();\" title=\"" + _lang_filter(1, "Sau") + "\" >></td>";
    ahtml += "<td class=\"ms_tb\" style=\"width:25px;\" onclick=\"ms_filter_hide();\" title=\"" + _lang_filter(3, "Đóng") + "\" >X</td>";
    ahtml += "</tr>";
    ahtml += "</table>";
    ahtml += "</td>";
    ahtml += "</tr>";
    return ahtml;
}
function ms_filter_load(v_ds, v_display_field_delimiter, v_display_header_delimiter) {
    ms_filter_load_css(v_ds, v_display_field_delimiter, v_display_header_delimiter, "");
}
function ms_filter_load_css(v_ds, v_display_field_delimiter, v_display_header_delimiter, v_css_delimiter) {
    g_filter_working = false;
    g_filter_ds = v_ds;
    g_filter_index = 0;
    var ahtml = "";
    ahtml = "<table cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" style=\"border-right:1px solid #FFFFFF;border-bottom:1px solid #FFFFFF;\">";
    if (g_filter_display_position == "1") {
        ahtml += ms_filter_html_toolbar(g_filter_display_position);
    }
    ahtml += "<tr>";
    ahtml += "<td >";
    ahtml += "<div id=\"ct_div_filter\" style=\"overflow-y:scroll;overflow-x:hidden;height:" + (g_filter_display_position == "1" ? "175" : "176") + "px;\">";
    ahtml += "<table id=\"ct_dg_filter\" cellspacing=\"1\" cellpadding=\"0\" width=100%>";

    if (v_display_header_delimiter != "") {
        ahtml += "<tr>";
        for (var i = 0; i < v_display_header_delimiter.split('~').length; i++) {
            ahtml += "<td class=\"ms_hcell" + ms_gdelimiter(v_css_delimiter, "~", i, "") + "\">" + (v_display_header_delimiter.split('~')[i]) + "&nbsp;</td>";
        }
        ahtml += "<tr>";
    }

    if (g_filter_ds != null && typeof (g_filter_ds) == "object") {
        var aarr = v_display_field_delimiter.split('~');
        for (var i = 0; i < g_filter_ds.Rows.length; ++i) {
            ahtml += "<tr id=\"gfilter_" + i.toString() + "\" onmouseover=\"ms_grid_over(this,'ct_dg_filter');\" onmouseout=\"ms_grid_out(this,'ct_dg_filter');\" onclick=\"ms_grid_click(this,'ct_dg_filter');ms_filter_click('" + i.toString() + "');\" ondblclick=\"ms_filter_dbclick('" + i.toString() + "');\">";
            for (var j = 0; j < aarr.length; j++) {
                ahtml += "<td id=\"gfilter_td" + j.toString() + "_" + i.toString() + "\" class=\"ms_dcell" + ms_gdelimiter(v_css_delimiter, "~", j, "") + "\">" + ms_gfields(g_filter_ds, i, aarr[j], "") + "&nbsp;</td>";
            }
            ahtml += "</tr>";
        }
        g_filter_index = 0;
    }
    ahtml += "</table></div>";
    ahtml += "</td>";
    ahtml += "</tr>";
    if (g_filter_display_position != "1") {
        ahtml += ms_filter_html_toolbar(g_filter_display_position);
    }
    ahtml += "</table>";
    ms_sval(g_filter_display_ct, "innerHTML", ahtml);
    var aobj = ms_gobj(g_filter_display_ct);
    aobj.style.backgroundColor = "#fff";
    aobj.style.border = "solid 3px #5ac6fc";
    aobj.style.overflow = "hidden";
    aobj.style.borderRadius = "5px";
    ms_filter_selected(g_filter_index);
}

function ms_filter_up() {
    g_filter_index = ms_to_int(g_filter_index);
    if (g_filter_index > 0) {
        ms_filter_selected(g_filter_index - 1); ms_gobj("ct_div_filter").scrollTop -= 23;
    }
    else
        if (g_filter_selected_none == "1") {
            ms_filter_selected(-1);
        }
}
function ms_filter_down() {
    try {
        g_filter_index = ms_to_int(g_filter_index);
        if (g_filter_index < g_filter_ds.Rows.length - 1) {
            ms_filter_selected(g_filter_index + 1); ms_gobj("ct_div_filter").scrollTop += 23;
        }
        else
            if (g_filter_selected_none == "1") {
                ms_filter_selected(g_filter_ds.Rows.length);
            }
    }
    catch (ex) {
    }
}
function ms_filter_selected(v_id) {
    ms_grid_click(ms_gobj("gfilter_" + v_id), "ct_dg_filter");
    /*
    if(v_id != g_filter_index)
    {
        if(ms_gobj('gfilter_' + g_filter_index.toString())!=null)
        {
            //ms_gobj('gfilter_td0_' + g_filter_index.toString()).scrollIntoView(true);
            var ascroll=(ms_gval("gfilter_" + g_filter_index.toString(),"offsetTop",0)+ms_gval("gfilter_" + g_filter_index.toString(),"offsetHeight",0)-ms_gval("ct_div_filter","offsetHeight",0)+24);
            if(ascroll<0)
            {
                ascroll=0;
            }
            ms_gobj('ct_div_filter').scrollTop=ascroll;
        }
    }
    */
    g_filter_index = v_id;
}
function ms_filter_click(v_id) {
    ms_filter_selected(v_id);
}
function ms_filter_dbclick() {
    ms_filter_get_selected();
    ms_filter_hide();
}
function ms_filter_get_selected() {
    if (ms_gobj(g_filter_display_ct) == null) return;
    if (ms_gobj(g_filter_display_ct).style.display == "block") {
        if (g_filter_ds != null) {
            if (g_filter_ds.Rows.length > 0 && g_filter_index >= 0 && g_filter_index < g_filter_ds.Rows.length) {
                for (var i = 0; i < g_filter_selected_ct_delimiter.split('~').length; i++) {
                    ms_sval(g_filter_selected_ct_delimiter.split('~')[i], "value", ms_gfields(g_filter_ds, g_filter_index, g_filter_selected_field_delimiter.split('~')[i], ""));
                    ms_sval(g_filter_selected_ct_delimiter.split('~')[i], "title", ms_gfields(g_filter_ds, g_filter_index, g_filter_selected_field_delimiter.split('~')[i], ""));
                }
                //ms_sval("ct_form_page1_tenmau","value",ms_gfields(g_filter_ds,g_filter_index,"tenmau",""));
                var makt = ms_gfields(g_filter_ds, g_filter_index, "ma", "")
                if (makt != "") {
                    ms_sval("ct_form_page1_makythuat", "value", makt);
                }
                var gia_dvtp = ms_gfields(g_filter_ds, g_filter_index, "gia", "");
                if (gia_dvtp != "") {
                    ms_sval("ct_form_page1_gia", "value", gia_dvtp);
                }
                else {
                    if (ms_gval("ct_form_page1_gia", "value") != "") {
                        ms_sval("ct_form_page1_gia", "value", "");
                    }
                }
                var username = ms_gfields(g_filter_ds, g_filter_index, "username", "");
                if (username != "") {
                    ms_sval("ct_form_page1_nguoiud", "value", username);
                }
                else {
                    if (ms_gval("ct_form_page1_nguoiud", "value") != "") {
                        ms_sval("ct_form_page1_nguoiud", "value", "Admin");
                    }
                }
                var ngayud = ms_gfields(g_filter_ds, g_filter_index, "ngayud", "");
                if (ngayud != "") {
                    ms_sval("ct_form_page1_ngayud", "value", ngayud);
                }
                else {
                    if (ms_gval("ct_form_page1_ngayud", "value") != "") {
                        ms_sval("ct_form_page1_ngayud", "value", ms_gfields(g_filter_ds, g_filter_index, "today", ""));
                    }
                }

                var madvtp = ms_gfields(g_filter_ds, g_filter_index, "ma", "");
                if (madvtp != "") {
                    ms_sval("ct_form_page1_madvtp", "value", madvtp);
                }
                if (ms_gfields(g_filter_ds, g_filter_index, "madv", "") != "") {
                    ms_sval("ct_form_page1_ma", "value", ms_gfields(g_filter_ds, g_filter_index, "madv", ""));
                }
                var dongia = ms_gfields(g_filter_ds, g_filter_index, "dongia", "");
                if (dongia != "") {
                    ms_sval("ct_form_page1_gia", "value", dongia);
                }
                var motadata = ms_gfields(g_filter_ds, g_filter_index, "mota", "");
                if (motadata != "") {
                    ms_sval("ct_form_page1_mota", "value", motadata);
                }
                var ketluandata = ms_gfields(g_filter_ds, g_filter_index, "ketluan", "")
                if (ketluandata != "") {
                    ms_sval("ct_form_page1_ketluan", "value", ketluandata);
                }
                var maumotadata = ms_gfields(g_filter_ds, g_filter_index, "maumota", "");
                if (maumotadata != "") {
                    ms_sval("ct_form_page3_mota", "value", maumotadata);
                }
                var mauketluandata = ms_gfields(g_filter_ds, g_filter_index, "mauketluan", "")
                if (mauketluandata != "") {
                    ms_sval("ct_form_page3_ketqua", "value", mauketluandata);
                }
                m_chuyen = ms_gfields(g_filter_ds, g_filter_index, "chuyen", "");
                m_duyet = ms_gfields(g_filter_ds, g_filter_index, "duyet", "");
                m_stt = ms_gfields(g_filter_ds, g_filter_index, "maumt_stt", "");
                g_filter_selected_val = ms_gfields(g_filter_ds, g_filter_index, g_filter_selected_field, "");
                ms_sval(g_filter_active_ct, "selectedvalue", g_filter_selected_val);
            }
            else {
                if (g_filter_selected_none == "1") {
                    for (var i = 0; i < g_filter_selected_ct_delimiter.split('~').length; i++) {
                        ms_sval(g_filter_selected_ct_delimiter.split('~')[i], "value", ms_gfields(g_filter_ds, g_filter_index, g_filter_selected_field_delimiter.split('~')[i], ""));
                    }
                    var test = ms_gfields(g_filter_ds, g_filter_index, g_filter_selected_field, "");
                    g_filter_selected_val = ms_gfields(g_filter_ds, g_filter_index, g_filter_selected_field, "");
                    ms_sval(g_filter_active_ct, "selectedvalue", g_filter_selected_val);
                }
            }
        }
        if (g_filter_selected_func != "") {
            eval(g_filter_selected_func + "()");
        }
    }
}
//language:start
function _lang_filter(v_index, v_default) {
    try {
        return ms_glang(s_ngonngu, _lang_filterarr, v_index, v_default);
    }
    catch (ex) {
        return v_default;
    }
}

var _lang_filterarr = new Array(5);
for (var i = 0; i < _lang_filterarr.length; i++) {
    _lang_filterarr[i] = new Array(3);
    _lang_filterarr[i][0] = "";
    _lang_filterarr[i][1] = "";
    _lang_filterarr[i][2] = "";
}
_lang_filterarr[0][0] = "Trước";
_lang_filterarr[0][1] = "First";
_lang_filterarr[0][2] = "";

_lang_filterarr[1][0] = "Sau";
_lang_filterarr[1][1] = "Next";
_lang_filterarr[1][2] = "";

_lang_filterarr[2][0] = "Chọn";
_lang_filterarr[2][1] = "Select";
_lang_filterarr[2][2] = "";

_lang_filterarr[3][0] = "Đóng";
_lang_filterarr[3][1] = "Close";
_lang_filterarr[3][2] = "";

_lang_filterarr[4][0] = "Chọn dòng trống (none)";
_lang_filterarr[4][1] = "Select blank (none)";
_lang_filterarr[4][2] = "";

//language:end
