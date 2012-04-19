
<%@ page import="natural.exchange.ProductToGet" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'productToGet.label', default: 'ProductToGet')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-productToGet" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create_product_to_get"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-productToGet" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="description" title="${message(code: 'productToGet.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="name" title="${message(code: 'productToGet.name.label', default: 'Name')}" />
					
						<th><g:message code="productToGet.section.label" default="Section" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${productToGetInstanceList}" status="i" var="productToGetInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${productToGetInstance.id}">${fieldValue(bean: productToGetInstance, field: "description")}</g:link></td>
					
						<td>${fieldValue(bean: productToGetInstance, field: "name")}</td>
					
						<td>${fieldValue(bean: productToGetInstance, field: "section")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${productToGetInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
