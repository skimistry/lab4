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

<title>Book's Information page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
		<s:property value="jspTitle" />
	</h1>
	<s:iterator value="B" id="book">
	<ul>
	<li>
	Title:"<s:property value="#book.title" />"
	</li>
	<li>
	ISBN:"<s:property value="#book.ISBN" />"
	</li>
	<li>
	Publisher:"<s:property value="#book.publisher" />"
	</li>
	<li>
	PublishDate:"<s:property value="#book.publishDate" />"
	</li>
	<li>
	Price:"<s:property value="#book.price" />"
	</li>
	</ul>
	</s:iterator>
	<s:iterator value="A" id="author">
	<ul>
	<li>
	Name:"<s:property value="#author.name" />"
	</li>
	<li>
	AuthorID:"<s:property value="#author.authorID" />"
	</li>
	<li>
	Age:"<s:property value="#author.age" />"
	</li>
	<li>
	Country:"<s:property value="#author.country" />"
	</li>
	</ul>
	</s:iterator>
<!-- <table border=1 align="center">
		<tr>
			<td><b>Title</b>
			</td>
			<s:iterator value="B" id="book">
				<td>"<s:property value="#book.title" />"</td>
			</s:iterator>
		</tr>
		<tr>
			<td><b>ISBN</b>
			</td>
			<s:iterator value="B" id="book">
				<td><s:property value="#book.ISBN" />
				</td>
			</s:iterator>
		</tr>
		<tr>
			<td><b>Publisher</b>
			</td>
			<s:iterator value="B" id="book">
				<td><s:property value="#book.publisher" />
				</td>
			</s:iterator>
		</tr>
		<tr>
			<td><b>PublishDate</b>
			</td>
			<s:iterator value="B" id="book">
				<td><s:property value="#book.publishDate" />
				</td>
			</s:iterator>
		</tr>
		<tr>
			<td><b>Price</b>
			</td>
			<s:iterator value="B" id="book">
				<td><s:property value="#book.price" />
				</td>
			</s:iterator>
		</tr>
		<tr>
			<td><b>Name</b>
			</td>
			<s:iterator value="A" id="author">
				<td><s:property value="#author.name" />
				</td>
			</s:iterator>
		</tr>
		<tr>
			<td><b>AuthorID</b>
			</td>
			<s:iterator value="A" id="author">
				<td><s:property value="#author.authorID" />
				</td>
			</s:iterator>
		</tr>
		<tr>
			<td><b>Age</b>
			</td>
			<s:iterator value="A" id="author">
				<td><s:property value="#author.age" />
				</td>
			</s:iterator>
		</tr>
		<tr>
			<td><b>Country</b>
			</td>
			<s:iterator value="A" id="author">
				<td><s:property value="#author.country" />
				</td>
			</s:iterator>
		</tr>
	</table>
	-->
	<s:form align="CENTER" action="returnMyJsp.action">
		<s:submit value="Return" />
	</s:form>
	</div>
	<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://v3.bootcss.com/dist/js/bootstrap.min.js"></script>
</body>
</html>
