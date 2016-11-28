
<%@ page import="sistema.Tipousuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tipousuario.label', default: 'Tipousuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tipousuario" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tipousuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nombreTipo" title="${message(code: 'tipousuario.nombreTipo.label', default: 'Nombre Tipo')}" />
					
						<g:sortableColumn property="abreviaturaTipo" title="${message(code: 'tipousuario.abreviaturaTipo.label', default: 'Abreviatura Tipo')}" />
					
						<g:sortableColumn property="abreviatura" title="${message(code: 'tipousuario.abreviatura.label', default: 'Abreviatura')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'tipousuario.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tipousuarioInstanceList}" status="i" var="tipousuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tipousuarioInstance.id}">${fieldValue(bean: tipousuarioInstance, field: "nombreTipo")}</g:link></td>
					
						<td>${fieldValue(bean: tipousuarioInstance, field: "abreviaturaTipo")}</td>
					
						<td>${fieldValue(bean: tipousuarioInstance, field: "abreviatura")}</td>
					
						<td>${fieldValue(bean: tipousuarioInstance, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tipousuarioInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
