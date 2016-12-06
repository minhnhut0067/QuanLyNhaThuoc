using ApiManageSolution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiManageSolution.Controllers
{
    public class KhosController : ApiController
    {
        // GET api/login
        public IEnumerable<Data.Khos> Get()
        {
            return Data.Khos.Get("");
        }

        // GET api/login/5
        public IEnumerable<Data.Khos> Get(string id)
        {
            try
            {
                //var ds = Data.Khos.GetAll();
                //List<Data.Khos> lts = new List<Data.Khos>();
                //lts.Add(ds.FirstOrDefault(p => p.iduser == id.ToString()));
                //return lts;
                return null;
            }
            catch
            {
                return null;
            }
        }

        // POST api/login
        public IEnumerable<Data.Khos> Post([FromBody]Data.Khos data)
        {
            try
            {
                if(data != null)
                {
                    return Data.Khos.Upd(data);
                }
                return null;
            }
            catch
            {
                return null;
            }
        }

        // PUT api/login/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/login/5
        public void Delete(int id)
        {
        }
    }
}
