<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Waiting.aspx.cs" Inherits="PP.Pages.Waiting" %>

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
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/jquery.maskedinput.min.js"></script>
    <script src="../Scripts/Navbar.js"></script>
    <link rel="stylesheet" href="/Preloader.css"/>
    <title>Ожидание...</title>
    <style>
      .tuna {
  animation: walk-cycle 1s steps(12) infinite;
  background: url(http://stash.rachelnabors.com/img/codepen/tuna_sprite.png) 0 0 no-repeat; 
  height: 200px;
  width: 400px;
  position: absolute;
  bottom: 1px;
  left: 50%;
  margin-left: -200px;
  transform: translateZ(0); /* offers a bit of a performance boost by pushing some of this processing to the GPU in Safari*/
}

@keyframes walk-cycle {  
  0% {background-position: 0 0; } 
  100% {background-position: 0 -2391px; } 
}

.foreground, .midground, .background {
  width: 100%;
  height: 100%;
  position: absolute;
  top: 0; left: 0;
  translate3d(0,0,0); 
}

.foreground {
  animation: parallax_fg linear 10s infinite both;
  background:  url(http://stash.rachelnabors.com/24ways2012/foreground_grass.png) 0 100% repeat-x;
  z-index: 3;
}

@keyframes parallax_fg {  
  0% { background-position: -3584px 100%;} 
  100% {background-position: 0 100%; } 
}

.midground {
  animation: parallax_mg linear 20s infinite;
  background:  url(http://stash.rachelnabors.com/24ways2012/midground_grass.png) 0 100% repeat-x;
  z-index: 2;
}

@keyframes parallax_mg {  
  0% { background-position: -3000px 100%;} 
  100% {background-position: 0 100%; } 
}

.background {
  background-image:
    url(http://stash.rachelnabors.com/24ways2012/background_mountain5.png),
    url(http://stash.rachelnabors.com/24ways2012/background_mountain4.png),
    url(http://stash.rachelnabors.com/24ways2012/background_mountain3.png),
    url(http://stash.rachelnabors.com/24ways2012/background_mountain2.png),
    url(http://stash.rachelnabors.com/24ways2012/background_mountain1.png);
  background-repeat: repeat-x;
  background-position: 0 100%;
  z-index: 1;
  animation: parallax_bg linear 40s infinite;
}

@keyframes parallax_bg {
  100% { background-position-x: 2400px, 2000px, 1800px, 1600px, 1200px;}
}

body {
    background: linear-gradient(top, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 100%),
    #d2d2d2 url(http://stash.rachelnabors.com/24ways2012/background_clouds.png);
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
      

        <div class="foreground">
              <div class="row justify-content-center" style="margin-top:20px">
              <h1 class="title"> Если вы уже получили письмо <i class="fa fa-envelope-o" aria-hidden="true"></i> можете авторизоваться: </h1>
            <asp:Button ID="btAuth" class="btn btn-outline-danger btn-block btn-lg col-lg-12" runat="server" Text="Авторизоваться" OnClick="btAuth_Click" />
        </div>
        <div class="row justify-content-center" style="margin-top:200px">
             <h1 class="title"> Пожалуйста проверьте письмо на почте!!   </h1>

        </div>
        </div>

<div class="midground">
  <div class="tuna">

  </div>
</div>

<div class="background">

</div>

    </form>
</body>
</html>
