
<%@ page import="natural.exchange.Advertisement" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'advertisement.label', default: 'Advertisement')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-advertisement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-advertisement" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="pagination">
				<g:paginate next="Forward" prev="Back"
	            max="20" controller="Advertisement"
	            action="list" total="${advertisementInstanceTotal}" />
            </div>
            <table>
				<thead>
					<tr>
						<th><g:message code="advertisement.id.label" default="Number" /></th>
					
						<th><g:message code="advertisement.exchanger.label" default="Exchanger" /></th>
					
						<g:sortableColumn property="placementDate" title="${message(code: 'advertisement.placementDate.label', default: 'Placement Date')}" />
					
						<th><g:message code="advertisement.productToGet.label" default="Product To Get" /></th>
					
						<th><g:message code="advertisement.productToGive.label" default="Product To Give" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${advertisementInstanceList}" status="i" var="advertisementInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${advertisementInstance.id}">${advertisementInstance.id}</g:link></td>
					
						<td><g:link controller="User" action="show" id="${advertisementInstance.id}">${fieldValue(bean: advertisementInstance, field: "exchanger")}</g:link></td>
					
						<td>${fieldValue(bean: advertisementInstance, field: "placementDate")}</td>
					
						<td>${fieldValue(bean: advertisementInstance, field: "productToGet")}</td>
					
						<td>${fieldValue(bean: advertisementInstance, field: "productToGive")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate next="Forward" prev="Back"
	            max="20" controller="Advertisement"
	            action="list" total="${advertisementInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
