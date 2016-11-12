
<%@ page import="seguridad.Servicio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'servicio.label', default: 'Servicio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-servicio" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-servicio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombreServicio" title="${message(code: 'servicio.nombreServicio.label', default: 'Nombre Servicio')}" />
					
						<g:sortableColumn property="cantidadCreditos" title="${message(code: 'servicio.cantidadCreditos.label', default: 'Cantidad Creditos')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${servicioInstanceList}" status="i" var="servicioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${servicioInstance.id}">${fieldValue(bean: servicioInstance, field: "nombreServicio")}</g:link></td>
					
						<td>${fieldValue(bean: servicioInstance, field: "cantidadCreditos")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${servicioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
