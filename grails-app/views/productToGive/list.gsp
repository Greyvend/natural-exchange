
<%@ page import="natural.exchange.ProductToGive" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productToGive.label', default: 'ProductToGive')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-productToGive" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productToGive" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'productToGive.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="imgUrl" title="${message(code: 'productToGive.imgUrl.label', default: 'Img Url')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'productToGive.name.label', default: 'Name')}" />
					
						<th><g:message code="productToGive.section.label" default="Section" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productToGiveInstanceList}" status="i" var="productToGiveInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productToGiveInstance.id}">${fieldValue(bean: productToGiveInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: productToGiveInstance, field: "imgUrl")}</td>
					
						<td>${fieldValue(bean: productToGiveInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: productToGiveInstance, field: "section")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productToGiveInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
