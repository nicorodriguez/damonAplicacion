<%@ page import="sistema.Clase" %>



<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'profe', 'error')} required">
	<label for="profe">
		<g:message code="clase.profe.label" default="Profe" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="profe" maxlength="50" required="" value="${claseInstance?.profe}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="clase.tipo.label" default="Tipo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${sistema.Tipousuario.list()}" optionKey="id" required="" value="${claseInstance?.tipo?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'cantidadMax', 'error')} required">
	<label for="cantidadMax">
		<g:message code="clase.cantidadMax.label" default="Cantidad Max" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadMax" type="number" value="${claseInstance.cantidadMax}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'anotados', 'error')} ">
	<label for="anotados">
		<g:message code="clase.anotados.label" default="Anotados" />
		
	</label>
	<g:select name="anotados" from="${seguridad.Usuario.list()}" multiple="multiple" optionKey="id" size="5" value="${claseInstance?.anotados*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'cantidadActual', 'error')} required">
	<label for="cantidadActual">
		<g:message code="clase.cantidadActual.label" default="Cantidad Actual" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadActual" type="number" value="${claseInstance.cantidadActual}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: claseInstance, field: 'fechaHorario', 'error')} required">
	<label for="fechaHorario">
		<g:message code="clase.fechaHorario.label" default="Fecha Horario" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaHorario" precision="day"  value="${claseInstance?.fechaHorario}"  />

</div>

