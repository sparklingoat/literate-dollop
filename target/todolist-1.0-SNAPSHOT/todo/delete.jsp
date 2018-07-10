<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper>
    <h3>Are you sure you want to remove the task?</h3>
    <dl class="dl-horizontal">
        <dt>Name:</dt>
        <dd><c:out value="${itemToDelete.title}"/></dd>
        <dt>Description:</dt>
        <dd><c:out value="${itemToDelete.description}"/></dd>
    </dl>

    <form action="/todo/delete" method="post">
        <input type="hidden" name="id" value="<c:out value="${itemToDelete.id}"/>">
        <button class="btn btn-danger" type="submit">Yes, delete.</button>
        <a href="/todo" class="btn btn-default">No, return.</a>
    </form>

</t:wrapper>