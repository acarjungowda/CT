<%@ page language="java" contentType="text/html; charset=GB18030"
	pageEncoding="GB18030"%>
<%@ page import="com.geni.beans.GeneralARI,com.geni.beans.NetworkARI,com.geni.beans.StorageARI,com.geni.beans.ComputationARI,com.geni.beans.SoftwareARI,com.geni.beans.AdditionalSoftware,java.util.Collection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>Application Requirement Review</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="UNITED COMMS Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!--webfont-->
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,100,100italic,300,300italic,400italic,500,500italic,700,700italic,900,900italic'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<!-- header-section-starts -->
	<div class="header">
		<div class="container">
			<div class="logo">
				<a href="index.html"><img src="images/logo.png"
					class="img-responsive" alt="" /></a>
			</div>
			<div class="header-right">
				<h4>
					<i class="phone"></i>(573) 999 1234
				</h4>
				<span class="menu"></span>
				<div class="top-menu">
					<ul>
						<li><a href="index.html">Home</a></li>
						<li><a href="404.html">Products</a></li>
						<li><a href="about.html">About Us</a></li>
						<li><a href="services.html">Services</a></li>
						<li><a href="login.jsp">Account</a></li>
						<li><a class="active" href="review.jsp">Start</a></li>
					</ul>
				</div>
				<!-- script for menu -->
				<script>
					$("span.menu").click(function() {
						$(".top-menu").slideToggle("slow", function() {
							// Animation complete.
						});
					});
				</script>
				<!-- script for menu -->
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- header-section-ends -->
	<div class="content">
		<div class="contact about-desc">
		<h3>Requirement Review</h3>
		<div class="container">
			<div class="row">
			<table border ="1" width="100%">
				<tr><th width="50%">General</th><th width="50%">Network</th></tr>
				<tr>
					<td>
						<% GeneralARI general = (GeneralARI)session.getAttribute("general"); %>
						<p>Application Name 	: <%= general.getAppName() %></p>
						<p>Application Type 	: <%= general.getAppKind() %></p>
						<p>Application Priority : <%= general.getAppPriority() %></p>
						<p>Application DataSize : <%= general.getAppDataSize() %></p>
					</td>
					<td>
						<% NetworkARI network = (NetworkARI)session.getAttribute("network"); %>
						<p>Public IP Type		   : <%= network.getPublicIp() %>
						<p>VPN Network : <%= network.getVpn() %></p>
						<p>NFV			   : <%= network.getFirewall() %></p>
						<p>Network Type    : <%= network.getSdn() %></p>
					</td>
				</tr>
			</table>
			<br/>
			
			<table border="1" width="100%">
				<tr><th width="50%">Storage</th><th width="50%">Computation</th></tr>
				<tr>
					<td>
						<% StorageARI storage = (StorageARI)session.getAttribute("storage");%>
						<p>Storage Size 	: <%= ""+storage.getStorageSize() + " GB"%></p>
						<p>SSD Disk 	: <%= storage.getStorageDisk() %></p>
					</td>
					<td>
						<% ComputationARI compute = (ComputationARI)session.getAttribute("computation");%>
						<p>No. of Nodes		: <%= compute.getNoOfNodes() %></p>
						<p>Bandwidth 		: <%= ""+compute.getBandwidth() + " Mbps"%>
						<p>No. of cores		: <%= compute.getNoOfCores() %></p>
						<p>Ram Size			: <%= compute.getRamSize() %></p>
						<p>OS				: <%= compute.getOperatingSystem() %></p>
						<p>Dedicated Server : <%= compute.getDedicatedServer() %></p>
						<p>Gpu Size			: <%= compute.getGpuSize()%>
					</td>
				</tr>
				</table>
				
				<br/>
				
			<table border="1" width="100%">
				<% SoftwareARI software = (SoftwareARI)session.getAttribute("software"); %>
				<tr><th colspan="2"><p>Software Requirements</p></th></tr>
				<tr><th><p>Web Server</p></th><td><%= software.getWebServer() %></td></tr>
				<tr><th><p>DB Server</p></th><td><%= software.getDatabaseServer() %></td></tr>
				<tr><th colspan="2" align="center">Additional Softwares</th></tr>
				<tr><th >Name</th><th>Github URL</th></tr>
				<% Collection<AdditionalSoftware> additionalSoftwares = software.getAdditionalSoftware();
					for (AdditionalSoftware as : additionalSoftwares) { %>
				<tr><td><%= as.getName()%></td><td><%= as.getGithubURL()%></td></tr>
				<% }%>
			</table>
			<br/>
			
			<a href="#" class="btn btn-warning">
			<span class="fa fa-user-plus"></span>&nbsp;Edit</a>&nbsp; 
			<a href="/Test_Demo3/generateARI13.action" class="btn btn-success">
			<!--  <a href="/Test_Demo3/pythonScript.action" class="btn btn-success"> -->
			<span class="fa fa-refresh"></span>&nbsp;Submit</a>
			
			</div>
		</div>
	</div>
	</div>
	<!-- footer-section-starts -->
	<div class="footer text-center">
		<div class="social-icons">
			<a href="#"><i class="facebook"></i></a> <a href="#"><i
				class="twitter"></i></a> <a href="#"><i class="googlepluse"></i></a> <a
				href="#"><i class="youtube"></i></a> <a href="#"><i
				class="linkedin"></i></a>
		</div>
		<div class="copyright">
			<p>
				Copyright &copy; 2015 All rights reserved | Template by <a
					href="http://www.baidu.com"> CustomTemplateTeam</a>
			</p>
		</div>
	</div>
	<!-- footer-section-ends -->
</body>
</html>