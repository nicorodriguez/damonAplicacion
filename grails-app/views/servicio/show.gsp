
<%@ page import="seguridad.Servicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-servicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-servicio" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list servicio">
			
				<g:if test="${servicioInstance?.nombreServicio}">
				<li class="fieldcontain">
					<span id="nombreServicio-label" class="property-label"><g:message code="servicio.nombreServicio.label" default="Nombre Servicio" /></span>
					
						<span class="property-value" aria-labelledby="nombreServicio-label"><g:fieldValue bean="${servicioInstance}" field="nombreServicio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicioInstance?.cantidadCreditos}">
				<li class="fieldcontain">
					<span id="cantidadCreditos-label" class="property-label"><g:message code="servicio.cantidadCreditos.label" default="Cantidad Creditos" /></span>
					
						<span class="property-value" aria-labelledby="cantidadCreditos-label"><g:fieldValue bean="${servicioInstance}" field="cantidadCreditos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${servicioInstance?.usuariosserv}">
				<li class="fieldcontain">
					<span id="usuariosserv-label" class="property-label"><g:message code="servicio.usuariosserv.label" default="Usuariosserv" /></span>
					
						<g:each in="${servicioInstance.usuariosserv}" var="u">
						<span class="property-value" aria-labelledby="usuariosserv-label"><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:servicioInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${servicioInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
