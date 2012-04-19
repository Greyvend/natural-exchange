
<%@ page import="natural.exchange.AccessRights" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'accessRights.label', default: 'AccessRights')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-accessRights" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-accessRights" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list accessRights">
			
				<g:if test="${accessRightsInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="accessRights.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${accessRightsInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessRightsInstance?.createSection}">
				<li class="fieldcontain">
					<span id="createSection-label" class="property-label"><g:message code="accessRights.createSection.label" default="Create Section" /></span>
					
						<span class="property-value" aria-labelledby="createSection-label"><g:formatBoolean boolean="${accessRightsInstance?.createSection}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessRightsInstance?.createAd}">
				<li class="fieldcontain">
					<span id="createAd-label" class="property-label"><g:message code="accessRights.createAd.label" default="Create Ad" /></span>
					
						<span class="property-value" aria-labelledby="createAd-label"><g:formatBoolean boolean="${accessRightsInstance?.createAd}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessRightsInstance?.deleteAd}">
				<li class="fieldcontain">
					<span id="deleteAd-label" class="property-label"><g:message code="accessRights.deleteAd.label" default="Delete Ad" /></span>
					
						<span class="property-value" aria-labelledby="deleteAd-label"><g:formatBoolean boolean="${accessRightsInstance?.deleteAd}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessRightsInstance?.readUserProfile}">
				<li class="fieldcontain">
					<span id="readUserProfile-label" class="property-label"><g:message code="accessRights.readUserProfile.label" default="Read User Profile" /></span>
					
						<span class="property-value" aria-labelledby="readUserProfile-label"><g:formatBoolean boolean="${accessRightsInstance?.readUserProfile}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessRightsInstance?.banOtherUser}">
				<li class="fieldcontain">
					<span id="banOtherUser-label" class="property-label"><g:message code="accessRights.banOtherUser.label" default="Ban Other User" /></span>
					
						<span class="property-value" aria-labelledby="banOtherUser-label"><g:formatBoolean boolean="${accessRightsInstance?.banOtherUser}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessRightsInstance?.canBeBanned}">
				<li class="fieldcontain">
					<span id="canBeBanned-label" class="property-label"><g:message code="accessRights.canBeBanned.label" default="Can Be Banned" /></span>
					
						<span class="property-value" aria-labelledby="canBeBanned-label"><g:formatBoolean boolean="${accessRightsInstance?.canBeBanned}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${accessRightsInstance?.user}">
				<li class="fieldcontain">
					<span id="user-label" class="property-label"><g:message code="accessRights.user.label" default="User" /></span>
					
						<g:each in="${accessRightsInstance.user}" var="u">
						<span class="property-value" aria-labelledby="user-label"><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${accessRightsInstance?.id}" />
					<g:link class="edit" action="edit" id="${accessRightsInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
