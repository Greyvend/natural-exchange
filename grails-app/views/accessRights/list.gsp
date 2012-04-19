
<%@ page import="natural.exchange.AccessRights" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accessRights.label', default: 'AccessRights')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-accessRights" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-accessRights" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'accessRights.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="createSection" title="${message(code: 'accessRights.createSection.label', default: 'Create Section')}" />
					
						<g:sortableColumn property="createAd" title="${message(code: 'accessRights.createAd.label', default: 'Create Ad')}" />
					
						<g:sortableColumn property="deleteAd" title="${message(code: 'accessRights.deleteAd.label', default: 'Delete Ad')}" />
					
						<g:sortableColumn property="readUserProfile" title="${message(code: 'accessRights.readUserProfile.label', default: 'Read User Profile')}" />
					
						<g:sortableColumn property="banOtherUser" title="${message(code: 'accessRights.banOtherUser.label', default: 'Ban Other User')}" />
						
						<g:sortableColumn property="canBeBanned" title="${message(code: 'accessRights.canBeBanned.label', default: 'Can Be Banned')}" />
					</tr>
				</thead>
				<tbody>
				<g:each in="${accessRightsInstanceList}" status="i" var="accessRightsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${accessRightsInstance.id}">${fieldValue(bean: accessRightsInstance, field: "name")}</g:link></td>
					
						<td><g:formatBoolean boolean="${accessRightsInstance.createSection}" /></td>
					
						<td><g:formatBoolean boolean="${accessRightsInstance.createAd}" /></td>
					
						<td><g:formatBoolean boolean="${accessRightsInstance.deleteAd}" /></td>
					
						<td><g:formatBoolean boolean="${accessRightsInstance.readUserProfile}" /></td>
					
						<td><g:formatBoolean boolean="${accessRightsInstance.banOtherUser}" /></td>
						
						<td><g:formatBoolean boolean="${accessRightsInstance.canBeBanned}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${accessRightsInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
