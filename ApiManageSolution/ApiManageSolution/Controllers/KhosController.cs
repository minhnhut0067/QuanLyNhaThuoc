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
            return Data.Khos.GetAll();
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
        public Data.Users Post([FromBody]Data.Khos value)
        {
            try
            {
                //string username = value.username_;
                //var users = Data.Khos.GetAll();
                //List<Data.Khos> lts = new List<Data.Khos>();
                //lts.Add(users.FirstOrDefault(u => u.username_ == value.username_ && u.password_ == SHA1.Encode(value.password_)));
                ////var user = users.Where(u => u.username_ == value.username_);
                //return lts[0];
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
