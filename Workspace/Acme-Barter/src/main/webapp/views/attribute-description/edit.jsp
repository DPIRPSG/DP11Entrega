<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<!-- Form -->
<form:form action="attribute/administrator/edit.do" modelAttribute="attributeDescription">
	<!-- Hidden Attributes -->
	<form:hidden path="id" />
	<form:hidden path="version" />

	<acme:select items="${attributes}" itemLabel="name" code="attributeDescription.attribute" path="attribute"/>	
	<acme:textarea code="attributeDescription.value" path="value" />
	<br />
	
	<!-- Action buttons -->
	<acme:submit name="save" code="attributeDescription.save"/>
	&nbsp;
	<jstl:if test="${attribute.id != 0}">
		<acme:submit_confirm name="delete" code="attributeDescription.delete" codeConfirm="attributeDescription.confirm.delete" />
		&nbsp;
	</jstl:if>
	<acme:cancel url="attribute-description/user/list.do" code="attributeDescription.cancel"/>
	<br />

</form:form>