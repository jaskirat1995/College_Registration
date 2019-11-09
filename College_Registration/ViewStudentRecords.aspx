<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewStudentRecords.aspx.cs" Inherits="College_Registration.ViewStudentRecords" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
     <script type="text/javascript">
        function opendialog(type, message) {

            if (type == 1) {
                $('#div_success').html('<i class="fa fa-check-circle"></i>&nbsp;&nbsp;' + message);
                $('#div_success').css('background-color', '#58b787');
                $('#div_success').css('color', '#fff');
                $('#div_success').css('font-size', '14px');
                $('#div_success').css('font-family', 'Poppins-Regular');
            }
            else if (type == 2) {
                $('#div_success').html('<i class="fa fa-times-circle"></i>&nbsp;&nbsp;' + message);
                $('#div_success').css('background-color', '#263039');
                $('#div_success').css('color', '#fff');
                $('#div_success').css('font-size', '14px');
                $('#div_success').css('font-family', 'Poppins-Regular');

            }
            else {
                $('#div_success').css('background-color', 'orange');
                $('#div_success').css('color', 'white');

            }

            $('#div_success').html(message);
            $('#div_success').slideDown().delay(3000).slideUp('slow');

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
      
        <div  class="container">
             <h2 style="margin: 0 auto; display: table; margin-top: 35px;margin-bottom:20px;border-bottom:2px solid #333333">View Student Records</h2>
            <asp:Button runat="server" ID="btn_addnewrecord" Text="Add New Record" CssClass="btn btn-success" OnClick="btn_addnewrecord_Click" style="margin:0 auto; display :table; width:180px;border-radius:0" />
           <div style="margin-top:20px">
            <asp:GridView ID="grd_viewStudents" runat="server" Width="100%" AutoGenerateColumns="false" OnRowCommand="grd_viewStudents_RowCommand" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_name" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Father Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_fathername" Text='<%# Eval("FatherName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Mother Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_mothername" Text='<%# Eval("MotherName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_cityname" Text='<%# Eval("City") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_state" Text='<%# Eval("State") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Year">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_year" Text='<%# Eval("tblYear.Year") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Course">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_course" Text='<%# Eval("tblCourse.CourseName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Batch">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_Batch" Text='<%# Eval("Batch") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Phone Number">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbl_PhoneNumber" Text='<%# Eval("PhoneNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField >
                        <ItemTemplate>
                          <asp:Button runat="server" ID="btn_edit" CssClass="btn btn-warning" CommandName ="edt" Text="Edit" CommandArgument='<%# Eval("Id") %>' style="margin : 0 auto; display:table;border-radius:0" />
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField>
                        <ItemTemplate>
                         <asp:Button runat="server" style="margin : 0 auto; display:table;border-radius:0" ID="btn_delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"  CssClass="btn btn-danger" CommandName ="dlt" Text="Delete" CommandArgument='<%# Eval("Id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <span style="color:red; font-size :18px">No Records Found!</span>
                </EmptyDataTemplate>
            </asp:GridView>
               </div>
        </div>
    </form>
</body>
</html>
