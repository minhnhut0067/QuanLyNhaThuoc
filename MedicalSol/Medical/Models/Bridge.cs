using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace Medical.Models
{
    public class Bridge
    {
        //private static string DefaultUrl = "http://localhost:8080";
        private static string DefaultUrl = "http://localhost:48187";
        //private static string DefaultUrl = "http://www.cybermedisoft.com/apisol";       
        public static string HttpPostApi(string apiControl, Object obj)
        {
            return HttpPostApi(DefaultUrl, apiControl, obj);
        }

        public static string HttpPostApi(string Url, string apiControl, Object obj)//string v_page, string v_action
        {
            try
            {               
                using (var client = new WebClient())
                {
                    client.Headers[HttpRequestHeader.ContentType] = "application/json";//application/x-www-form-urlencoded
                    client.Encoding = ASCIIEncoding.UTF8;
                    var value = ConvertObjtoJson(obj);
                    var result = client.UploadString(Url + "/api/" + apiControl, "POST", value);
                    return result;
                }
            }
            catch
            {
                return "";
            }
        }

        public static string HttpGetApi(string apiControl)
        {
            return HttpGetApi(DefaultUrl, apiControl);
        }

        public static string HttpGetApi(string Url, string apiControl)
        {
            try
            {
                using (var client = new WebClient())
                {
                    client.Headers[HttpRequestHeader.ContentType] = "application/json";//application/x-www-form-urlencoded
                    client.Encoding = ASCIIEncoding.UTF8;
                    var result = client.DownloadString(Url + "/api/" + apiControl);
                    return result;
                }
            }
            catch
            {
                return "";
            }
        }

        public static string ConvertObjtoJson(Object obj)
        {
            try
            {
                JsonSerializerSettings settings = new JsonSerializerSettings();
                settings.ContractResolver = new CamelCasePropertyNamesContractResolver();
                var data = JsonConvert.SerializeObject(obj, settings);
                return data;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
    }
}