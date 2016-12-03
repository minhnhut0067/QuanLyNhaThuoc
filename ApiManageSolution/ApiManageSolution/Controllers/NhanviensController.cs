using ApiManageSolution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiManageSolution.Controllers
{
    public class NhanviensController : ApiController
    {
        // GET api/nhanviens
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/nhanviens/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/nhanviens
        public IEnumerable<Data.Nhanviens> Post([FromBody]Data.Nhanviens data)
        {
            if (data != null)
            {
                return Data.Nhanviens.Upd(data);
            }
            return null;
        }

        // PUT api/nhanviens/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/nhanviens/5
        public void Delete(int id)
        {
        }
    }
}
