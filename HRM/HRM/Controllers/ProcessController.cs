using HRM.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace HRM.Controllers
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
                    List<Object> lts = new List<Object>();
                    foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("Search", data)))
                    {
                        switch (data.Obj)
                        {
                            case "phongbans":
                                lts.Add(JsonConvert.DeserializeObject<Data.Phongban>(jo.ToString()));
                                break;
                            case "dmphais":
                                lts.Add(JsonConvert.DeserializeObject<Data.Dmphai>(jo.ToString()));
                                break;
                            case "nhanviens":
                                lts.Add(JsonConvert.DeserializeObject<Data.Nhanvien>(jo.ToString()));
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
        public string CreateVal(Data.CreateVal createval)
        {
            try
            {
                if (createval.Obj != "")
                {
                    return JObject.Parse(Bridge.HttpPostApi("CreateVal", createval))["result"].Value<string>();
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
        public string Gridview(Data.Filter data)
        {
            try
            {
                if (data.Obj != "")
                {
                    List<Object> lts = new List<Object>();
                    foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("Search", data)))
                    {
                        switch (data.Obj)
                        {
                            case "phongbans":
                                lts.Add(JsonConvert.DeserializeObject<Data.Phongban>(jo.ToString()));
                                break;
                            case "nhanviens":
                                lts.Add(JsonConvert.DeserializeObject<Data.Nhanvien>(jo.ToString()));
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
        public string SavePhongban(Data.Phongban data)
        {
            try
            {
                List<Object> lts = new List<Object>();
                foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("hrmphongbans", data)))
                {
                    lts.Add(JsonConvert.DeserializeObject<Data.Phongban>(jo.ToString()));
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
        public string SaveNhanvien(Data.Nhanvien data)
        {
            try
            {
                List<Object> lts = new List<Object>();
                foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("Thuocs", data)))
                {
                    lts.Add(JsonConvert.DeserializeObject<Data.Nhanvien>(jo.ToString()));
                }
                Data.AjaxData ajaxdata = new Data.AjaxData(lts);
                return new JavaScriptSerializer().Serialize(ajaxdata);
            }
            catch (Exception ex)
            {
                return "";
            }
        }
    }
}
