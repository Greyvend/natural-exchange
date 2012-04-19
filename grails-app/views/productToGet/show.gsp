
<%@ page import="natural.exchange.ProductToGet" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productToGet.label', default: 'ProductToGet')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productToGet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create_product_to_get"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productToGet" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productToGet">
			
				<g:if test="${productToGetInstance?.ad}">
				<li class="fieldcontain">
					<span id="ad-label" class="property-label"><g:message code="productToGet.ad.label" default="Ad" /></span>
					
						<g:each in="${productToGetInstance.ad}" var="a">
						<span class="property-value" aria-labelledby="ad-label"><g:link controller="advertisement" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productToGetInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="productToGet.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productToGetInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productToGetInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="productToGet.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productToGetInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productToGetInstance?.section}">
				<li class="fieldcontain">
					<span id="section-label" class="property-label"><g:message code="productToGet.section.label" default="Section" /></span>
					
						<span class="property-value" aria-labelledby="section-label"><g:link controller="section" action="show" id="${productToGetInstance?.section?.id}">${productToGetInstance?.section?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productToGetInstance?.id}" />
					<g:link class="edit" action="edit_product_to_get" id="${productToGetInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
