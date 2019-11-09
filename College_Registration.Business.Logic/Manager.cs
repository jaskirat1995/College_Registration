using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using College_Registration.Business.Logic;
using College_Registration.Business.Logic.Domain;
namespace College_Registration.Business.Logic
{

    public class Manager
    {
        dbStudentEntities _db;
        public Manager()
        {
            _db = new dbStudentEntities();
        }
        #region Course
        public List<tblCourse> GetTblCourses()
        {
            List<tblCourse> lst = new List<tblCourse>();
            try
            {
                lst = _db.tblCourses.ToList();
            }
            catch (Exception a1)
            {

            }
            return lst;
        }
        #endregion

        #region Year
        public List<tblYear> GetTblYears()
        {
            List<tblYear> lst = new List<tblYear>();
            try
            {
                lst = _db.tblYears.ToList();
            }
            catch (Exception a1)
            {

            }
            return lst;
        }
        #endregion

        #region tblStudent
        public int AddStudentRecord(tblStudentRecord model)
        {
            int id = 0;
            try
            {
                int count = _db.tblStudentRecords.Where(a => a.EmailId == model.EmailId || a.PhoneNumber == model.PhoneNumber).Count();
                if (count == 0)
                {
                    _db.tblStudentRecords.Add(model);
                    _db.SaveChanges();
                    id = model.Id;
                }
                else
                {
                    id = -1;
                }
            }
            catch (Exception a1)
            { }
            return id;
        }
        public List<tblStudentRecord> GetTblStudentRecords()
        {
            List<tblStudentRecord> lst = new List<tblStudentRecord>();
            lst = _db.tblStudentRecords.OrderByDescending(a=>a.Id).ToList();
            return lst;
        }
        public tblStudentRecord GetTblStudentRecordById(int id)
        {
            tblStudentRecord tblStudentRecord = new tblStudentRecord();
            tblStudentRecord = _db.tblStudentRecords.Where(a => a.Id == id).FirstOrDefault();
            return tblStudentRecord;
        }
        public string updateStudentRecord(tblStudentRecord model)
        {
            string result = "0";
            tblStudentRecord tblStudentRecord = new tblStudentRecord();
            try
            {
                int count = _db.tblStudentRecords.Where(a => a.Id != model.Id && (a.EmailId == model.EmailId || a.PhoneNumber == model.PhoneNumber)).Count();
                if (count == 0)
                {
                    tblStudentRecord = _db.tblStudentRecords.Where(a => a.Id == model.Id).FirstOrDefault();
                    if (tblStudentRecord != null)
                    {
                        tblStudentRecord.Address = model.Address;
                        tblStudentRecord.Batch = model.Batch;
                        tblStudentRecord.City = model.City;
                        tblStudentRecord.CourseId = model.CourseId;
                        tblStudentRecord.EmailId = model.EmailId;
                        tblStudentRecord.FatherName = model.FatherName;
                        tblStudentRecord.LastUpdatedDate = model.LastUpdatedDate;
                        tblStudentRecord.MotherName = model.MotherName;
                        tblStudentRecord.YearId = model.YearId;
                        tblStudentRecord.Name = model.Name;
                        tblStudentRecord.PhoneNumber = model.PhoneNumber;
                        tblStudentRecord.Pincode = model.Pincode;
                        tblStudentRecord.State = model.State;
                        _db.SaveChanges();
                        result = "1";
                    }
                }
                else
                {
                    result = "-1";
                }
            }
            catch (Exception qa)
            {

            }

            return result;
        }
        public bool DeletetblStudentRecord(int id)
        {
            bool status = false;
            tblStudentRecord tblStudentRecord = _db.tblStudentRecords.Where(a => a.Id == id).FirstOrDefault();
            if (tblStudentRecord != null)
            {
                _db.tblStudentRecords.Remove(tblStudentRecord);
                _db.SaveChanges();
                status = true;
            }
            return status;
        }
        #endregion
    }
}
