using ApiManageSolution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiManageSolution.Controllers
{
    public class ThuocsController : ApiController
    {
        // GET api/thuocs
        public IEnumerable<Data.Thuocs> Get()
        {
            return Data.Thuocs.GetAll();
        }

        // GET api/thuocs/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/thuocs
        public void Post([FromBody]string value)
        {
        }

        // PUT api/thuocs/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/thuocs/5
        public void Delete(int id)
        {
        }
    }
}
