
<%@ page import="sistema.Clase" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clase.label', default: 'Clase')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-clase" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-clase" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="profe" title="${message(code: 'clase.profe.label', default: 'Profe')}" />
					
						<th><g:message code="clase.tipo.label" default="Tipo" /></th>
					
						<g:sortableColumn property="cantidadMax" title="${message(code: 'clase.cantidadMax.label', default: 'Cantidad Max')}" />
					
						<g:sortableColumn property="cantidadActual" title="${message(code: 'clase.cantidadActual.label', default: 'Cantidad Actual')}" />
					
						<g:sortableColumn property="fechaHorario" title="${message(code: 'clase.fechaHorario.label', default: 'Fecha Horario')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${claseInstanceList}" status="i" var="claseInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${claseInstance.id}">${fieldValue(bean: claseInstance, field: "profe")}</g:link></td>
					
						<td>${fieldValue(bean: claseInstance, field: "tipo")}</td>
					
						<td>${fieldValue(bean: claseInstance, field: "cantidadMax")}</td>
					
						<td>${fieldValue(bean: claseInstance, field: "cantidadActual")}</td>
					
						<td><g:formatDate date="${claseInstance.fechaHorario}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${claseInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
