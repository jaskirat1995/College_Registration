using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using College_Registration.Business.Logic.Domain;
using College_Registration.Business.Logic;
namespace College_Registration
{
    public partial class AddStudent : System.Web.UI.Page
    {
        Manager mm;
        public AddStudent()
        {
            mm = new Manager();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                bind_course();
                bind_year();

                if (Request.QueryString["ID"] != null)
                {
                    hddn_studentId.Value = Request.QueryString["ID"].ToString();
                    btn_submit.Text = "Update";
                    btn_submit.CommandName = "update";
                    btn_submit.CommandArgument = hddn_studentId.Value;

                    tblStudentRecord data = mm.GetTblStudentRecordById(Convert.ToInt32(hddn_studentId.Value));
                    if(data != null)
                    {
                        txt_address.Text = data.Address;
                        txt_batch.Text = data.Batch;
                        txt_city.Text = data.City;
                        txt_email.Text = data.EmailId;
                        txt_fatherName.Text = data.FatherName;
                        txt_motherName.Text = data.MotherName;
                        txt_name.Text = data.Name;
                        txt_phoneNumber.Text = data.PhoneNumber;
                        txt_pincode.Text = data.Pincode;
                        txt_state.Text = data.State;
                        ddl_course.SelectedValue = data.CourseId.ToString();
                        ddl_year.SelectedValue = data.YearId.ToString();
                    }
                }
            }

        }

        public void bind_course()
        {
            List<tblCourse> lst = mm.GetTblCourses();
            if(lst != null && lst.Count > 0)
            {
                ddl_course.DataSource = lst;
                ddl_course.DataTextField = "CourseName";
                ddl_course.DataValueField = "Id";
                ddl_course.DataBind();
                ddl_course.Items.Insert(0,new ListItem("--Select Course--", "0"));
            }
        }

        public void bind_year()
        {
            List<tblYear> lst = mm.GetTblYears();
            if (lst != null && lst.Count > 0)
            {
                ddl_year.DataSource = lst;
                ddl_year.DataTextField = "Year";
                ddl_year.DataValueField = "Id";
                ddl_year.DataBind();
                ddl_year.Items.Insert(0,new ListItem("--Select Year--", "0"));
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            tblStudentRecord data = new tblStudentRecord();
            data.Address = txt_address.Text.Trim();
            data.Batch = txt_batch.Text.Trim();
            data.City = txt_city.Text.Trim();
            data.CourseId = Convert.ToInt32(ddl_course.SelectedValue);
            data.EmailId = txt_email.Text.Trim();
            data.FatherName = txt_fatherName.Text.Trim();
            data.LastUpdatedDate = DateTime.UtcNow;
            data.MotherName = txt_motherName.Text.Trim();
            data.Name = txt_name.Text.Trim();
            data.PhoneNumber = txt_phoneNumber.Text.Trim();
            data.Pincode = txt_pincode.Text.Trim();
            data.State = txt_state.Text.Trim();
            data.YearId = Convert.ToInt32(ddl_year.SelectedValue);
            if(btn_submit.CommandName == "add")
            {
                data.CreatedDate = DateTime.UtcNow;
                int id = mm.AddStudentRecord(data);
                if(id > 0)
                {
                    clear();
                    Page.RegisterStartupScript("puneet", "<script>opendialog(1,\"Your profile added successfully\");window.setTimeout(function(){window.location.href = \"/viewstudentrecords\"}, 3000);</script>");
                }
                else if(id == -1)
                {
                    Page.RegisterStartupScript("puneet", "<script>opendialog(2,\"Email or Phonenumber is already exists. Please try another\");</script>");
                }
                else
                {
                    Page.RegisterStartupScript("puneet", "<script>opendialog(2,\"Error! in adding your profile\");</script>");
                }
            }
            else if(btn_submit.CommandName == "update")
            {
               data.Id = Convert.ToInt32(btn_submit.CommandArgument);
               string result = mm.updateStudentRecord(data);
                if (result == "1")
                {
                    clear();
                    Page.RegisterStartupScript("puneet", "<script>opendialog(1,\"Your profile updated successfully\");window.setTimeout(function(){window.location.href = \"/viewstudentrecords\"}, 3000);</script>");
                }
                else if (result == "-1")
                {
                    Page.RegisterStartupScript("puneet", "<script>opendialog(2,\"Email or Phonenumber is already exists. Please try another\");</script>");
                }
                else
                {
                    Page.RegisterStartupScript("puneet", "<script>opendialog(2,\"Error! in updating your profile\");</script>");
                }
            }
        }


        public void clear()
        {
            txt_address.Text = "";
            txt_batch.Text = "";
            txt_city.Text = "";
            txt_email.Text = "";
            txt_fatherName.Text = "";
            txt_motherName.Text = "";
            txt_name.Text = "";
            txt_phoneNumber.Text = "";
            txt_pincode.Text = "";
            txt_state.Text = "";
            ddl_course.SelectedValue = "0";
            ddl_year.SelectedValue = "0";
        }

        protected void btn_back_Click(object sender, EventArgs e)
        {
            Response.Redirect("/viewstudentrecords");
        }
    }
}