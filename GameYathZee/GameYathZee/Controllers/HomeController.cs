using GameYathZee.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Linq;

namespace GameYathZee.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Home/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Home/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Home/Create

        [HttpPost]
        public ActionResult Create(Data data)
        {
            //D:\nhut\project\QuanLyNhaThuoc\GameYathZee\GameYathZee\App_Data\Chuan.xml
            //D:\nhut\project\QuanLyNhaThuoc\GameYathZee\GameYathZee\Controllers\HomeController.cs
            try
            {
                // TODO: Add insert logic here
                XmlDocument xmldoc = new XmlDocument();
                StringBuilder sb = new StringBuilder();
                string path = Server.MapPath("/App_Data/");
                if (!System.IO.File.Exists(path + data.match.ToLower() + ".xml"))
                {
                    sb.Append("DATA");
                    xmldoc.Load(Server.MapPath("/App_Data/Chuan.xml"));
                    JObject json = JObject.Parse(JsonConvert.SerializeXmlNode(xmldoc));
                    //var doc = XDocument.Load(Server.MapPath("/App_Data/Chuan.xml"));
                    //xmldoc.LoadXml(doc.ToString());
                    //string json = JsonConvert.SerializeXmlNode(doc);
                    //var jsonData = doc.Root.Elements().Select(x => x.Element("DATA"));
                    foreach (var item in (JArray)json["ROW"])
                    {

                    }
                    //foreach (dynamic job in JArray.Parse(doc.Root.Value))
                    //{
                    //    if (row == 0)
                    //    {
                    //        numofcol = job["col"].Count;
                    //        foreach (var item in job["col"])
                    //        {
                    //            if (item == data.player)
                    //            {
                    //                break;
                    //            }
                    //            col++;
                    //        }
                    //    }
                    //    else
                    //    {
                    //        if (job["col"].Count > 0)
                    //        {
                    //            var dem = 0;
                    //            foreach (var item in (JArray)job["col"])
                    //            {
                    //                if (dem == col)
                    //                {
                    //                    item[dem] = data.point;
                    //                }
                    //                dem++;
                    //            }
                    //        }
                    //        else
                    //        {
                    //            JArray jarr = new JArray();
                    //            for (var i = 0; i < numofcol; i++)
                    //            {
                    //                if (i == col && row == Int32.Parse(data.choose))
                    //                {
                    //                    jarr.Add(data.point.ToString());
                    //                }
                    //                else
                    //                {
                    //                    jarr.Add("null");
                    //                }
                    //            }
                    //            job["col"] = jarr;
                    //        }
                    //    }
                    //    JarrResult.Add(job);
                    //    row++;
                    //}

                    //using (FileStream fs = System.IO.File.Create(path + data.match.ToLower() + ".txt"))
                    //{
                    //    Byte[] info = new UTF8Encoding(true).GetBytes(JsonConvert.SerializeObject(JarrResult));
                    //    // Add some information to the file.
                    //    fs.Write(info, 0, info.Length);
                    //}

                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Home/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Home/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Home/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Home/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
