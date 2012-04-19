<%@ page import="natural.exchange.Section" %>



<div class="fieldcontain ${hasErrors(bean: sectionInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="section.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${sectionInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: sectionInstance, field: 'productToGet', 'error')} ">
	<label for="productToGet">
		<g:message code="section.productToGet.label" default="Product To Get" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sectionInstance?.productToGet?}" var="p">
    <li><g:link controller="productToGet" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productToGet" action="create_product_to_get" params="['section.id': sectionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productToGet.label', default: 'ProductToGet')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: sectionInstance, field: 'productToGive', 'error')} ">
	<label for="productToGive">
		<g:message code="section.productToGive.label" default="Product To Give" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${sectionInstance?.productToGive?}" var="p">
    <li><g:link controller="productToGive" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="productToGive" action="create" params="['section.id': sectionInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'productToGive.label', default: 'ProductToGive')])}</g:link>
</li>
</ul>

</div>

