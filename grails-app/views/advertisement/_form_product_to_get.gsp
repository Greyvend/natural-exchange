<%@ page import="natural.exchange.ProductToGet" %>



<div class="fieldcontain">
	<h1>Product to Get</h1>
</div>

<div class="fieldcontain ${hasErrors(bean: productToGetInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="productToGet.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${productToGetInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productToGetInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="productToGet.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${productToGetInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productToGetInstance, field: 'section', 'error')} required">
	<label for="section">
		<g:message code="productToGet.section.label" default="Section" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="section" name="section.id" from="${natural.exchange.Section.list()}" optionKey="id" required="" value="${productToGetInstance?.section?.id}" class="many-to-one"/>
</div>

