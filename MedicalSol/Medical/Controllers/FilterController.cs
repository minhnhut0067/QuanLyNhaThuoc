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
                //JObject job = JObject.Parse(filterselect.Datafilter);
                List<Data.NhomKho> lstnhomkho = new List<Data.NhomKho>();
                //IEnumerable<JObject> arr = JObject.Parse(filterselect.Datafilter)["Rows"].Values<IEnumerable<JObject>>().Where(m => m["ma"].Value<string>().ToLower().Contains(filterselect.Value != null ? filterselect.Value.ToLower() : "") || m["ten"].Value<string>().ToLower().Contains(filterselect.Value != null ? filterselect.Value.ToLower() : "")).Take(50);
                IEnumerable<JObject> lst = JObject.Parse(filterselect.Datafilter)["Rows"].Values<JObject>().Where(m => m["ma"].Value<string>().ToLower().Contains(filterselect.Value != null ? filterselect.Value.ToLower() : "") || m["ten"].Value<string>().ToLower().Contains(filterselect.Value != null ? filterselect.Value.ToLower() : "")).Take(50);
                foreach (JObject jo in lst)
                {
                    lstnhomkho.Add(JsonConvert.DeserializeObject<Data.NhomKho>(jo.ToString()));
                }
                //var auctions = JsonConvert.DeserializeObject<IEnumerable<Data.NhomKho>>(jarr);
                Data.Filter filter = new Data.Filter(lstnhomkho);
                return new JavaScriptSerializer().Serialize(filter);
            }
            catch(Exception ex)
            {
                return ex.Message;
            }
        }
    }
}
