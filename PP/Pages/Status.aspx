<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="PP.Pages.Status" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../Content/bootstrap.min.css" />
    <link rel="stylesheet" href="../Content/bootstrap-grid.min.css" />
    <link rel="icon" href="/images/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js"></script>
    <script src="../Scripts/Navbar.js"></script>
    <link rel="stylesheet" href="/Preloader.css"/>
    <title>Статус</title>

    <script>
        window.onload = function () {
            let preloader = document.getElementById('preloader');
            preloader.style.display = 'none';
        };
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
            font-size: 14px;
            border-radius: 10px;
            background: #D8BFD8;
        }

        #tbName:hover{
            background: white;
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

        .lblName {
            margin: 0;
            font-size: 22px;
            color: white;
            font-weight: bold;
        }

        #tbSearch {
            background: #D8BFD8;
        }

        #tbSearch:hover{
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
        #tbSearch:focus {
            background: White;
        }

        .btn-outline-danger {
            color: black;
            background: #D8BFD8;
            border-color: white;
        }

        .error {
            color: red;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="sdsStatus" runat="server"></asp:SqlDataSource>
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
            <a class="navbar-brand" href="#">
                <img src="../Image/icon.jpg" width="150" height="70" class="d-inline-block align-top" alt=""/>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">                   
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="DropKadrovik" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Страницы сотрудников отдела кадров
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                            <a class="dropdown-item fa fa-address-book-o" href="#">  Список сотрудников</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="DropOxrana" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Страницы сотрудников охраны
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">                            
                            <a class="dropdown-item fa fa-address-book-o" href="#">  Список сотрудников</a>
                        </div>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="DropAdmin" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Страницы администратора
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item fa fa-book fa-fw" href="#">  Список статусов</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item fa fa-book fa-fw" href="#">  Список должностей</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item fa fa-address-book-o" href="#">  Список сотрудников</a>
                        </div>
                    </li>
                </ul>
               
            </div>
        </nav>
         <div class="preloader" id="preloader">
            <div class="cssload-tetrominos">
                <div class="cssload-tetromino cssload-box1"></div>
                <div class="cssload-tetromino cssload-box2"></div>
                <div class="cssload-tetromino cssload-box3"></div>
                <div class="cssload-tetromino cssload-box4"></div>
            </div>
        </div>
        <h1 class="title">Статус</h1>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-sm-10 col-md-8 col-lg-6">
                    <asp:TextBox class="form-control" ID="tbSearch" runat="server" type="search"></asp:TextBox>
                </div>
            </div>
            <div class="row justify-content-center">
                    <div class="form-group col-md-4">
                        <label class="lblName">Название</label>
                        <asp:TextBox class="form-control" ID="tbName" runat="server" type="search"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="tbName1" runat="server" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbName" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="tbName2" ControlToValidate="tbName" ValidationExpression="^[а-яА-Я]+$" ErrorMessage="Некорректный ввод символов" Display="Dynamic" class="error" EnableClientScript="true" runat="server" />
                </div>
            </div>

            <div class="row justify-content-center">
                <asp:GridView ID="gvStatus" runat="server" Class="table table-dark" AllowSorting="True" CurrentSortDirection="ASC" Font-Size="16px" AlternatingRowStyle-Wrap="false"
                    HeaderStyle-HorizontalAlign="Center" OnRowDataBound="gvStatus_RowDataBound">
                    <Columns>
                        <asp:CommandField ShowSelectButton="true" SelectText="Выбрать" />
                    </Columns>
                </asp:GridView>
            </div>

            <div class="form-row col-12">
                <div class="form-group col-md-6">
                    <asp:Button ID="btInsert" class="btn btn-outline-danger btn-block btn-lg" runat="server" Text="Добавить" OnClick="btInsert_Click" />
                </div>
                <div class="form-group col-md-6">
                    <asp:Button ID="btUpdate" class="btn btn-outline-danger btn-block btn-lg" runat="server" Text="Изменить" OnClick="btUpdate_Click" />
                </div>
             </div>           
        </div>
    </form>
</body>
</html>
