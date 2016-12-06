using ApiManageSolution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiManageSolution.Controllers
{
    public class CreateValController : ApiController
    {
        // GET api/createvallue
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/createvallue/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/createvallue
        public Data.CreateVal Post([FromBody]Data.CreateVal data)
        {
            try
            {                                
                return Data.CreateVal.Create(data);
            }
            catch(Exception ex)
            {
                return null;
            }
        }

        // PUT api/createvallue/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/createvallue/5
        public void Delete(int id)
        {
        }
    }
}
