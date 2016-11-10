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
    public class FilterController : Controller
    {
        [HttpPost]
        public string Select(Data.FilterSelect filterselect)
        {
            try
            {
                if(filterselect.Obj != "")
                {           
                    List<Object> lts = new List<Object>();
                    foreach (JObject jo in JArray.Parse(Data.FilterSelect.Select(filterselect)))
                    {
                        switch(filterselect.Obj)
                        { 
                            case "nhomkhos":
                                lts.Add(JsonConvert.DeserializeObject<Data.NhomKho>(jo.ToString()));
                                break;
                            default:
                                break;
                        }
                    }
                    Data.Filter filter = new Data.Filter(lts);
                    return new JavaScriptSerializer().Serialize(filter);
                }
                else
                {
                    return "";
                }                
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
