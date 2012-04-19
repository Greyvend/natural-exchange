<%@ page import="natural.exchange.AccessRights" %>



<div class="fieldcontain ${hasErrors(bean: accessRightsInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="accessRights.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${accessRightsInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: accessRightsInstance, field: 'createSection', 'error')} ">
	<label for="createSection">
		<g:message code="accessRights.createSection.label" default="Create Section" />
		
	</label>
	<g:checkBox name="createSection" value="${accessRightsInstance?.createSection}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accessRightsInstance, field: 'createAd', 'error')} ">
	<label for="createAd">
		<g:message code="accessRights.createAd.label" default="Create Ad" />
		
	</label>
	<g:checkBox name="createAd" value="${accessRightsInstance?.createAd}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accessRightsInstance, field: 'deleteAd', 'error')} ">
	<label for="deleteAd">
		<g:message code="accessRights.deleteAd.label" default="Delete Ad" />
		
	</label>
	<g:checkBox name="deleteAd" value="${accessRightsInstance?.deleteAd}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accessRightsInstance, field: 'readUserProfile', 'error')} ">
	<label for="readUserProfile">
		<g:message code="accessRights.readUserProfile.label" default="Read User Profile" />
		
	</label>
	<g:checkBox name="readUserProfile" value="${accessRightsInstance?.readUserProfile}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accessRightsInstance, field: 'banOtherUser', 'error')} ">
	<label for="banOtherUser">
		<g:message code="accessRights.banOtherUser.label" default="Ban Other User" />
		
	</label>
	<g:checkBox name="banOtherUser" value="${accessRightsInstance?.banOtherUser}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accessRightsInstance, field: 'canBeBanned', 'error')} ">
	<label for="canBeBanned">
		<g:message code="accessRights.canBeBanned.label" default="Can Be Banned" />
		
	</label>
	<g:checkBox name="canBeBanned" value="${accessRightsInstance?.canBeBanned}" />
</div>

<div class="fieldcontain ${hasErrors(bean: accessRightsInstance, field: 'user', 'error')} ">
	<label for="user">
		<g:message code="accessRights.user.label" default="User" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${accessRightsInstance?.user?}" var="u">
    <li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="user" action="create" params="['accessRights.id': accessRightsInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'user.label', default: 'User')])}</g:link>
</li>
</ul>

</div>

