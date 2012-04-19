<%@ page import="natural.exchange.Advertisement" %>
<%@ page import="natural.exchange.ProductToGet" %>


<div class="fieldcontain ${hasErrors(bean: advertisementInstance, field: 'exchanger', 'error')} required">
	<label for="exchanger">
		<g:message code="advertisement.exchanger.label" default="Exchanger" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="exchanger" name="exchanger.id" from="${natural.exchange.User.list()}" optionKey="id" required="" value="${advertisementInstance?.exchanger?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: advertisementInstance, field: 'placementDate', 'error')} ">
	<label for="placementDate">
		<g:message code="advertisement.placementDate.label" default="Placement Date" />
		
	</label>
	<g:textField name="placementDate" value="${advertisementInstance?.placementDate}"/>
</div>

<!-- 
<div class="fieldcontain ${hasErrors(bean: advertisementInstance, field: 'productToGet', 'error')} required">
	<label for="productToGet">
		<g:message code="advertisement.productToGet.label" default="Product To Get" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="productToGet" name="productToGet.id" from="${natural.exchange.ProductToGet.list()}" optionKey="id" required="" value="${advertisementInstance?.productToGet?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: advertisementInstance, field: 'productToGive', 'error')} required">
	<label for="productToGive">
		<g:message code="advertisement.productToGive.label" default="Product To Give" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="productToGive" name="productToGive.id" from="${natural.exchange.ProductToGive.list()}" optionKey="id" required="" value="${advertisementInstance?.productToGive?.id}" class="many-to-one"/>
</div>
 -->
