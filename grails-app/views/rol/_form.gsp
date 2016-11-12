<%@ page import="seguridad.Rol" %>



<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'nivelAutoridad', 'error')} required">
	<label for="nivelAutoridad">
		<g:message code="rol.nivelAutoridad.label" default="Nivel Autoridad" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nivelAutoridad" type="number" value="${rolInstance.nivelAutoridad}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: rolInstance, field: 'usuariosrol', 'error')} ">
	<label for="usuariosrol">
		<g:message code="rol.usuariosrol.label" default="Usuariosrol" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${rolInstance?.usuariosrol?}" var="u">
    <li><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="usuario" action="create" params="['rol.id': rolInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'usuario.label', default: 'Usuario')])}</g:link>
</li>
</ul>


</div>

