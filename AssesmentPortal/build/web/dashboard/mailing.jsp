

<%@page import="java.util.ArrayList"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Mailing</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap-responsive.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/stylesheet.css" rel="stylesheet">
        <link href="fonts/fonts.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/bootstrap-responsive.min.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/customstylesheet.css" rel="stylesheet">
        <link href="<%=request.getContextPath()%>/dashboard/dashcss/button.css" rel="stylesheet" >
      
    </head>
    <body>
        <div class="wrapper1">
            <div class="headerinner clearfix">
                <header class="row-fluid">
                    <article id="innlogo" class="span3"><a href="#"><img src="<%=request.getContextPath()%>/dashboard/img/logo.png" alt="" title="logo"></a></article>
                    <article id="inptxt" class="span4"><input type="text" placeholder="Search" class="input-block-level" id="inputNew"></article>
                    <article id="transforming" class="span5">
                        <ul>
                            <li><img src="<%=request.getContextPath()%>/dashboard/img/home_img.jpg" alt="" title=""></li>   
                            <li><img src="<%=request.getContextPath()%>/dashboard/img/chat_img.jpg" alt="" title=""></li>
                            <li><img src="<%=request.getContextPath()%>/dashboard/img/percent.jpg" alt="" title=""></li>
                        </ul>

                    </article>
                </header>
            </div>

            <div class="leftsec clearfix">

                <div class="clearfix"></div>
                <div id="adminmenuback"></div>

                <section class="adminmenuwrap clearfix">
                    <section class="profilpc">
                        <img src="<%=request.getContextPath()%>/dashboard/img/profpic.png" alt="">
                    </section>
                    <ul>
                        <li><p><img src="<%=request.getContextPath()%>/dashboard/img/dashome.png" alt=""></p><a href="#">Dashboard</a></li>
                        <li><p><img src="<%=request.getContextPath()%>/dashboard/img/ui.png" alt=""></p><a href="#">UI Elements</a></li>
                        <li><p><img src="<%=request.getContextPath()%>/dashboard/img/input.png" alt=""></p><a href="#">Input</a></li>
                        <li><p><img src="img/input.png" alt=""></p><a href="#">Input</a></li>
                        <li><p><img src="img/input.png" alt=""></p><a href="#">Input</a></li>
                    </ul>
                </section>

            </div>

            <div class="centersec clearfix">
                <div class="prof">   
                    <h4>Mail</h4>
                    <section class="centr">

                        <form action="MailServlet" method="get" name="adduser">
                            <table class="box-table-a">
                                <caption></caption>
                                <tbody>
                                    <tr>
                                        <td><h5>To :</h5></td>
                                        <td><select name="directorylist" onchange = "">
                                                <option>Add Recipient</option>
                                                <c:forEach items="${userlist}" var="userlist">
                                                    <option value="${userlist.userslist}">${userlist.userslist}</option>   
                                                </c:forEach>
                                            </select></td> </tr>
                                    <tr>
                                        <td>Subject :</td>
                                        <td><input type="text" name="subject" value="" maxlength="25" required/></td>
                                    </tr>
                                </tbody></table>

                            <table class="box-table-a">
                                <tbody>
                                    <tr>
                                        <td><h5>Message :</h5>
                                            <textarea name="message" rows="6" cols="" maxlength="450">
                                            </textarea></td>

                                    </tr>
                                    <tr>
                                        <td>
                                            <a href="#" onclick="JAVASCRIPT:adduser.submit()"  class="sbtnSubmit">Send</a>
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </form>
                        <table>
                            <tr><td>
                                    <table class="box-table-b">
                                        <caption>Inbox</caption>
                                        <thead>
                                            <tr>
                                                <th scope="col">Message Id</th>
                                                <th scope="col">Subject</th>
                                                <th scope="col">Sender</th>
                                                <th scope="col">Date</th>

                                            </tr>
                                        </thead>
                                        <c:forEach items="${alstmessagesreceived}" var="message">
                                            <tbody><tr>
                                                    <td>${message.messageid}</td> 
                                                    <td>${message.subject}</td> 
                                                    <td>${message.sender}</td> 
                                                     


                                                </tr> </tbody></c:forEach>
                                    </table>  </td><td><table class="box-table-c"></table></td>
                                <td>
                                        <table class="box-table-b">
                                            <caption>Sent Messages</caption>
                                            <thead>
                                                <tr>
                                                    <th scope="col">Message Id</th>
                                                    <th scope="col">Subject</th>
                                                    <th scope="col">Receiver</th>
                                                    <th scope="col">Date</th>
                                                    <th scope="col">Viewed</th>

                                                </tr>
                                            </thead>
                                            <tbody>

                                            <c:forEach items="${alstmessagessent}" var="message"><tr>
                                                    <td>${message.messageid}</td> 
                                                    <td>${message.subject}</td> 
                                                    <td>${message.receiver}</td> 
                                                     

                                                    <td><input type="checkbox" name="msg viewed" value="ON" disabled="disabled" /></td>

                                                </tr> </c:forEach></tbody>

                                    </table></td></tr></table>
                    </section>
                </div> </div>

        </div>
    </body>
</html>