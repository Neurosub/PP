<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Staff.aspx.cs" Inherits="PP.Pages.Staff" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../Content/bootstrap.min.css" />
    <link rel="stylesheet" href="../Content/bootstrap-grid.min.css" />
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <title>Регистрация</title>
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js"></script>
    <script src="../Scripts/Navbar.js"></script>
    <link rel="stylesheet" href="/Preloader.css"/>

    <script>
        window.onload = function () {
            let preloader = document.getElementById('preloader');
            preloader.style.display = 'none';
        };
    </script>


    <script>
        $(document).ready(function () {
            $("#tbBirthDate").mask("99.99.9999");
        });
    </script>

    <style>
        body {
            background: #222222;
        }

        .title {
            text-align: center;
            color: white;
        }

        .form-control {
            font-size: 20px;
            border-radius: 10px;
            background: #D8BFD8;
        }

        .search{
            border-radius: 10px;
            background: #D8BFD8;
        }

        .search:hover{
                background: White;
                border-color: darkred;
                box-shadow: 0 0 10px 0 darkred;
                -webkit-transition: 0.3s ease-out;
                -webkit-transition-delay: 0.1s;
                -o-transition: 0.3s ease-out;
                -o-transition-delay: 0.1s;
                -moz-transition: 0.3s ease-out;
                -moz-transition-delay: 0.1s;
                transition: 0.3s ease-out;
                transition-delay: 0.1s;
        }

            .form-control:hover {
                background: White;
                border-color: darkred;
                box-shadow: 0 0 10px 0 darkred;
                -webkit-transition: 0.3s ease-out;
                -webkit-transition-delay: 0.1s;
                -o-transition: 0.3s ease-out;
                -o-transition-delay: 0.1s;
                -moz-transition: 0.3s ease-out;
                -moz-transition-delay: 0.1s;
                transition: 0.3s ease-out;
                transition-delay: 0.1s;
            }

        .form-group {
            text-align: center;
        }

        .lblText {
            margin: 0;
            font-size: 18px;
            color: white;
            font-weight: bold;
        }

        .btn-outline-danger {
            color: black;
            background: #D8BFD8;
            border-color: white;
            font-size: 30px;
            border-radius: 40px;
           
        }

        .error {
            color: red;
        }

        .card {
            top: 15%;
            bottom:25%;
            background: #0b0d0f;
            position: absolute;
        }
        #magic-line {
          position: absolute;
          bottom: 0;
          left: 0;
          width: 100px;
          height: 4px;
          background: #4B0082;
        }
      
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="sdsStaff" runat="server"></asp:SqlDataSource>
        <div class="preloader" id="preloader">
            <div class="cssload-tetrominos">
                <div class="cssload-tetromino cssload-box1"></div>
                <div class="cssload-tetromino cssload-box2"></div>
                <div class="cssload-tetromino cssload-box3"></div>
                <div class="cssload-tetromino cssload-box4"></div>
            </div>
        </div>
        


        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-xs-12 col-sm-10 col-md-10 col-lg-8 card ">
                    <div class="card-body">
                        <h1 class="title"><i class="fa fa-user-plus" aria-hidden="true"></i> Регистрация <i class="fa fa-spinner fa-pulse fa-1x fa-fw"></i> </h1>                        
                        <div class="form-row col-12">
                            <div class="form-group col-md-4">
                                <label class="lblText">Имя</label>
                                <asp:TextBox class="form-control" ID="tbName" runat="server" type="search"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbName1" runat="server" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbName" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="tbName2" ControlToValidate="tbName" ValidationExpression="^[а-яА-Я]+$" ErrorMessage="Некорректный ввод символов" Display="Dynamic" class="error" EnableClientScript="true" runat="server" />

                            </div>
                            <div class="form-group col-md-4">
                                <label class="lblText">Фамилия</label>
                                <asp:TextBox class="form-control" ID="tbSurname" type="search" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbSurname1" runat="server" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbSurname" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="tbSurname2" ControlToValidate="tbSurname" ValidationExpression="^[а-яА-Я]+$" ErrorMessage="Некорректный ввод символов" Display="Dynamic" class="error" EnableClientScript="true" runat="server" />

                            </div>
                            <div class="form-group col-md-4">
                                <label class="lblText">Отчество</label>
                                <asp:TextBox class="form-control" ID="tbMiddleName" type="search" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbMiddleName1" runat="server" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbMiddleName" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="tbMiddleName2" ControlToValidate="tbMiddleName" ValidationExpression="^[а-яА-Я]+$" ErrorMessage="Некорректный ввод символов" Display="Dynamic" class="error" EnableClientScript="true" runat="server" />

                            </div>
                        </div>
                        <div class="form-row col-12">
                            <div class="form-group col-md-12">
                                <label class="lblText">Дата рождения</label>
                                <asp:TextBox class="form-control" ID="tbBirthDate" TextMode="date" type="date" MaxLength="8" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbBirthDate1" runat="server" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbBirthDate" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-row col-12">
                            <div class="form-group col-md-4">
                                <label class="lblText">Логин</label>
                                <asp:TextBox class="form-control" ID="tbLogin" runat="server" type="search"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbLogin1" runat="server" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbLogin" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="tbLogin2" ControlToValidate="tbLogin" ValidationExpression="^[а-яА-ЯёЁa-zA-Z0-9]+$" ErrorMessage="Некорректный ввод символов" Display="Dynamic" class="error" EnableClientScript="true" runat="server" />
                            </div>
                            <div class="form-group col-md-4">
                                <label class="lblText">Пароль</label>
                                <asp:TextBox class="form-control" ID="tbPassword" runat="server" type="search"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbPassword1" runat="server" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbPassword" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="tbPassword2" ControlToValidate="tbPassword" ValidationExpression="^[а-яА-ЯёЁa-zA-Z0-9]+$" ErrorMessage="Некорректный ввод символов" Display="Dynamic" class="error" EnableClientScript="true" runat="server" />

                            </div>
                            <div class="form-group col-md-4">
                                <label style="white-space: nowrap;" class="lblText">Подтверждение пароля</label>
                                <asp:TextBox class="form-control" ID="tbConfirmPassword" type="search" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbConfirmPassword1" runat="server" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbConfirmPassword" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="tbConfirmPassword2" ControlToValidate="tbConfirmPassword" ValidationExpression="^[а-яА-ЯёЁa-zA-Z0-9]+$" ErrorMessage="Некорректный ввод символов" Display="Dynamic" class="error" EnableClientScript="true" runat="server" />

                            </div>
                        </div>
                        <div style="margin-top:30px" class="form-row col-12" >                            
                                <asp:Button ID="btInsert" class="btn btn-outline-danger btn-block btn-lg col-lg-12" runat="server" Text="Зарегистрироваться" />                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
