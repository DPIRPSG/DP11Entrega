<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags" %>


<!-- Listing grid -->
<display:table pagesize="5" class="displaytag" keepStatus="false"
	name="attributesDescription" requestURI="${requestURI}" id="row_AttributeDescription">
	<!-- Action links -->

	<!-- Attributes -->
	<display:column>
		<div>
			<b><a href="attribute-description/user/edit.do?attributeDescriptionId=${row_AttributeDescription.id}"> <spring:message
						code="attributeDescription.edit" />
			</a></b>
		</div>
	</display:column>

	<spring:message code="attributeDescription.value" var="valueHeader" />
	<display:column title="${valueHeader}"
		sortable="true">
		<jstl:out value="${row_AttributeDescription.value}"/>
	</display:column>
</display:table>

<br/>
<br/>

<!-- Action links -->

<div>
	<b><a href="attribute-description/user/create.do"> <spring:message
				code="attributeDescription.create" />
	</a></b>
</div>
