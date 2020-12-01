<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authorization.aspx.cs" Inherits="PP.Pages.Authorization" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="../Content/bootstrap.min.css" />
    <link rel="stylesheet" href="../Content/bootstrap-grid.min.css" />
    <link rel="stylesheet" href="../Content/css/Styles.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

    <title>Авторизация</title>
    <style>

        #tbLogin{
            text-align:center;
        }
         #tbPassword{
            text-align:center;
        }
         #btEnter{
             margin-top: 10px;
         }

         body{
          background-color:#222

         }
        h1{
         color: rgb(255, 255, 255);
        font-size: 500%;
        text-shadow: rgb(204, 204, 204) 0px 1px 0px, rgb(201, 201, 201) 0px 2px 0px, rgb(187, 187, 187) 0px 3px 0px, rgb(185, 185, 185) 0px 4px 0px, rgb(170, 170, 170) 0px 5px 0px, rgba(0, 0, 0, 0.1) 0px 6px 1px, rgba(0, 0, 0, 0.1) 0px 0px 5px, rgba(0, 0, 0, 0.3) 0px 1px 3px, rgba(0, 0, 0, 0.15) 0px 3px 5px, rgba(0, 0, 0, 0.2) 0px 5px 10px, rgba(0, 0, 0, 0.2) 0px 10px 10px, rgba(0, 0, 0, 0.1) 0px 20px 20px;
        }
        #canvaseffect {
         position:absolute;
         top:0; left:0;
         opacity:.8;
        }
        .lblTitle{
           color: white;
           font-size: 24px;
        }
        .iframeAudio{            
            allow: "autoplay"
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">       
<canvas id="canvaseffect"></canvas>        
<div class="container">
<div class="row">
<div class="col-md-8 col-md-offset-2">

 <div class="sign-form" style="margin-top:200px">
            <div class="row justify-content-center">
            <h1 class="title">Авторизация</h1>
            <asp:Label runat="server" ID="lblAuthorization" Text="Неверный логин или пароль" Visible="false" CssClass="Error"></asp:Label>
           </div>
            <div class="row justify-content-center">
            <div class="col-lg-2 col-md-3 col-sm-4 col-xs-6 ">
                <div class="row justify-content-center">
                <label for="formGroupExampleInput" class="lblTitle" style="float: left">Логин</label>
                    </div>
                <asp:TextBox ID="tbLogin" runat="server" type="text" class="form-control"></asp:TextBox>
            </div>
                </div>
            <div class="row justify-content-center">
            <div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
                <div class="row justify-content-center">
                <label for="formGroupExampleInput2" class="lblTitle" style="text-align:center">Пароль</label>
                 </div>
                <asp:TextBox ID="tbPassword" runat="server" type="text" class="form-control" TextMode="Password"></asp:TextBox>
            </div>
                </div>
            <div class="row justify-content-center ">               
                    <asp:Button runat="server"  ID="btEnter" Text="ВОЙТИ" OnClick="btEnter_Click" CssClass="button"/>            
            </div>
       </div>

</div><!-- /.col-md-8 col-md-offset-2 -->
</div><!-- /.row -->
</div><!-- /.container -->

        <iframe src="../Music/Type Beat 2020 - Trap (www.hotplayer.ru).mp3"  height="1px" width="1px"  id="iframeAudio"> </iframe>


      
        <script>
            var w = canvaseffect.width = window.innerWidth,
                h = canvaseffect.height = window.innerHeight,
                ctx = canvaseffect.getContext('2d'),

                total = w,
                accelleration = .05,

                size = w / total,
                occupation = w / total,
                repaintColor = 'rgba(0, 0, 0, .04)'
            colors = [],
                dots = [],
                dotsVel = [];

            var portion = 360 / total;
            for (var i = 0; i < total; ++i) {
                colors[i] = portion * i;

                dots[i] = h;
                dotsVel[i] = 10;
            }

            function anim() {
                window.requestAnimationFrame(anim);

                ctx.fillStyle = repaintColor;
                ctx.fillRect(0, 0, w, h);

                for (var i = 0; i < total; ++i) {
                    var currentY = dots[i] - 1;
                    dots[i] += dotsVel[i] += accelleration;

                    ctx.fillStyle = 'hsl(' + colors[i] + ', 80%, 50%)';
                    ctx.fillRect(occupation * i, currentY, size, dotsVel[i] + 1);

                    if (dots[i] > h && Math.random() < .01) {
                        dots[i] = dotsVel[i] = 0;
                    }
                }
            }
            anim();
        </script>
    </form>
</body>
</html>