using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;

namespace Medical.Models
{
    public class DataProcess
    {
        public static JObject ConvertJsonStringToJsonObject(string json)
        {
            try
            {
                JObject jsonObj = JObject.Parse(json);
                return jsonObj;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static string ConvertObjectToJsonString(object obj)
        {
            try
            {
                return new JavaScriptSerializer().Serialize(obj); ;
            }
            catch (Exception ex)
            {
                return "";
            }
        }
    }
}