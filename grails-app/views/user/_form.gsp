<%@ page import="natural.exchange.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'login', 'error')} required">
	<label for="login">
		<g:message code="user.login.label" default="Login" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="login" maxlength="10" required="" value="${userInstance?.login}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'hashedPassword', 'error')} required">
	<label for="hashedPassword">
		<g:message code="user.hashedPassword.label" default="Hashed Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="hashedPassword" required="" value="${fieldValue(bean: userInstance, field: 'hashedPassword')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="user.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${userInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accessRights', 'error')} required">
	<label for="accessRights">
		<g:message code="user.accessRights.label" default="Access Rights" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="accessRights" name="accessRights.id" from="${natural.exchange.AccessRights.list()}" optionKey="id" required="" value="${userInstance?.accessRights?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'ad', 'error')} ">
	<label for="ad">
		<g:message code="user.ad.label" default="Ad" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userInstance?.ad?}" var="a">
    <li><g:link controller="advertisement" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="advertisement" action="create" params="['user.id': userInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'advertisement.label', default: 'Advertisement')])}</g:link>
</li>
</ul>

</div>

