﻿ using Microsoft.Extensions.DependencyInjection.Extensions;
using PMS.BLL;
using PMS.DAL;

namespace PMS
{
    public static class RegisterServices
    {
        public static IServiceCollection AddApplicationDependencies(this IServiceCollection services)
        {
            services.TryAddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            // Data Repos
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<ICollegeRepository, CollegeRepository>();
            services.AddScoped<ICompanyRepository, CompanyRepository>();
            services.AddScoped<IStudentRepository, StudentRepository>();
            services.AddScoped<IDepartmentRepository, DepartmentRepository>();
            services.AddScoped<IPlacementDriveRepository, PlacementDriveRepository>();
            services.AddScoped<IPlacementAllocationRepository, PlacementAllocationRepository>();
            // Services
            services.AddScoped<IUserBLL, UserBLL>();
            services.AddScoped<ICollegeBLL, CollegeBLL>();
            services.AddScoped<ICompanyBLL, CompanyBLL>();
            services.AddScoped<IDepartmentBLL, DepartmentBLL>();
            services.AddScoped<IStudentBLL, StudentBLL>();  
            services.AddScoped<IPlacementDriveBLL, PlacementDriveBLL>();
            services.AddScoped<IPlacementAllocationBLL, PlacementAllocationBLL>();
            return services;
        }
    }
}
