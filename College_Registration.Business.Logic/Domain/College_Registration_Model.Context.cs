﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace College_Registration.Business.Logic.Domain
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class dbStudentEntities : DbContext
    {
        public dbStudentEntities()
            : base("name=dbStudentEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tblCourse> tblCourses { get; set; }
        public virtual DbSet<tblStudentRecord> tblStudentRecords { get; set; }
        public virtual DbSet<tblYear> tblYears { get; set; }
    }
}