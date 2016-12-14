using ApiManageSolution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiManageSolution.Controllers
{
    public class CheckController : ApiController
    {
        // GET api/check
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/check/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/check
        public Data.Check Post([FromBody]Data.Check data)
        {
            return Data.Check.Checked(data);
        }

        // PUT api/check/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/check/5
        public void Delete(int id)
        {
        }
    }
}
