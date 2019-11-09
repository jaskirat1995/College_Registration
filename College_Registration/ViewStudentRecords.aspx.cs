using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using College_Registration.Business.Logic;
using College_Registration.Business.Logic.Domain;
namespace College_Registration
{
    public partial class ViewStudentRecords : System.Web.UI.Page
    {
        Manager mm;
        public ViewStudentRecords()
        {
            mm = new Manager();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindStudentRecords();
            }
        }
        public void bindStudentRecords()
        {
            List<tblStudentRecord> lst = mm.GetTblStudentRecords();
            if (lst != null && lst.Count > 0)
            {
                grd_viewStudents.DataSource = lst;
                grd_viewStudents.DataBind();
            }
            else
            {
                grd_viewStudents.DataSource = null;
                grd_viewStudents.DataBind();
            }

        }

        protected void btn_addnewrecord_Click(object sender, EventArgs e)
        {
            Response.Redirect("/addstudent");
        }

        protected void grd_viewStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "edt")
            {
                int id = 0;
                int.TryParse(e.CommandArgument.ToString(), out id);
                if(id > 0)
                {
                    Response.Redirect("/addstudent?ID=" + id);
                }
            }
            if(e.CommandName == "dlt")
            {
                int id = 0;
                int.TryParse(e.CommandArgument.ToString(), out id);
                if (id > 0)
                {
                    bool status = mm.DeletetblStudentRecord(id);
                    if(status == true)
                    {
                        Page.RegisterStartupScript("puneet", "<script>opendialog(1,\"Record deleting successfully\");</script>");
                        bindStudentRecords();
                    }
                    else
                    {
                        Page.RegisterStartupScript("puneet", "<script>opendialog(2,\"Error! in deleting record\");</script>");
                    }
                }
            }
        }
    }
}