<%@ attribute name="action" required="true" rtexprvalue="true" %>  
<%@ attribute name="className" required="false" rtexprvalue="true" %>  
<%@ attribute name="label" required="false" rtexprvalue="true" %>  
<%@ attribute name="disabled" required="false" rtexprvalue="true" %>  
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${userActions}" var="item">
  <c:if test="${action==item.action}">
    <c:if test="${disabled=='true'}">
    <button id="${action}" type="submit" class="${className}" disabled="${disabled}" onclick="return onSubmitButton('${action}');">
    <c:if test="${empty label}">
    ${item.desc}
    </c:if>
    <c:if test="${not empty label}">
    ${label}
    </c:if>
    </button>
    </c:if>
    <c:if test="${empty disabled or disabled=='false'}">
    <button id="${action}" type="submit" class="${className}" onclick="return onSubmitButton('${action}');">
    <c:if test="${empty label}">
    ${item.desc}
    </c:if>
    <c:if test="${not empty label}">
    ${label}
    </c:if>
    </button>
    </c:if> 
  </c:if>
</c:forEach>

