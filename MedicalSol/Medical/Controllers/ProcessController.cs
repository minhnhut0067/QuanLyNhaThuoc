﻿using Medical.Models;
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
        public string Filter(Data.Filter filter)
        {
            try
            {
                if (filter.Obj != "")
                {
                    List<Object> lts = new List<Object>();
                    foreach (JObject jo in JArray.Parse(Bridge.HttpPostApi("Search", filter)))
                    {
                        switch (filter.Obj)
                        {
                            case "nhomkhos":
                                lts.Add(JsonConvert.DeserializeObject<Data.NhomKho>(jo.ToString()));
                                break;
                            default:
                                break;
                        }
                    }
                    Data.AjaxData data = new Data.AjaxData(lts);
                    return new JavaScriptSerializer().Serialize(data);
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
        public string Table(Data.Table table)
        {
            try
            {
                if (table.Obj != "")
                {
                    List<Object> lts = new List<Object>();
                    foreach (JObject jo in JArray.Parse(Bridge.HttpGetApi(table.Obj)))
                    {
                        switch (table.Obj)
                        {
                            case "khos":
                                lts.Add(JsonConvert.DeserializeObject<Data.Kho>(jo.ToString()));
                                break;
                            default:
                                break;
                        }
                    }
                    Data.AjaxData data = new Data.AjaxData(lts);
                    return new JavaScriptSerializer().Serialize(data);
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
    }
}