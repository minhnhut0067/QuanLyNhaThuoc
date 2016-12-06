using ApiManageSolution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiManageSolution.Controllers
{
    public class NhomKhosController : ApiController
    {
        // GET api/nhomkhos
        public IEnumerable<Data.Nhomkhos> Get()
        {
            return Data.Nhomkhos.Get("");
        }

        // GET api/nhomkhos/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/nhomkhos
        public void Post([FromBody]string value)
        {
        }

        // PUT api/nhomkhos/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/nhomkhos/5
        public void Delete(int id)
        {
        }
    }
}
