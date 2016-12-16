using Medical.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace Medical.Controllers
{
    public class ProcessController : Controller
    {
        [HttpPost]
        public string Filter(Data.Filter data)
        {
            try
            {
                if (data.Obj != "")
                {
                    if (data.Userid == null)
                    {
                        data.Userid = @Session["ms_userid"].ToString();
                    }
                    List<Object> lts = new List<Object>();
                    foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("Search", data)))
                    {
                        switch (data.Obj)
                        {
                            case "nhomkhos":
                                lts.Add(JsonConvert.DeserializeObject<Data.NhomKho>(jo.ToString()));
                                break;
                            case "lydonxs":
                                lts.Add(JsonConvert.DeserializeObject<Data.Lydonx>(jo.ToString()));
                                break;
                            case "khos":
                                lts.Add(JsonConvert.DeserializeObject<Data.Kho>(jo.ToString()));
                                break;
                            case "nhanviens":
                                lts.Add(JsonConvert.DeserializeObject<Data.Nhanvien>(jo.ToString()));
                                break;
                            case "duongdungs":
                                lts.Add(JsonConvert.DeserializeObject<Data.Duongdung>(jo.ToString()));
                                break;
                            case "dangbds":
                                lts.Add(JsonConvert.DeserializeObject<Data.Dangbd>(jo.ToString()));
                                break;
                            case "donvis":
                                lts.Add(JsonConvert.DeserializeObject<Data.Donvi>(jo.ToString()));
                                break;
                            case "loaiduocs":
                                lts.Add(JsonConvert.DeserializeObject<Data.Loaiduoc>(jo.ToString()));
                                break;
                            case "hangsxs":
                                lts.Add(JsonConvert.DeserializeObject<Data.Hangsx>(jo.ToString()));
                                break;
                            case "nhaccs":
                                lts.Add(JsonConvert.DeserializeObject<Data.Nhacc>(jo.ToString()));
                                break;
                            case "dmhcs":
                                lts.Add(JsonConvert.DeserializeObject<Data.Dmhc>(jo.ToString()));
                                break;
                            case "quocgias":
                                lts.Add(JsonConvert.DeserializeObject<Data.Quocgia>(jo.ToString()));
                                break;
                            case "thuocs":
                                lts.Add(JsonConvert.DeserializeObject<Data.Thuoc>(jo.ToString()));
                                break;
                            case "mathuocs":
                                lts.Add(JsonConvert.DeserializeObject<Data.Thuoc>(jo.ToString()));
                                break;
                            default:
                                break;
                        }
                    }
                    Data.AjaxData result = new Data.AjaxData(lts);
                    return new JavaScriptSerializer().Serialize(result);
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        [HttpPost]
        public string CreateVal(Data.CreateVal data)
        {
            try
            {
                if (data.Obj != "")
                {
                    if (data.Userid == null)
                    {
                        data.Userid = @Session["ms_userid"].ToString();
                    }
                    return JObject.Parse(Bridge.HttpPostApi("CreateVal", data))["result"].Value<string>();
                }
                return "";
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        [HttpPost]
        public string DelRecode(Data.Del data)
        {
            try
            {
                if (data.obj != null && data.key != null)
                {
                    if (data.userid == null)
                    {
                        data.userid = @Session["ms_userid"].ToString();
                    }
                    return JObject.Parse(Bridge.HttpPostApi("DelRecord", data))["result"].Value<string>();
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        [HttpPost]
        public string Gridview(Data.Table data)
        {
            try
            {
                if (data.userid == null)
                {
                    data.userid = @Session["ms_userid"].ToString();
                }
                if (data.obj != "")
                {
                    List<Object> lts = new List<Object>();
                    foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("Search", data)))
                    {
                        switch (data.obj)
                        {
                            case "khos":
                                lts.Add(JsonConvert.DeserializeObject<Data.Kho>(jo.ToString()));
                                break;
                            case "thuocs":
                                lts.Add(JsonConvert.DeserializeObject<Data.Thuoc>(jo.ToString()));
                                break;
                            case "nhapkhos":
                                lts.Add(JsonConvert.DeserializeObject<Data.Nhapkho>(jo.ToString()));
                                break;
                            case "nhapkhocts":
                                lts.Add(JsonConvert.DeserializeObject<Data.Nhapkhoct>(jo.ToString()));
                                break;
                            default:
                                break;
                        }
                    }
                    //Data.AjaxData data = new Data.AjaxData(lts);
                    return new JavaScriptSerializer().Serialize(lts);
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        [HttpPost]
        public string SaveKho(Data.Kho data)
        {
            try
            {
                if (data.userid == null)
                {
                    data.userid = @Session["ms_userid"].ToString();
                }
                List<Object> lts = new List<Object>();
                foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("Khos", data)))
                {
                    lts.Add(JsonConvert.DeserializeObject<Data.Kho>(jo.ToString()));
                }
                Data.AjaxData ajaxdata = new Data.AjaxData(lts);
                return new JavaScriptSerializer().Serialize(ajaxdata);
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        [HttpPost]
        public string SaveThuoc(Data.Thuoc data)
        {
            try
            {
                if (data.userid == null)
                {
                    data.userid = @Session["ms_userid"].ToString();
                }
                List<Object> lts = new List<Object>();
                foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("Thuocs", data)))
                {
                    lts.Add(JsonConvert.DeserializeObject<Data.Thuoc>(jo.ToString()));
                }
                Data.AjaxData ajaxdata = new Data.AjaxData(lts);
                return new JavaScriptSerializer().Serialize(ajaxdata);
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        [HttpPost]
        public string SaveNhapkho(Data.NhapAll data)
        {
            try
            {
                if (data.userid == null)
                {
                    data.userid = @Session["ms_userid"].ToString();
                }
                List<Object> lts = new List<Object>();
                foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("nhapkhos", data)))
                {
                    lts.Add(JsonConvert.DeserializeObject<Data.Nhapkho>(jo.ToString()));
                }
                Data.AjaxData ajaxdata = new Data.AjaxData(lts);
                return new JavaScriptSerializer().Serialize(ajaxdata);
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        [HttpPost]
        public string Check(Data.Check data)
        {
            try
            {
                if (data.obj != null && data.request != null)
                {
                    if (data.userid == null)
                    {
                        data.userid = @Session["ms_userid"].ToString();
                    }
                    return JObject.Parse(Bridge.HttpPostApi("Check", data))["result"].Value<string>();
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                return "";
            }
        }
    }
}
