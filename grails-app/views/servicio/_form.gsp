<%@ page import="seguridad.Servicio" %>



<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'nombreServicio', 'error')} required">
	<label for="nombreServicio">
		<g:message code="servicio.nombreServicio.label" default="Nombre Servicio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreServicio" required="" value="${servicioInstance?.nombreServicio}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'cantidadCreditos', 'error')} required">
	<label for="cantidadCreditos">
		<g:message code="servicio.cantidadCreditos.label" default="Cantidad Creditos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadCreditos" type="number" value="${servicioInstance.cantidadCreditos}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: servicioInstance, field: 'usuariosserv', 'error')} ">
	<label for="usuariosserv">
		<g:message code="servicio.usuariosserv.label" default="Usuariosserv" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${servicioInstance?.usuariosserv?}" var="u">
    <li><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="usuario" action="create" params="['servicio.id': servicioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'usuario.label', default: 'Usuario')])}</g:link>
</li>
</ul>


</div>

