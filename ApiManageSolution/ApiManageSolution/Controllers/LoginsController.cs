using ApiManageSolution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiManageSolution.Controllers
{
    public class LoginsController : ApiController
    {
        // GET api/login
        public IEnumerable<Users> Get()
        {
            return Users.GetAll();
        }

        // GET api/login/5
        public IEnumerable<Users> Get(string id)
        {
            try
            {
                var ds = Users.GetAll();
                List<Users> lts = new List<Users>();
                lts.Add(ds.FirstOrDefault(p => p.iduser == id.ToString()));
                return lts;
            }
            catch
            {
                return null;
            }
        }

        // POST api/login
        public Users Post([FromBody]Users value)
        {
            try
            {
                string username = value.username_;
                var users = Users.GetAll();
                List<Users> lts = new List<Users>();
                lts.Add(users.FirstOrDefault(u => u.username_ == value.username_ && u.password_ == SHA1.Encode(value.password_)));
                //var user = users.Where(u => u.username_ == value.username_);
                return lts[0];
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
