<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'result.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page!">
<link href="http://v3.bootcss.com/dist/css/bootstrap.min.css" rel="stylesheet">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Book Library</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="search.action">Search Book</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    <div class="container theme-showcase" role="main">
    <br />
		<br />
		<br />
		<br />
	<h1>
		<b><s:property value="jspTitle" />
		</b>
	</h1>
	<hr>
	<table border=1>
		<tr>
			<td>ISBN</td>
			<td>Title</td>
			<td>authorID</td>
			<td>Publisher</td>
			<td>PublishDate</td>
			<td>Price</td>
		</tr>
		<s:iterator value="B" id="book" status="stuts">
			<tr>
				<td><s:property value="#book.ISBN" />
				</td>
				<td><a
					href="<s:url action="information.action"><s:param name="target" value="#book.ISBN"></s:param></s:url>"><s:property
							value="#book.title" />
				</a>
				</td>
				<td><s:property value="#book.authorID" />
				</td>
				<td><s:property value="#book.publisher" />
				</td>
				<td><s:property value="#book.publishDate" />
				</td>
				<td><s:property value="#book.price" />
				</td>
				<td>
				<a href="<s:url action="deleteBegin.action"><s:param name="target" value="#book.ISBN"></s:param></s:url>">Delete</a>
				</td>
			</tr>
		</s:iterator>
	</table>
	<br /><br/>
	<b>Click the Book's title for more information.</b>
	<s:form action="returnMyJsp.action">
		<s:submit value="Return" />
	</s:form>
	</div>
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://v3.bootcss.com/dist/js/bootstrap.min.js"></script>
</body>
</html>
