<%@ page session="false" import="org.apache.sling.api.SlingHttpServletRequest"%>

<%@include file="/libs/foundation/global.jsp"%>

<% response.setContentType("application/json");%>
<%// ((SlingHttpServletRequest)request).getRequestPathInfo().getSelectors()[1]  %>
<%= resourceResolver.resolve(resource.getPath()+ "/par/json_editor").adaptTo(Node.class).getProperty("jsonData").getValue() %>