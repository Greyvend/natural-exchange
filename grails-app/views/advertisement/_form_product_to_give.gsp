<%@ page import="natural.exchange.ProductToGive" %>



<div class="fieldcontain">
	<h1>Product to Give</h1>
</div>

<div class="fieldcontain ${hasErrors(bean: productToGiveInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="productToGive.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${productToGiveInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productToGiveInstance, field: 'imgUrl', 'error')} ">
	<label for="imgUrl">
		<g:message code="productToGive.imgUrl.label" default="Img Url" />
		
	</label>
	<g:textField name="imgUrl" value="${productToGiveInstance?.imgUrl}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productToGiveInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="productToGive.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${productToGiveInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productToGiveInstance, field: 'section', 'error')} required">
	<label for="section">
		<g:message code="productToGive.section.label" default="Section" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="section" name="section.id" from="${natural.exchange.Section.list()}" optionKey="id" required="" value="${productToGiveInstance?.section?.id}" class="many-to-one"/>
</div>

