﻿using ApiManageSolution.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ApiManageSolution.Controllers
{
    public class LydonxsController : ApiController
    {
        // GET api/lydonxs
        public IEnumerable<Data.Lydonxs> Get()
        {
            return Data.Lydonxs.Get("");
        }

        // GET api/lydonxs/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/lydonxs
        public void Post([FromBody]string value)
        {
        }

        // PUT api/lydonxs/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/lydonxs/5
        public void Delete(int id)
        {
        }
    }
}
