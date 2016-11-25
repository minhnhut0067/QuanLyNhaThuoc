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

        public static string Kkhongdau(string v_text)
        {
            try
            {
                var unicodeString = v_text;
                //Remove VietNamese character
                //unicodeString = unicodeString.ToLower();
                unicodeString = Regex.Replace(unicodeString, "[áàảãạâấầẩẫậăắằẳẵặ]", "a", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[éèẻẽẹêếềểễệ]", "e", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[íìỉĩị]", "i", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[óòỏõọơớờởỡợôốồổỗộ]", "o", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[úùủũụưứừửữự]", "u", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[ýỳỷỹỵ]", "y", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[đ]", "d", RegexOptions.None);

                unicodeString = Regex.Replace(unicodeString, "[ÁÀẢÃẠÂẤẦẨẪẬĂẮẰẲẴẶ]", "A", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[ÉÈẺẼẸÊẾỀỂỄỆ]", "E", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[ÍÌỈĨỊ]", "I", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[ÓÒỎÕỌƠỚỜỞỠỢÔỐỒỔỖỘ]", "O", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[ÚÙỦŨỤƯỨỪỬỮỰ]", "U", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[ÝỲỶỸỴ]", "Y", RegexOptions.None);
                unicodeString = Regex.Replace(unicodeString, "[Đ]", "D", RegexOptions.None);

                //Remove space
                //unicodeString = unicodeString.Replace(" ", "");
                //Remove special character
                //unicodeString = Regex.Replace(unicodeString, "[`~!@#$%^&*()-+=?/>.<,{}[]|]\\]", "");
                return unicodeString;
            }
            catch (Exception)
            {
                return "";
            }
        }
    }
}