using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace ApiManageSolution.Models
{
    public class SHA1
    {
        public static string Encode(string value)
        {
            var hash = System.Security.Cryptography.SHA1.Create();
            var encoder = new System.Text.ASCIIEncoding();
            var combined = encoder.GetBytes(value ?? "");
            return BitConverter.ToString(hash.ComputeHash(combined)).ToLower().Replace("-", "");
        }

        public static string Khongdau(string v_text)
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
