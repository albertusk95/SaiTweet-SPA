<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="saitweet.Query" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="content-analysis" style="border-top: 0"> 
	<div class="container">
	
		<div id="intro">
			Your query: <%= Query.myQuery %>
			<br />
			
			<%
				//pageContext.setAttribute("queries", Query.socmedCheck);
				//${pageScope.queries}
			%>
			
			<c:forEach items="<%= Query.socmedCheck %>" var="item">
		
				<c:choose>
					<c:when test="${item == 'TwitterCheck'}">
						<c:out value="OK: + ${item}"/> 
					</c:when>    
					<c:otherwise>
						<c:out value="NULL"/>
					<br />
					</c:otherwise>
				</c:choose>
			
			</c:forEach>
			
			
			
			Test Page<br/>
			<c:out value="This is JSTL"/>
		</div>
	</div>
</div>
