<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags" %>


	<!-- Listing grid -->
	<display:table pagesize="5" class="displaytag"
		name="autoreply" requestURI="autoreply/actor/list.do" id="row_autoreply">
		
		<display:column>
				<acme:link href="autoreply/actor/edit.do?autoreplyId=${row_autoreply.id}" code="autoreply.edit"/>
		</display:column>
				
		<acme:displayColumn value="${row_autoreply.keyWords}" title="autoreply.keyWords"/>
		<acme:displayColumn value="${row_autoreply.text}" title="autoreply.text"/>
			
	</display:table>
	
	<!-- Action links -->
	<div>
		<b><a href="autoreply/actor/create.do"> 
			<spring:message code="autoreply.create" />
		</a></b>
	</div>

