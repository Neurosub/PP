<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Status.aspx.cs" Inherits="PP.Pages.Status" EnableEventValidation="false" %> <%--//надо--%>

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
    <link rel="stylesheet" href="../Scripts/Button.css" />
    <title>Статус</title>
<script src="../scripts/jquery-3.4.1.min.js"></script>
<script src="../scripts/jquery-3.4.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

    <script type="text/javascript">
        function test(e) {
            var keynum;
            if (window.event) // IE
            {
                keynum = e.keyCode
            }
            else if (e.which) // webkit
            {
                keynum = e.which
            }
            if (keynum == 13) __doPostback('btSearch', '');
        }
    </script>
                            
     <script type="text/javascript">
         function isDelete() {
             return confirm("Вы уверенны, что хотите удалить выбранную запись?");
         }
     </script>

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

        table{
            cursor: pointer;
            text-align: center;
        }   
        table td{
            font-size:22px;
        }   
        table th{
             font-size:22px;
        }   
        
        .navbar {
            margin-bottom: 20px;
        }

        .navbar a {
            color: chartreuse;
            text-transform: uppercase;
            text-decoration: none;
            letter-spacing: 0.15em;
            display: inline-block;
            padding: 7px 20px;
            position: relative;
            margin-right: 20px;
        }

        .navbar a:after {
            background: none repeat scroll 0 0 transparent;
            bottom: 0;
            content: "";
            display: block;
            height: 2px;
            left: 50%;
            position: absolute;
            background: chartreuse;
            transition: width 0.3s ease 0s, left 0.3s ease 0s;
            width: 0;
        }

        .navbar a:hover:after {
            width: 100%;
            left: 0;
        }

        .Helper{
            font-size: 23px;
            color: black;
        }

          .Helper2{
            font-size: 15px;
            color: black;
        }    
          
          #btSearch{
              font-size: 12px;
            border-radius: 10px;
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

            <!-- Модальное окно -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Поддержка <i class="fa fa-commenting" aria-hidden="true"></i></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body row justify-content-center">
                            <div class="form-group col-12">
                                <label class="Helper ">Имя</label>
                                <asp:TextBox class="form-control" ID="tbNameHelp"  runat="server" type="search"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbNameHelp1" runat="server" ValidationGroup="1" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbNameHelp" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-12">
                                <label class="Helper">Почта</label>
                                <asp:TextBox class="form-control" ID="tbMailHelp" runat="server" type="search"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbMailHelp1" runat="server"  ValidationGroup="1" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbMailHelp" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                            
                            </div>
                            <div class="form-group col-12">
                                <label class="Helper">Описание проблемы</label>
                                <asp:TextBox class="form-control" ID="tbHelp" runat="server" type="search"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="tbHelp1" runat="server" ValidationGroup="1" ErrorMessage="Поле не должно быть пустым" class="error" ControlToValidate="tbHelp" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
                            </div>
                            <div class="form-group col-12">
                                <asp:Label ID="Info" runat="server" class="Helper">Контактная информация <i class="fa fa-book" aria-hidden="true"></i> </asp:Label>
                                </div>
                                 <div class="form-group col-12">                                     
                               <asp:Label ID="lblmailinfo" runat="server" class="Helper2">Почта для обратной связи: i_a.s.popov@mpt.ru</asp:Label>
                                     </div>
                                     <div class="form-group col-12">   
                               <asp:Label ID="lblnumberinfo" runat="server" class="Helper2">Номер телефона: 8 (333) 333-33-33 </asp:Label>
                                         </div>
                                         <div class="form-group col-12">   
                                <asp:Label ID="lbladressinfo" runat="server" class="Helper2">Адрес: Нежинская д. 7</asp:Label>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <asp:Button type="button" runat="server" class="btn btn-secondary" data-dismiss="modal" CausesValidation="false" Text="Отмена"></asp:Button>
                            <asp:Button type="button" runat="server" class="btn btn-primary" OnClick="btSendHelp_Click" ValidationGroup="1" Text="Отправить"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">                   
                    <li class="nav-item">
                        <a class="nav-link " href="StaffList.aspx" id="StaffList" aria-haspopup="true" aria-expanded="false">Список сотрудников
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Position.aspx" id="Position" aria-haspopup="true" aria-expanded="false">Справочник должностей
                        </a>
                    </li>
                    <li class="nav-item ">
                        <a class="nav-link active" href="Status.aspx" id="Status" aria-haspopup="true" aria-expanded="false">Справочник статусов
                        </a>
                    </li>
                     <li class="nav-item ">
                        <a class="nav-link" href="Documents.aspx" id="Documents" aria-haspopup="true" aria-expanded="false">Статус сотрудников
                        </a>
                    </li>
                    <li>
                    <button type="button" class="btn third" data-toggle="modal" data-target="#myModal"> <i class="fa fa-envelope-o" aria-hidden="true"></i> Поддержка</button> 
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
                    <div class="col col-md-2">
                      <asp:Button ID="btSearch" class="btn btn-outline-danger btn-block btn-lg" runat="server" Text="Поиск" />
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
         <%--   //надо--%>
            
            <div class="row justify-content-center">
                  <div class=" col-lg-8">
                <asp:GridView ID="gvStatus" runat="server" Class="table table-dark table-condensed table-hover" AllowSorting="True" CurrentSortDirection="ASC" Font-Size="16px" AlternatingRowStyle-Wrap="false"
                    HeaderStyle-HorizontalAlign="Center" OnRowDataBound="gvStatus_RowDataBound" OnSelectedIndexChanged="gvStatus_SelectedIndexChanged" OnRowDeleting="gvStatus_RowDeleting">
                     <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="btDelete" runat="server" ImageUrl="~/Image/block.svg"  ControlStyle-Width="50px" CommandName="Delete" OnClientClick="return isDelete()" ToolTip="Удалить" CausesValidation="false"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                </asp:GridView>
            </div>

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
