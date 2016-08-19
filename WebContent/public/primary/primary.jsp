<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ page import="saitweet.Tweet" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- VERTICAL NAVBAR -->	

<div id="analysis_navbar" class="navbar navbar-custom navbar-fixed-left">
	
	<ul id="navbarVertical" class="nav navbar-nav">
		<li><a ng-class="{'activePrimary': selectedView === 0}" ng-click="setView(0)">DASHBOARD</a></li>
		<li><a ng-class="{'activePrimary': selectedView === 1}" ng-click="setView(1)">SENTIMENT</a></li>
		<li><a ng-class="{'activePrimary': selectedView === 2}" ng-click="setView(2)">SEMANTIC</a></li>
	</ul>

</div>

<!-- END OF VERTICAL NAVBAR -->

<div class="selectedView" ng-show="selectedView === 2">
	<div class="container">
		<div id="intro">
			This is link2 page This is link2 page this is link2 page<br />
			This is link2 page This is link2 page this is link2 page<br />
			This is link2 page This is link2 page this is link2 page<br />
			This is link2 page This is link2 page this is link2 page<br />
			This is link2 page This is link2 page this is link2 page<br />
		</div>
	</div>
</div>

<!-- DASHBOARD AREA -->
<div class="testTweet" ng-show="selectedView === 0">
 
		<c:set var="tweetNum" value="<%= Tweet.qrTweets.size() %>" />
		
		<div class="tweetContainer">
			<h1>TweetNum is <c:out value="${tweetNum}" /></h1>
		</div>
		
		<c:set var="sentimentItem" value="<%= Tweet.qrTweets_Sentiment %>" />
		<c:set var="tweetTextItem" value="<%= Tweet.qrTweets_Text %>" />
		<c:set var="tweetPrepropItem" value="<%= Tweet.qrTweets_Preprocessed %>" />
		<c:set var="semanticItem" value="<%= Tweet.qrTweets_Semantic %>" />
		
		<c:forEach var="item" items="<%= Tweet.qrTweets %>" varStatus="loop">
			
			<div class="tweetContainer">
				
				<!-- 
				<table border="1" class="table table-striped" style="width: 100%; display: block; table-layout: fixed;">
				-->
				<table  class="table table-striped" style="width: 100%; table-layout: fixed;">
				
					<thead>
				  		<tr>
				    		<!-- user image profile -->
				      		<th rowspan="2" class="userIMG" style="width: 15%; border:1px solid grey;">
				      		
				      			<img src="${item.getUser().getProfileImageURL()}" style="display: block; width: 100%; height: 100%" />
				      		
				      		</th>
				      		
				      		<!-- user full name -->
				      		<th class="userFullname" style="width: 85%; max-width:450px; word-wrap:break-word;">
				      			
				      			<c:out value="${item.getUser().getName()}" />
				      			
				      		</th>
				    	</tr>
					    <tr>
					    	<!-- username -->
					      	<th class="userUsername" style="width: 85%; max-width:450px; word-wrap:break-word;">
					      		<c:out value="${item.getUser().getScreenName()}" />
					      	</th>
					    </tr>
				  	</thead>
				  	<tbody>
				    	<tr>
				      		<td colspan="2" class="userText" style="max-width:700px; word-wrap:break-word;">
				      			<c:out value="${item.getText()}" />
				      		</td>
				    	</tr>
				  	</tbody>
				</table>
			
			</div>
			
			<!-- DETAIL BUTTON -->
			<div class="detailContainer">
				<div class="detailButtonContainer" ng-click="showDetails(${loop.index})">
					<b>Show details</b>
				</div>
				
				<div class="detailAnalysisContainer" ng-click="showAnalysis(${loop.index})">
					<b>Show Analysis</b>
				</div>
			</div>
			
			<!-- Table showing detail of the tweet -->
			<div id="${loop.index}" style="display: none; margin-bottom: 100px">
	            
	            <table border="1" class="table table-hover" style="width: 100%; table-layout: fixed;">
				  <tbody>
				  	<!-- Tweet info -->
				    <tr>
				      	<td rowspan="4" class="thead-inverse" style="width: 15%; text-align:center; vertical-align: middle;">Tweet info</td>
				      	<td style="width: 25%;">Name</td>
				      	<td style="max-width:450px; word-wrap:break-word;">
				      		<c:out value="${item.getUser().getName()}" />
				      	</td>				      
				    </tr>
				    <tr>
				    	<td style="width: 25%;">Username</td>
				      	<td style="max-width:450px; word-wrap:break-word;">
				      		<c:out value="${item.getUser().getScreenName()}" />
				      	</td>
				    </tr>
				    <tr>
				    	<td style="width: 20%;">Posted time</td>
				      	<td style="max-width:450px; word-wrap:break-word;">
				      		<c:out value="${item.getCreatedAt()}" />
				      	</td>
				    </tr>
				    <tr>
				    	<td style="width: 20%;">Location</td>
				    	<td style="max-width:450px; word-wrap:break-word;">
				      		<c:choose>
							    <c:when test="${item.getUser().getLocation() != null}">
									<c:out value="${item.getUser().getLocation()}" />        
							    </c:when>    
							    <c:otherwise>
							        <c:out value="---" />
							    </c:otherwise>
							</c:choose>
				      	</td>
				    </tr>
				    
				    <!-- Tweet URL -->
				    <tr>
				    	<td style="text-align: center;">
				    		<c:out value="Tweet URL" />
				    	</td>
				    	<td colspan="2" style="max-width:450px; word-wrap:break-word;">
				    		<a href="https://twitter.com/${item.getUser().getScreenName()}/status/${item.getId()}">
				    			<c:out value="https://twitter.com/${item.getUser().getScreenName()}/status/${item.getId()}" />
				    		</a>
				    	</td>
				    </tr>
				    
				    <!-- Media Entities -->
			    	
			    	<c:forEach var="media" items="${item.getMediaEntities()}" varStatus="counterMedia">
				      	<tr>
				      		<td style="text-align: center;">
				      			<c:out value="Media ${counterMedia.index}" />
				      		</td>
				      		<td colspan="2" style="max-width:450px; word-wrap:break-word;">
				      			<a href="${media.getMediaURLHttps()}">
				      				<c:out value="${media.getMediaURLHttps()}" />
				      			</a>
				      		</td>
				      	</tr>				      
				   	</c:forEach>
					
				  </tbody>
				  
				</table>
					            
	     	</div>
		
			<!-- Table showing analysis detail -->
			<div id="analysis${loop.index}" style="display: none; margin-bottom: 100px">
				<table border="1" class="table table-hover" style="width: 100%; table-layout: fixed;">
					<tbody>
						<tr>
							<td style="width: 25%; text-align: center;">
								Text
							</td>
							<td style="text-align: center; max-width: 450px; word-wrap: break-word;">
								<c:out value="${tweetTextItem.get(loop.index)}" />
							</td>
						</tr>
						<tr>
							<td style="width: 25%; text-align: center;">
								Preprocessed text
							</td>
							<td style="text-align: center; max-width: 450px; word-wrap: break-word;">
								<c:out value="${tweetPrepropItem.get(loop.index)}" />
							</td>
						</tr>
						<tr>
							<td style="width: 25%; text-align: center;">
								Sentiment
							</td>
							<td style="text-align: center; max-width: 450px; word-wrap: break-word;">
								<c:out value="${sentimentItem.get(loop.index)}" />
							</td>
						</tr>
						<tr>
							<td style="width: 25%; text-align: center;">
								Semantic
							</td>
							<td style="text-align: center; max-width: 450px; word-wrap: break-word;">
								<c:out value="${semanticItem.get(loop.index)}" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		
		</c:forEach>
		
</div>

<!-- SENTIMENT AREA -->
<div class="testTweet" ng-show="selectedView === 1">
	
</div>