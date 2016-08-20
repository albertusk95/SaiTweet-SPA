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

<!-- SUPPORT VARIABLE -->
<c:set var="tweetNum" value="<%= Tweet.qrTweets_TotalItem %>" />
<c:set var="sentimentItem" value="<%= Tweet.qrTweets_Sentiment %>" />
<c:set var="tweetTextItem" value="<%= Tweet.qrTweets_Text %>" />
<c:set var="tweetPrepropItem" value="<%= Tweet.qrTweets_Preprocessed %>" />
<c:set var="tweetPrepropFeature" value="<%= Tweet.qrTweets_PreprocFeature %>" />
<c:set var="tweetPrepropComplex" value="<%= Tweet.qrTweets_PreprocComplex %>" />
<c:set var="classDistText" value="<%= Tweet.qrTweets_ClassDistText %>" />
<c:set var="classDistFeature" value="<%= Tweet.qrTweets_ClassDistFeature %>" />
<c:set var="classDistComplex" value="<%= Tweet.qrTweets_ClassDistComplex %>" />
<c:set var="predClass" value="<%= Tweet.qrTweets_PredClass %>" />
<c:set var="semanticItem" value="<%= Tweet.qrTweets_Semantic %>" />


<!-- DASHBOARD AREA -->
<div class="testTweet" ng-show="selectedView === 0">
 
		<div class="titleContainer">
			<h1>TweetNum is <c:out value="${tweetNum}" /></h1>
		</div>
		
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
	
	<div class="titleContainer">
		<h2>Select Tweet ID</h2>
	</div>
	
	<div id="tweetIDContainer">
		
		<h2>Chosen: {{selectedID}}</h2>
		
		<select class="form-control" ng-model="selectedOption" ng-change="selectedTweetID()">
			
			<!-- FOR TESTING -->
			<!-- 
			<c:forEach var="tweetID" begin="0" end="3">
				<option><c:out value="${tweetID}" /></option>	
			</c:forEach>
			-->
			   
			<!-- ORIGIN LOGIC -->
			<c:choose>
			    <c:when test="${tweetNum > 0}">
					
					<c:forEach var="tweetID" begin="0" end="${tweetNum-1}">
						<option><c:out value="${tweetID}" /></option>	
					</c:forEach>
					        
			    </c:when>    
			    <c:otherwise>
			                
			    </c:otherwise>
			</c:choose>
			
		</select>	
	
	</div>
	
	<!-- BISA DITAMPILKAN USESLIDINGWINDOW, FILTER, TOKENIZER NYA -->
	
	<c:forEach var="itemSentiment" begin="0" end="${tweetNum-1}" varStatus="loopSentiment">
		
		<div class="sentimentContainer" ng-show="selectedID == ${loopSentiment.index}">
			
			<table border="1" class="table table-hover" style="width: 100%; table-layout: fixed;">
				<tr>
					<td style="width: 20%; text-align: center;">Text</td>
					<td colspan="3" style="text-align: center; max-width: 400px; word-wrap: break-word;">
						<c:out value="${tweetTextItem.get(loopSentiment.index)}" />
					</td>
				</tr>
				<tr>
					<td rowspan="3" style="width: 20%; text-align: center; vertical-align: middle;">
						<b>Preprocessed</b>
					</td>
					<td style="width: 20%; text-align: center;">Text</td>
					<td colspan="2" style="text-align: center; max-width: 400px; word-wrap: break-word;">
						<c:out value="${tweetPrepropItem.get(loopSentiment.index)}" />
					</td>
				</tr>
				<tr>
					<td style="width: 20%; text-align: center;">Feature</td>
					<td colspan="2" style="text-align: center; max-width: 400px; word-wrap: break-word;">
						<c:out value="${tweetPrepropFeature.get(loopSentiment.index)}" />
					</td>
				</tr>
				<tr>
					<td style="width: 20%; text-align: center;">Complex</td>
					<td colspan="2" style="text-align: center; max-width: 400px; word-wrap: break-word;">
						<c:out value="${tweetPrepropComplex.get(loopSentiment.index)}" />
					</td>
				</tr>
				
				<tr>
					<td rowspan="6" style="width: 20%; text-align: center; vertical-align: middle;">
						<b>Class distribution</b>
					</td>
					<td rowspan="2" style="width: 20%; text-align: center; vertical-align: middle;">
						Text
					</td>
					<td>Positive</td>
					<td style="text-align: center; max-width: 300px; word-wrap: break-word;">
						<c:out value="${classDistText.get(loopSentiment.index)[0]}" />
					</td>
				</tr>	
				<tr>
					<td>Negative</td>
					<td style="text-align: center; max-width: 300px; word-wrap: break-word;">
						<c:out value="${classDistText.get(loopSentiment.index)[1]}" />
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="width: 20%; text-align: center; vertical-align: middle;">
						Feature
					</td>
					<td>Positive</td>
					<td style="text-align: center; max-width: 300px; word-wrap: break-word;">
						<c:out value="${classDistFeature.get(loopSentiment.index)[0]}" />
					</td>
				</tr>
				<tr>
					<td>Negative</td>
					<td style="text-align: center; max-width: 300px; word-wrap: break-word;">
						<c:out value="${classDistFeature.get(loopSentiment.index)[1]}" />
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="width: 20%; text-align: center; vertical-align: middle;">
						Complex
					</td>
					<td>Positive</td>
					<td style="text-align: center; max-width: 300px; word-wrap: break-word;">
						<c:out value="${classDistComplex.get(loopSentiment.index)[0]}" />
					</td>
				</tr>
				<tr>
					<td>Negative</td>
					<td style="text-align: center; max-width: 300px; word-wrap: break-word;">
						<c:out value="${classDistComplex.get(loopSentiment.index)[1]}" />
					</td>
				</tr>
				
				<tr>
					<td rowspan="3" style="width: 25%; text-align: center; vertical-align: middle;">
						<b>Classification stage</b>
					</td>
					<td style="width: 20%; text-align: center;">Polarity Classifier</td>
					<td colspan="2" style="text-align: center; max-width: 400px; word-wrap: break-word;">
						<c:out value="${predClass.get(loopSentiment.index)[0]}" />
					</td>
				</tr>
				<tr>
					<td style="width: 20%; text-align: center;">classifyOnSW</td>
					<td colspan="2" style="text-align: center; max-width: 400px; word-wrap: break-word;">
						<c:out value="${predClass.get(loopSentiment.index)[1]}" />
					</td>
				</tr>
				<tr>
					<td style="width: 20%; text-align: center;">classifyOnModel</td>
					<td colspan="2" style="text-align: center; max-width: 400px; word-wrap: break-word;">
						<c:out value="${predClass.get(loopSentiment.index)[2]}" />
					</td>
				</tr>
				
				
			</table>
			
			<!-- MORE MATH BUTTON -->
			<div class="moreMathButtonContainer" ng-click="initMoreMath(${loopSentiment.index})">
				More Math
			</div>
			
		</div>
		
		<!-- MORE MATH -->
		<div class="moreMathContainer" ng-show="moreMathValidity()">
			<h1>Hello, this is More math container {{ selectedID }} {{ selectedMoreMath }}</h1>
			
			<table border="1" class="table table-hover" style="width: 100%; table-layout: fixed;">
				<tr>
					<td rowspan="6" style="width: 20%; text-align: center; vertical-align: middle;">
						<b>Score</b>
					</td>
					<td rowspan="2" style="width: 20%; text-align: center; vertical-align: middle;">
						Text
					</td>
					<td>Positive</td>
					<td>
						<c:out value="${classDistText.get(loopSentiment.index)[0] * 31.07}" />
					</td>
				</tr>
				<tr>
					<td>Negative</td>
					<td>
						<c:out value="${classDistText.get(loopSentiment.index)[1] * 31.07}" />
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="width: 20%; text-align: center; vertical-align: middle;">
						Feature
					</td>
					<td>Positive</td>
					<td>
						<c:out value="${classDistFeature.get(loopSentiment.index)[0] * 11.95}" />
					</td>	
				</tr>
				<tr>
					<td>Negative</td>
					<td>
						<c:out value="${classDistFeature.get(loopSentiment.index)[1] * 11.95}" />
					</td>
				</tr>
				<tr>
					<td rowspan="2" style="width: 20%; text-align: center; vertical-align: middle;">
						Complex
					</td>
					<td>Positive</td>
					<td>
						<c:out value="${classDistComplex.get(loopSentiment.index)[0] * 30.95}" />
					</td>	
				</tr>
				<tr>
					<td>Negative</td>
					<td>
						<c:out value="${classDistComplex.get(loopSentiment.index)[1] * 30.95}" />
					</td>
				</tr>
				
				<c:set var="totalPosScore" value="${classDistText.get(loopSentiment.index)[0] * 31.07 + classDistFeature.get(loopSentiment.index)[0] * 11.95 + classDistComplex.get(loopSentiment.index)[0] * 30.95}" />
				<c:set var="avgPosScore" value="${totalPosScore / 73.97}" />
				<c:set var="totalNegScore" value="${classDistText.get(loopSentiment.index)[1] * 31.07 + classDistFeature.get(loopSentiment.index)[1] * 11.95 + classDistComplex.get(loopSentiment.index)[1] * 30.95}" />
				<c:set var="avgNegScore" value="${totalNegScore / 73.97}" />
				
				<!-- Representation value -->
				<c:set var="repValue" value="${(1 + avgPosScore - avgNegScore) / 2}" />
				
				<tr>	
					<td style="width: 20%; text-align: center; vertical-align: middle;">
						<b>Total positive score</b>
					</td>
					<td>
						<c:out value="${totalPosScore}" />
					</td>
				</tr>
				
				<tr>
					<td style="width: 20%; text-align: center; vertical-align: middle;">
						<b>Average positive score</b>
					</td>
					<td>
						<c:out value="${avgPosScore}" />
					</td>	
				</tr>
				
				<tr>	
					<td style="width: 20%; text-align: center; vertical-align: middle;">
						<b>Total negative score</b>
					</td>
					<td>
						<c:out value="${totalNegScore}" />
					</td>
				</tr>
				
				<tr>
					<td style="width: 20%; text-align: center; vertical-align: middle;">
						<b>Average negative score</b>
					</td>
					<td>
						<c:out value="${avgNegScore}" />
					</td>	
				</tr>
				
				<tr>
					<td style="width: 20%; text-align: center; vertical-align: middle;">
						<b>Representation final score</b>
					</td>
					<td>
						<c:out value="${repValue}" />
					</td>	
				</tr>
				
				
				
			</table>
		</div>
		
	</c:forEach>
</div>