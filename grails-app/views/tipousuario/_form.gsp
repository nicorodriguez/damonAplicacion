<%@ page import="sistema.Tipousuario" %>



<div class="fieldcontain ${hasErrors(bean: tipousuarioInstance, field: 'nombreTipo', 'error')} required">
	<label for="nombreTipo">
		<g:message code="tipousuario.nombreTipo.label" default="Nombre Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombreTipo" required="" value="${tipousuarioInstance?.nombreTipo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipousuarioInstance, field: 'abreviaturaTipo', 'error')} required">
	<label for="abreviaturaTipo">
		<g:message code="tipousuario.abreviaturaTipo.label" default="Abreviatura Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="abreviaturaTipo" maxlength="2" required="" value="${tipousuarioInstance?.abreviaturaTipo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipousuarioInstance, field: 'abreviatura', 'error')} required">
	<label for="abreviatura">
		<g:message code="tipousuario.abreviatura.label" default="Abreviatura" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="abreviatura" required="" value="${tipousuarioInstance?.abreviatura}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipousuarioInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="tipousuario.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${tipousuarioInstance?.nombre}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipousuarioInstance, field: 'usuariostipo', 'error')} ">
	<label for="usuariostipo">
		<g:message code="tipousuario.usuariostipo.label" default="Usuariostipo" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${tipousuarioInstance?.usuariostipo?}" var="u">
    <li><g:link controller="usuario" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="usuario" action="create" params="['tipousuario.id': tipousuarioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'usuario.label', default: 'Usuario')])}</g:link>
</li>
</ul>


</div>

