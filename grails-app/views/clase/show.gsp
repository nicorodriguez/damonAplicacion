
<%@ page import="sistema.Clase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clase.label', default: 'Clase')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-clase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-clase" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list clase">
			
				<g:if test="${claseInstance?.profe}">
				<li class="fieldcontain">
					<span id="profe-label" class="property-label"><g:message code="clase.profe.label" default="Profe" /></span>
					
						<span class="property-value" aria-labelledby="profe-label"><g:fieldValue bean="${claseInstance}" field="profe"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="clase.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipousuario" action="show" id="${claseInstance?.tipo?.id}">${claseInstance?.tipo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.cantidadMax}">
				<li class="fieldcontain">
					<span id="cantidadMax-label" class="property-label"><g:message code="clase.cantidadMax.label" default="Cantidad Max" /></span>
					
						<span class="property-value" aria-labelledby="cantidadMax-label"><g:fieldValue bean="${claseInstance}" field="cantidadMax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.anotados}">
				<li class="fieldcontain">
					<span id="anotados-label" class="property-label"><g:message code="clase.anotados.label" default="Anotados" /></span>
					
						<g:each in="${claseInstance.anotados}" var="a">
						<span class="property-value" aria-labelledby="anotados-label"><g:link controller="usuario" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.cantidadActual}">
				<li class="fieldcontain">
					<span id="cantidadActual-label" class="property-label"><g:message code="clase.cantidadActual.label" default="Cantidad Actual" /></span>
					
						<span class="property-value" aria-labelledby="cantidadActual-label"><g:fieldValue bean="${claseInstance}" field="cantidadActual"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${claseInstance?.fechaHorario}">
				<li class="fieldcontain">
					<span id="fechaHorario-label" class="property-label"><g:message code="clase.fechaHorario.label" default="Fecha Horario" /></span>
					
						<span class="property-value" aria-labelledby="fechaHorario-label"><g:formatDate date="${claseInstance?.fechaHorario}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:claseInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${claseInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
