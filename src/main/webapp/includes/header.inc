<!-- Encoding -->
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!-- End encoding -->
<!DOCTYPE html>
<html>
<!-- Meta tags, external links & site title -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Responsive -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <!-- External CSS -->
    <link rel="stylesheet" href="css/styles.css" type="text/css">
    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css2?family=Caveat:wght@700&family=Open+Sans&display=swap"
          rel="stylesheet">
    <!-- Favicon -->
    <link href="/images/favicon/favicon.ico?" rel="icon" type="image/x-icon"/>
    <link rel="icon" type="image/png" href="images/favicon/favicon-16x16.png">
    <link rel="icon" type="image/png" href="images/favicon/favicon-32x32.png">
    <!-- header title -->
    <title>${requestScope.message}</title>
</head>
<!-- End meta tags, external links & site title -->

<!-- Body -->
<body>

<!-- Header -->
<header role="banner" class="jumbotron-fluid hide-on-print">
    <!-- Header text -->

    <div class="headerText px-3 py-3 d-none d-sm-inline-block">
        <p>
            Til dig, der går op i detaljen <br>
            Dig, der banker, borer, skærer, skruer, former, vinkler, farver <br>
            Tak, fordi du gør dig umage
        </p>
    </div>
    <!-- end header text -->

</header>
<!-- End header -->

<!-- Container -->
<div class="container" id="menContainer">

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark">

        <!-- Logo d-none d-sm-inline-block -->
        <a class="logo navbar-brand ml-5" href="FrontController?target=redirect&destination=index" title="Logo">

            <img heigth="90" width="90" src="images/logo.png" alt="Fog logo">
        </a>
        <!-- end logo -->

        <!-- Hamburger menu  ml-auto-->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <!-- End hamburger menu -->

        <!-- Collapse -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">

            <!-- Navigation links -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link text-white px-5 effects"
                       href="FrontController?target=redirect&destination=index">Home<span
                                class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-white px-5 effects"
                       href="FrontController?target=redirect&destination=customerpage">Bestil</a>
                </li>
            </ul>

            <a class="nav-link text-white my-2 my-sm-0 px-5 effects"
               href="FrontController?target=redirect&destination=login">Log ind
            </a>
            <!-- End navigation links -->

        </div>
        <!-- End collapse -->
    </nav>
    <!-- End navigation -->
</div>
<!-- End container -->

