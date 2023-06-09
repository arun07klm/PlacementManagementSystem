﻿using Microsoft.AspNetCore.Mvc;
using PMS.BLL;
using PMS.BOL;

namespace PMS.Controllers
{
    public class DepartmentController : Controller
    {
        IDepartmentBLL _departmentBll;
        public DepartmentController(IDepartmentBLL departmentBLL)
        {
            _departmentBll = departmentBLL;

        }
        public IActionResult Index()
        {
            var loogedInUser = HttpContext.Session.GetObject<LoggedInUserVM>("LoggedInUser");
            var departmentList = _departmentBll.GetDepartmentunderCollege(loogedInUser.CollegeDto.CollegeId);
            return View(departmentList);
        }

        public IActionResult Edit(int id)
        {
            ViewBag.ErrorCnfMsg = null;
            var department = _departmentBll.GetDepartmentByDepartmentId(id);
            return View(department);
        }
        [HttpPost]
        public IActionResult Edit(DepartmentDto departmentDto)
        { 
            if(ModelState.IsValid)
            {
                _departmentBll.UpdateDepartment(departmentDto);
                return RedirectToAction("Index");
            }
            ViewBag.ErrorCnfMsg = ModelState["UserDto.ConfirmPassword"]?.Errors[0].ErrorMessage;
            return View(); 

        }

        public IActionResult Create()
        {
            ViewBag.ErrorConfMsg = null;
            var department = new DepartmentDto();
            return View(department);

        }
        [HttpPost]

        public IActionResult Create(DepartmentDto departmentDto)
        {
            if (ModelState.IsValid)
            {
                var loogedInUser =HttpContext.Session.GetObject<LoggedInUserVM>("LoggedInUser");
                if(loogedInUser?.CollegeDto!=null) departmentDto.CollegeId = loogedInUser.CollegeDto.CollegeId;
                _departmentBll.CreateDepartment(departmentDto);
                return RedirectToAction("Index");
            }
            ViewBag.ErrorCnfMsg = ModelState["UserDto.ConfirmPassword"]?.Errors[0].ErrorMessage;    
            return View();
        }
        public IActionResult Delete(int id)
        {
            _departmentBll.DeleteDeparment(id);
            return RedirectToAction("Index");
        }
    }
}

   
