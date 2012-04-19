
<%@ page import="natural.exchange.ProductToGive" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productToGive.label', default: 'ProductToGive')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-productToGive" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-productToGive" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list productToGive">
			
				<g:if test="${productToGiveInstance?.ad}">
				<li class="fieldcontain">
					<span id="ad-label" class="property-label"><g:message code="productToGive.ad.label" default="Ad" /></span>
					
						<g:each in="${productToGiveInstance.ad}" var="a">
						<span class="property-value" aria-labelledby="ad-label"><g:link controller="advertisement" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${productToGiveInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="productToGive.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${productToGiveInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productToGiveInstance?.imgUrl}">
				<li class="fieldcontain">
					<span id="imgUrl-label" class="property-label"><g:message code="productToGive.imgUrl.label" default="Img Url" /></span>
					
						<span class="property-value" aria-labelledby="imgUrl-label"><g:fieldValue bean="${productToGiveInstance}" field="imgUrl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productToGiveInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="productToGive.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${productToGiveInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${productToGiveInstance?.section}">
				<li class="fieldcontain">
					<span id="section-label" class="property-label"><g:message code="productToGive.section.label" default="Section" /></span>
					
						<span class="property-value" aria-labelledby="section-label"><g:link controller="section" action="show" id="${productToGiveInstance?.section?.id}">${productToGiveInstance?.section?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${productToGiveInstance?.id}" />
					<g:link class="edit" action="edit_product_to_give" id="${productToGiveInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
