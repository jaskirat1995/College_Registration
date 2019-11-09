<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="College_Registration.AddStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <script src="/js/jquery.min.js"></script>
      <%--Open Dialog--%>
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
          <asp:HiddenField runat="server" ID="hddn_studentId" />
         <div id="div_success" style="display: none; width: 100%; height: auto; overflow: hidden; position: fixed; top: 0; left: 0; z-index: 99999; line-height: 30px; font-size: 15px; text-align: center; padding: 10px"></div>
        <div class="container">
           
            <h2 style="margin: 0 auto; display: table; margin-top: 35px;border-bottom:2px solid #333333">Registration Form</h2>
           <div style="width:50%;margin:0  auto; display:table;margin-top:15px;">
            <div class="form-group">
                <label for="email">Name:</label>
                <asp:TextBox runat="server" ID="txt_name" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txt_name" ErrorMessage="Please enter your name!" ForeColor="Red" ValidationGroup="a" />
            </div>
            <div class="form-group">
                <label for="email">Father Name:</label>
                <asp:TextBox runat="server" ID="txt_fatherName" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txt_fatherName" ErrorMessage="Please enter your father name!" ForeColor="Red" ValidationGroup="a" />
            </div>
            <div class="form-group">
                <label for="email">Mother Name:</label>
                <asp:TextBox runat="server" ID="txt_motherName" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txt_motherName" ErrorMessage="Please enter your mother name!" ForeColor="Red" ValidationGroup="a" />
            </div>
            <div class="form-group">
                <label for="email">Phone Number:</label>
                <asp:TextBox runat="server" ID="txt_phoneNumber" MaxLength="15" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txt_phoneNumber" ErrorMessage="Please enter your phone number!"  ForeColor="Red" ValidationGroup="a" />
                <asp:RegularExpressionValidator  Display="Dynamic" ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_phoneNumber" ErrorMessage="Please Enter Only Numbers" style="float:left" ForeColor="Red" ValidationExpression="^\d+$" ValidationGroup="a"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <asp:TextBox runat="server" ID="txt_email" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txt_email" ErrorMessage="Please enter your email address!" ForeColor="Red" ValidationGroup="a" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email"
                    ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
                    Display="Dynamic" ErrorMessage="Invalid email address" ValidationGroup="a" style="float:left" />
            </div>
            <div class="form-group">
                <label for="email">City:</label>
                <asp:TextBox runat="server" ID="txt_city" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txt_city" ErrorMessage="Please enter your city name!" ForeColor="Red" ValidationGroup="a" />
            </div>
            <div class="form-group">
                <label for="email">State:</label>
                <asp:TextBox runat="server" ID="txt_state" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txt_state" ErrorMessage="Please enter your state name!" ForeColor="Red" ValidationGroup="a" />
            </div>
            <div class="form-group">
                <label for="email">Pincode:</label>
                <asp:TextBox runat="server" ID="txt_pincode" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txt_pincode" ErrorMessage="Please enter your pincode!" ForeColor="Red" ValidationGroup="a" />
            </div>

            <div class="form-group">
                <label for="email">Address:</label>
                <asp:TextBox runat="server" ID="txt_address" TextMode="MultiLine" Rows="3" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator8" ControlToValidate="txt_address" ErrorMessage="Please enter your address!" ForeColor="Red" ValidationGroup="a" />
            </div>
            <div class="form-group">
                <label for="email">Course:</label>
                <asp:DropDownList runat="server" ID="ddl_course" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" InitialValue="0" ID="RequiredFieldValidator9" ControlToValidate="ddl_course" ErrorMessage="Please choose your course!" ForeColor="Red" ValidationGroup="a" />
            </div>
            <div class="form-group">
                <label for="email">Year:</label>
                <asp:DropDownList runat="server" ID="ddl_year" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" InitialValue="0" ID="RequiredFieldValidator10" ControlToValidate="ddl_year" ErrorMessage="Please choose your year!" ForeColor="Red" ValidationGroup="a" />
            </div>
            <div class="form-group">
                <label for="email">Batch:</label>
                <asp:TextBox runat="server" ID="txt_batch" CssClass="form-control" placeholder="2019-2022"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator11" ControlToValidate="txt_batch" ErrorMessage="Please enter batch duration!" ForeColor="Red" ValidationGroup="a" />
            </div>
            <asp:Button runat="server" ID="btn_submit" CommandName="add" OnClick="btn_submit_Click" CssClass="btn btn-success" ValidationGroup="a" Text="Submit" style="margin-bottom:20px" />
            <asp:Button runat="server" ID="btn_back" OnClick="btn_back_Click" CssClass="btn btn-default" Text="Back" style="margin-bottom:20px;margin-left:10px" />
            </div>
        </div>

    </form>
</body>
</html>
