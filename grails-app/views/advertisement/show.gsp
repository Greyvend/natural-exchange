
<%@ page import="natural.exchange.Advertisement" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'advertisement.label', default: 'Advertisement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-advertisement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-advertisement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list advertisement">
			
				<g:if test="${advertisementInstance?.exchanger}">
				<li class="fieldcontain">
					<span id="exchanger-label" class="property-label"><g:message code="advertisement.exchanger.label" default="Exchanger" /></span>
					
						<span class="property-value" aria-labelledby="exchanger-label"><g:link controller="user" action="show" id="${advertisementInstance?.exchanger?.id}">${advertisementInstance?.exchanger?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${advertisementInstance?.placementDate}">
				<li class="fieldcontain">
					<span id="placementDate-label" class="property-label"><g:message code="advertisement.placementDate.label" default="Placement Date" /></span>
					
						<span class="property-value" aria-labelledby="placementDate-label"><g:fieldValue bean="${advertisementInstance}" field="placementDate"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${advertisementInstance?.productToGet}">
				<li class="fieldcontain">
					<span id="productToGet-label" class="property-label"><g:message code="advertisement.productToGet.label" default="Product To Get" /></span>
					
						<span class="property-value" aria-labelledby="productToGet-label"><g:link controller="productToGet" action="show" id="${advertisementInstance?.productToGet?.id}">${advertisementInstance?.productToGet?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${advertisementInstance?.productToGive}">
				<li class="fieldcontain">
					<span id="productToGive-label" class="property-label"><g:message code="advertisement.productToGive.label" default="Product To Give" /></span>
					
						<span class="property-value" aria-labelledby="productToGive-label"><g:link controller="productToGive" action="show" id="${advertisementInstance?.productToGive?.id}">${advertisementInstance?.productToGive?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${advertisementInstance?.id}" />
					<g:link class="edit" action="edit" id="${advertisementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
