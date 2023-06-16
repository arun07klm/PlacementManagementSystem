﻿using PMS.BOL;
using PMS.DAL;
using PMS.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using MimeKit.Encodings;
using Org.BouncyCastle.Math.EC.Rfc7748;
using Microsoft.AspNetCore.Mvc;


namespace PMS.BLL
{
    public class PlacementAllocationBLL : IPlacementAllocationBLL
    {
        IPlacementAllocationRepository _placementAllocationRepository;
        IStudentRepository _studentRepository;
        ICollegeRepository _collegeRepository;
        ICompanyRepository _companyRepository;
        public PlacementAllocationBLL(IPlacementAllocationRepository placementAllocationRepository,IStudentRepository studentRepository,ICompanyRepository companyRepository,ICollegeRepository collegeRepository)
        {
            _placementAllocationRepository = placementAllocationRepository;
            _studentRepository = studentRepository;
            _collegeRepository = collegeRepository;
            _companyRepository = companyRepository;
        }

        public PlacementAllocationDto GetPlacementAllocationByPlacementAllocationId(int placementAllocationId)
        {
            var placementAllocation = _placementAllocationRepository.FirstOrDefault(x => x.PlacementAllocationId == placementAllocationId, include: x => x.Include(y => y.Student));
            var placementAllocationDto = new PlacementAllocationDto();
            if (placementAllocation != null)
            {
                CopyToDto(placementAllocation, placementAllocationDto);
                
            }
            return placementAllocationDto;
        }
        public PlacementAllocationDto GetPlacementAllocationByPlacementDriveId(int placementDriveId)
        {
            var placementAllocation = _placementAllocationRepository.FirstOrDefault(x => x.PlacementDriveId == placementDriveId, include: x => x.Include(y => y.PlacementDrive));
            var placementAllocationDto = new PlacementAllocationDto();
            if (placementAllocation != null) CopyToDto(placementAllocation, placementAllocationDto);
            return placementAllocationDto;
        }

        public PlacementAllocationDto GetPlacementAllocationByStudentId(int studentId)
        {
            var placementAllocation = _placementAllocationRepository.GetAll(x => x.StudentId == studentId);
            var placementAllocationDto = new PlacementAllocationDto();
            if (placementAllocation != null)
            {foreach(var placement in placementAllocation)


                {
                    var placementallocationDto = new PlacementAllocationDto();
                    CopyToDto(placement, placementAllocationDto);


                }
            }
               
            return placementAllocationDto;
        }

        public PlacementAllocationDto GetPlacementAllocationByCollegeId(int collegeId)
        {
            var placementAllocation = _placementAllocationRepository.FirstOrDefault(x => x.PlacementDrive.CollegeId == collegeId);
            var placementAllocationDto = new PlacementAllocationDto();
            if (placementAllocation != null)
            {
                
                CopyToDto(placementAllocation, placementAllocationDto);
            }
            return placementAllocationDto;

        }



        public void InterviewComments(PlacementAllocationDto placementAlctnnDto)
        {
            var placementAllocation = _placementAllocationRepository.FirstOrDefault(x => x.PlacementAllocationId == placementAlctnnDto.PlacementAllocationId);

            if (placementAllocation != null)
            {
                placementAllocation.Comment = placementAllocation.Comment ?? new Comment();
                placementAllocation.Comment.CommentForOrg = placementAlctnnDto.CommentDto.CommentForOrg;
                placementAllocation.Comment.CommentForStudent = placementAlctnnDto.CommentDto.CommentForStudent;
                placementAllocation.PlacementStatus = placementAlctnnDto.PlacementStatus;
                _placementAllocationRepository.Update(placementAllocation);
                
            }        

        }
       


        
        

        public List<PlacementAllocationDto> GetAllPlacementAllocationbll()
        {
            var placementAllocation = _placementAllocationRepository.GetAll(x => x.PlacementStatus == (byte)PMSEnums.RecordStatus.ACTIVE, x => x.Student, x => x.PlacementDrive);
            var placementAllocationDtoList = new List<PlacementAllocationDto>();
            if (placementAllocation != null) { }
            {
                foreach (var item in placementAllocation)
                {
                    var placementAllocationDto = new PlacementAllocationDto();
                    CopyToDto(item, placementAllocationDto);
                    placementAllocationDtoList.Add(placementAllocationDto);
                }
            }
            return placementAllocationDtoList;
        }
        public List<PlacementAllocationDto> GetAllAllocatedStudent(int placementDriveId)
        {
            var placementAllocation = _placementAllocationRepository.GetAll(x => x.PlacementDriveId == placementDriveId, x => x.Student, x => x.PlacementDrive, x => x.PlacementDrive.Company
                                    , x => x.Student.Department, x => x.Student.Department.College);
            var placementAllocationDtoList = new List<PlacementAllocationDto>();
            if (placementAllocation != null) { }
            {
                foreach (var item in placementAllocation)
                {
                    var placementAllocationDto = new PlacementAllocationDto();
                    CopyToDto(item, placementAllocationDto);
                    placementAllocationDtoList.Add(placementAllocationDto);
                }
            }
            return placementAllocationDtoList;
        }
        public bool AllocatePlacementDriveToStudent(List<StudentDto> studentDto, int pId)
        {
            bool bRet = false;
            if (pId != 0)
            {
                try
                {
                    foreach (var item in studentDto.Where(x => x.AllocateToDrive == true))
                    {
                        var placementAllocation = new PlacementAllocation();
                        placementAllocation.StudentId = item.StudentId;
                        placementAllocation.PlacementDriveId = pId;
                        placementAllocation.PlacementStatus = (byte)PMSEnums.PlacementStatus.ALLOCATED;
                        var allocation = _placementAllocationRepository.FirstOrDefault(x => x.StudentId == item.StudentId && x.PlacementDriveId == pId);
                        if (allocation == null) _placementAllocationRepository.Insert(placementAllocation);
                    }
                    bRet = true;
                }
                catch (Exception ex)
                {
                    bRet = false;
                }
            }

            return bRet;
        }
        public List<PlacementAllocationDto> GetAllPlacedStudents()
        {
            var placementAllocation = _placementAllocationRepository.GetAll(x => x.PlacementStatus == (byte)PMSEnums.PlacementStatus.PLACED, x => x.Student, x => x.PlacementDrive);
            var placementAllocationDtoList = new List<PlacementAllocationDto>();
            if (placementAllocation != null) { }
            {
                foreach (var item in placementAllocation)
                {
                    var placedStudentsList = new PlacementAllocationDto();
                    CopyToDto(item, placedStudentsList);
                    placementAllocationDtoList.Add(placedStudentsList);
                }
            }
            return placementAllocationDtoList;
        }
       

        
        

        



        void CopyFromDto(PlacementAllocationDto source, PlacementAllocation target)
        {
            target.Rating = source.Rating;
            target.PlacementStatus = source.PlacementStatus;


        }
        void CopyToDto(PlacementAllocation source, PlacementAllocationDto target)
        {
            target.PlacementAllocationId = source.PlacementAllocationId;
            target.PlacementDriveId = source.PlacementDriveId;
            target.PlacementStatus = source.PlacementStatus;
            target.StudentId = source.StudentId;
            target.CommentId = source.CommentId;
            target.StudentDto = new StudentDto { DepartmentDto = new DepartmentDto { CollegeDto = new CollegeDto() } };
            target.StudentDto.Name = source.Student?.Name;
            target.PlacementDriveDto = new PlacementDriveDto { CompanyDto = new CompanyDto() };
            target.PlacementDriveDto.CompanyDto.Name = source.PlacementDrive.Company?.Name;
           
            target.StudentDto.DepartmentDto.CollegeDto.CollegeName = source.Student?.Department?.College?.CollegeName;


        }

    }

}