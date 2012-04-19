<%@ page import="natural.exchange.ProductToGive" %>



<div class="fieldcontain ${hasErrors(bean: productToGiveInstance, field: 'ad', 'error')} ">
	<label for="ad">
		<g:message code="productToGive.ad.label" default="Ad" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${productToGiveInstance?.ad?}" var="a">
    <li><g:link controller="advertisement" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="advertisement" action="create" params="['productToGive.id': productToGiveInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'advertisement.label', default: 'Advertisement')])}</g:link>
</li>
</ul>

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

