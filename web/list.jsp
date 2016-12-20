<%-- 
    Document   : list
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

        <title>Lista della spesa</title>

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
       
        <%
            String postParameter;
            for(Enumeration e = request.getParameterNames(); e.hasMoreElements();)
            {
                String parameterName = (String)e.nextElement();
                if(parameterName.equals("insertElement"))
                {
                    postParameter = request.getParameter("insertElement");
                    if(postParameter != null && postParameter.isEmpty() == false)
                    {
                        list.addElement(postParameter);
                    }
                }
                if(parameterName.equals("deleteElement"))
                {
                    list.removeElement(request.getParameter("deleteElement"));
                }
                if(parameterName.equals("moveUpElement"))
                {
                    list.moveElement(request.getParameter("moveUpElement"), true);
                }
                if(parameterName.equals("moveDownElement"))
                {
                    list.moveElement(request.getParameter("moveDownElement"), false);
                }
            }            
        %>
        
        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <!-- Title -->
                <div class="col-md-8">
                    <h1 class="page-header">
                        Lista della spesa
                    </h1>
                    
                    <ul class="list-unstyled">
                    <%
                        ArrayList<String> elements = list.getList();
                        int size = elements.size();
                        for(int i = 0; i < size; i++)
                        {
                            String s = elements.get(i);
                            %>
                            <li>
                                <p style="float: left;">
                                    <%
                                        out.println(s);
                                    %>
                                </p>
                                <div style="float: right;">
                                    <%
                                    out.println("<a href='list.jsp?deleteElement=" + s + "'>Elimina</a>");
                                    out.println("<a href='modifyListElement.jsp?element=" + s + "' style='margin-left: 15px;'>Modifica</a>");
                                    if(i != 0)
                                    {
                                        out.println("<a href='list.jsp?moveUpElement=" + s + "' style='margin-left: 15px;'>↑</a>");
                                    }
                                    if(i != size - 1)
                                    {
                                        out.println("<a href='list.jsp?moveDownElement=" + s + "' style='margin-left: 15px;'>↓</a>");
                                    }
                                    %>
                                </div>
                            </li>
                            <br><br>
                            <%
                        }
                    %>
                    </ul>

                </div>
				
                <div class="col-md-4">

                    <!-- Add to list -->
                    <div class="well" style="margin-top: 90px;">
                        <h4>Aggiungi alla lista</h4>
                        <div class="input-group col-lg-12">
                            <form action="list.jsp" method="post">
                                <input type="text" name="insertElement" class="form-control">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-default" style="float: right; margin-top: 5px;">Aggiungi</button>
                                </span>
                            </form>
                        </div>
                        <!-- /.input-group -->
                    </div>

                    <!-- Tools -->
                    <div class="well">
                        <h4>Strumenti</h4>
                        <div class="row">
                            <div class="col-lg-6">
                                <ul class="list-unstyled">
                                    <li><a href="printList.jsp">Stampa lista</a></li>
                                </ul>
                            </div>
                            <!-- /.col-lg-6 -->
                        </div>
                        <!-- /.row -->
                    </div>

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