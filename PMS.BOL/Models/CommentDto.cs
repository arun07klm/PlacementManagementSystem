﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace PMS.BOL
{
    public class CommentDto
    {
        public int CommentId { get; set; }

        public int PlacementAllocationId { get; set; }

        public string CommentForOrg { get; set; }

        public string CommentForStudent { get; set; }

        public DateTime CreatedOn { get; set; }

        public byte Status { get; set; }
    }
}