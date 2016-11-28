
<%@ page import="sistema.Tipousuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipousuario.label', default: 'Tipousuario')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tipousuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tipousuario" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tipousuario">
			
				<g:if test="${tipousuarioInstance?.nombreTipo}">
				<li class="fieldcontain">
					<span id="nombreTipo-label" class="property-label"><g:message code="tipousuario.nombreTipo.label" default="Nombre Tipo" /></span>
					
						<span class="property-value" aria-labelledby="nombreTipo-label"><g:fieldValue bean="${tipousuarioInstance}" field="nombreTipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipousuarioInstance?.abreviaturaTipo}">
				<li class="fieldcontain">
					<span id="abreviaturaTipo-label" class="property-label"><g:message code="tipousuario.abreviaturaTipo.label" default="Abreviatura Tipo" /></span>
					
						<span class="property-value" aria-labelledby="abreviaturaTipo-label"><g:fieldValue bean="${tipousuarioInstance}" field="abreviaturaTipo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipousuarioInstance?.abreviatura}">
				<li class="fieldcontain">
					<span id="abreviatura-label" class="property-label"><g:message code="tipousuario.abreviatura.label" default="Abreviatura" /></span>
					
						<span class="property-value" aria-labelledby="abreviatura-label"><g:fieldValue bean="${tipousuarioInstance}" field="abreviatura"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipousuarioInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="tipousuario.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${tipousuarioInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${tipousuarioInstance?.usuariostipo}">
				<li class="fieldcontain">
					<span id="usuariostipo-label" class="property-label"><g:message code="tipousuario.usuariostipo.label" default="Usuariostipo" /></span>
					
						<g:each in="${tipousuarioInstance.usuariostipo}" var="u">
						<span class="property-value" aria-labelledby="usuariostipo-label"><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tipousuarioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tipousuarioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
