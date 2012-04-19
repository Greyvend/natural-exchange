
<%@ page import="natural.exchange.Section" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'section.label', default: 'Section')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-section" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-section" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list section">
			
				<g:if test="${sectionInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="section.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${sectionInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${sectionInstance?.productToGet}">
				<li class="fieldcontain">
					<span id="productToGet-label" class="property-label"><g:message code="section.productToGet.label" default="Product To Get" /></span>
					
						<g:each in="${sectionInstance.productToGet}" var="p">
						<span class="property-value" aria-labelledby="productToGet-label"><g:link controller="productToGet" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${sectionInstance?.productToGive}">
				<li class="fieldcontain">
					<span id="productToGive-label" class="property-label"><g:message code="section.productToGive.label" default="Product To Give" /></span>
					
						<g:each in="${sectionInstance.productToGive}" var="p">
						<span class="property-value" aria-labelledby="productToGive-label"><g:link controller="productToGive" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${sectionInstance?.id}" />
					<g:link class="edit" action="edit" id="${sectionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
