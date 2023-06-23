﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Newtonsoft.Json;
using PMS.BLL;
using PMS.BOL;
using PMS.Models;
using System.Diagnostics;

namespace PMS.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        IUserBLL _userBLL;
        ICollegeBLL _collegeBLL;
        ICompanyBLL _companyBLL;
        IStudentBLL _studentBLL;
        IPlacementAllocationBLL _placementAllocationBLL;
        public HomeController(ILogger<HomeController> logger, IUserBLL userBLL,ICollegeBLL collegeBLL,ICompanyBLL companyBLL, IStudentBLL studentBLL,IPlacementAllocationBLL placementAllBLL)
        {
            _logger = logger;
            _userBLL = userBLL;
            _collegeBLL = collegeBLL;
            _companyBLL= companyBLL;
            _studentBLL = studentBLL;
            _placementAllocationBLL = placementAllBLL;
        }

        public IActionResult Index()
        {
            var loggedInUser =HttpContext.Session.GetObject<LoggedInUserVM>("LoggedInUser");
            loggedInUser.PlacedStudentCount= PlacedStudentCount();
            return View(loggedInUser);
        }

        public IActionResult Privacy()
        {
            return View();
        }
        [AllowAnonymous]
        public IActionResult Login()
        {
            return View();
        }
        [AllowAnonymous]
        public IActionResult Register()
        {
            return View();
        }
        
        [HttpPost]
        public IActionResult Login(UserDto userDto)
        {
            if (userDto != null)
            {
                var user = _userBLL.GetUserByCredentials(userDto);
                LoggedInUserVM userVm = new LoggedInUserVM();
                if (user.UserId != 0)
                {
                    switch (user.Usertype)
                    {
                        case (byte)PMSEnums.UserType.STUDENT:
                            userVm.UserType = (byte)PMSEnums.UserType.STUDENT;
                            userVm.UserName = userDto.Username;
                            userVm.StudentDto = _studentBLL.GetStudentByID(userDto.UserId);
                            break;
                        case (byte)PMSEnums.UserType.COLLEGE:
                            userVm.CollegeDto = _collegeBLL.GetCollegeByUserId(userDto.UserId);
                            userVm.UserName = userDto.Username;
                            userVm.UserType = (byte)PMSEnums.UserType.COLLEGE;
                            break;
                        case (byte)PMSEnums.UserType.COMPANY:
                            userVm.CompanyDto = _companyBLL.GetCompanyByUserId(userDto.UserId);
                            userVm.UserName = userDto.Username;
                            userVm.UserType = (byte)PMSEnums.UserType.COMPANY;
                            break;
                        case (byte)PMSEnums.UserType.ADMIN:
                            userVm.UserType = (byte)PMSEnums.UserType.ADMIN;
                            userVm.UserName = "Admin";
                            //Admin

                            break;
                    }
                    HttpContext.Session.SetObject("LoggedInUser", userVm);
                }
                else
                {
                    ViewBag.ErrorMsg = "Username or password is incorrect.";
                    return View();
                }
            }
            return RedirectToAction("Index", "Home");
        }        
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        public IActionResult Logout()
        {
            HttpContext.Session.Remove("LoggedInUser"); ;
            return RedirectToAction("Login", "Home");
        }

        private int PlacedStudentCount()
        {
            var loogedInUser = HttpContext.Session.GetObject<LoggedInUserVM>("LoggedInUser");
            int collegeId = loogedInUser.CollegeDto?.CollegeId ?? 0;
            return _placementAllocationBLL.GetPlacedStudentsCount(collegeId);
        }
        public IActionResult StudentCount()
        {
            int studentCount = _userBLL.GetStudentCount();
            ViewData["StudentCount"] = studentCount;
            return View();
        }

        public IActionResult CompanyCount()
        {
            int companyCount = _userBLL.GetCompanyCount();
            ViewData["CompanyCount"] = companyCount;
            return View();
        }
    }
}