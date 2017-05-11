<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title><bean:message key="label.leadListing.title"
		locale="display" /></title>
<!-- CSS -->
<link rel="stylesheet" href="css/main.css" type="text/css" />
<link rel="stylesheet" href="css/theme.css" type="text/css" />
<!--  React specific scripts  -->
<script src="js/react.js"></script>
<script src="js/react-dom.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.min.js"></script>
	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
	<script type="text/javascript" src="js/d3.min.js"></script>
</head>

<body id="public">

	<SCRIPT language="JavaScript" type="text/javascript">
	<!--
		function selectAll(deleteMain) {
			var trCount = document.getElementsByTagName('tr').length;
			if (deleteMain.checked) {
				for (var i = 0; i < trCount - 1; i++) {
					document.getElementById(i.toString()).checked = true;
				}
			} else {
				for (var i = 0; i < trCount - 1; i++) {
					document.getElementById(i.toString()).checked = false;
				}
			}
		}

		function validate() {
			var count = 0;
			var trCount = document.getElementsByTagName('tr').length;
			for (var i = 0; i < trCount - 1; i++) {
				if (document.getElementById(i.toString()).checked) {
					count++;
				}
			}
			if (count > 0) {
				return true;
			} else {
				alert("Sorry, select leads and press Delete");
				return false;
			}

		}
		
//		d3.select("body").append("svg").attr("width", 50).attr("height", 50).append("circle").attr("cx", 25).attr("cy", 25).attr("r", 25).style("fill", "purple");
		
//		var theData = [ 1, 2, 3 ];
		
//		var p = d3.select("body").selectAll("p")
//		  .data(theData)
//		  .enter()
//		  .append("p")
//		  .text("hello ");		
		
		
		
		var jsonCircles = [
			   { "x_axis": 30, "y_axis": 30, "radius": 20, "color" : "green" },
			   { "x_axis": 70, "y_axis": 70, "radius": 20, "color" : "purple"},
			   { "x_axis": 110, "y_axis": 100, "radius": 20, "color" : "red"}];
			 
			 var svgContainer = d3.select("body").append("svg")
			                                     .attr("width", 200)
			                                     .attr("height", 200);
			 
			var circles = svgContainer.selectAll("circle")
			                          .data(jsonCircles)
			                          .enter()
			                          .append("circle");
			
			var circleAttributes = circles
			                       .attr("cx", function (d) { return d.x_axis; })
			                      .attr("cy", function (d) { return d.y_axis; })
			                       .attr("r", function (d) { return d.radius; })
			                       .style("fill", function(d) { return d.color; });		
			
			
//			d3.json('http://localhost:10002/employees', function(data){
//				 // console.log(data[0]);
//				})			
		
		
		
	//-->
	</script>
 
 
	<div id="container">

		<%@ include file="/header_inc.jsp"%>

		<div class="javachap" style="margin: 20px 20px 0; padding: 0 0 20px;">
		

		 	
		 	
		   

			<div class="info">

				<html:link tabindex="5" title="Get Authors" action="/authors"
					styleClass="positive">

				</html:link>


				<div class="buttons">

					<html:link tabindex="5" title="Sell a New Lead" action="/lead"
						styleClass="positive">
						<html:img src="images/new_lead.png" styleClass="icon" />
						<bean:message key="link.label.newLead" locale="display" />!
                </html:link>
				</div>
				<h2>
					<bean:message key="label.leadListing.heading" locale="display" />
				</h2>
				<p>
					<bean:message key="label.leadListing.headingCaption"
						locale="display" />
					!
				</p>
			</div>

			<logic:messagesPresent message="true">
				<div style="color: green !important; margin: 5px;">
					<html:messages message="true" id="message" locale="display">
						<bean:write name="message" />
					</html:messages>
				</div>
			</logic:messagesPresent>

			<logic:messagesPresent>
				<div style="color: red !important; margin: 5px;">
					<html:errors locale="display" />
				</div>
			</logic:messagesPresent>

			<html:form action="/leadListing" method="post">

				<html:hidden property="action" value="deleteLeads" />

				<table width="100%" id="stuff">
					<tr>
						<th><input type="checkbox" id="deleteMain"
							onclick="selectAll(this);" tabindex="6" /></th>
						<th width="30%"><bean:message key="label.title"
								locale="display" /></th>
						<th width="20%"><bean:message key="label.email"
								locale="display" /></th>
						<th width="10%"><bean:message key="label.price"
								locale="display" /></th>
						<th width="25%"><bean:message key="label.status"
								locale="display" /></th>
						<th width="25%"><bean:message key="label.action"
								locale="display" /></th>
					</tr>
					<tbody>
						<logic:empty name="leadList">
							<tr>
								<td colspan="6" style="text-align: center;"><bean:message
										key="label.noLead" locale="display" /></td>
							</tr>
						</logic:empty>
						<logic:notEmpty name="leadList">
							<logic:iterate id="lead" indexId="i" name="leadList"
								type="com.javachap.domain.Lead">
								<tr>
									<td>
										<%--<bean:define id="leadId" name="lead" property="id" />--%>
										<html:checkbox property="leadIds"
											value="<%=lead.getId().toString()%>"
											styleId="<%=i.toString()%>" />
									</td>
									<td><html:link tabindex="7" action="/lead"
											paramId="leadId" paramName="lead" paramProperty="id">
											<bean:write name="lead" property="title" />
										</html:link></td>
									<td><bean:write name="lead" property="email" /></td>
									<td>$<bean:write name="lead" property="price" /></td>
									<td><bean:write name="lead" property="status" /></td>
									<td><html:link tabindex="8" action="/lead"
											paramId="leadId" paramName="lead" paramProperty="id">
											<html:param name="action" value="edit" />
											<bean:message key="link.label.edit" locale="display" />
										</html:link> | <html:link tabindex="9" action="/leadListing"
											paramId="leadId" paramName="lead" paramProperty="id">
											<html:param name="action" value="delete" />
											<bean:message key="link.label.delete" locale="display" />
										</html:link></td>
								</tr>
							</logic:iterate>
						</logic:notEmpty>
					</tbody>
				</table>

				<div class="buttons">
					<html:submit styleId="deleteForm" styleClass="btTxt imgStyle"
						tabindex="8" title="Delete selected Leads">
						<bean:message key="button.label.delete" locale="display" />
					</html:submit>
				</div>

			</html:form>

		</div>

		<div id="ReactPaneNew">Reacting again </div>
		<div id="R1">
		
	
		



		
		</div>
	</div>
	<!--container-->
	
	
	<script src="react/app.js" type="text/babel"></script>
</body>
</html>
