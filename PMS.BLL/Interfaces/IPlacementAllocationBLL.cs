﻿using PMS.BOL;
using System.Collections.Generic;

namespace PMS.BLL
{
    public interface IPlacementAllocationBLL
    {
        PlacementAllocationDto GetPlacementAllocationByPlacementAllocationId(int placementAllocationId);
        public List<PlacementAllocationDto> GetPlacementAllocationByStudentId(int studentId);
        PlacementAllocationDto GetPlacementAllocationByPlacementDriveId(int placementDriveId);
        List<PlacementAllocationDto> GetAllPlacementAllocationbll();
        bool AllocatePlacementDriveToStudent(List<StudentDto> studentDto, int pId);
        List<PlacementAllocationDto> GetAllAllocatedStudent(int placementDriveId);
        public void InterviewComments(PlacementAllocationDto placementAlctnnDto);

        public List<PlacementAllocationDto> GetPlacementAllocationByCollegeId(int collegeId);
        public List<PlacementAllocationDto> GetAllPlacedStudentsList(int companyId);
        public int GetPlacedStudentsCount(int collegeId);
        public int GetAllocatedStudentsCount(int collegeID);
        public int GetAllPlacedStudentsCount(int companyID);
        public int GetallAllocatedStudentsCount(int companyID);










    }

}