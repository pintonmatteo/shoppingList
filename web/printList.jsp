<%-- 
    Document   : printList
    Created on : 6-dic-2016, 16.35.07
    Author     : matte
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="list" class="parlato2889.ListBean" scope="session"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Shopping List">
        <meta name="author" content="Matteo Parlato">

        <title>Stampa lista della spesa</title>

        <!-- Bootstrap Core CSS -->
        <link href="res/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Custom CSS -->
        <link href="res/css/custom.css" rel="stylesheet">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>
        
        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <!-- Title -->
                <div class="col-md-12">
                    <h1 class="page-header">
                        Lista della spesa
                    </h1>
                    
                    <ul class="list-unstyled">
                    <%
                        ArrayList<String> elements = list.getList();
                        System.out.println(elements);
                        for(String s : elements)
                        {
                            %>
                            <li>
                                <p style="float: left;">
                                    <%
                                        out.println(s);
                                    %>
                                </p>
                            </li>
                            <br><br>
                            <%
                        }
                    %>
                    </ul>

                </div>

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="res/js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="res/js/bootstrap.min.js"></script>

    </body>

</html>