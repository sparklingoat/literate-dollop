<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<style>
    #todoheader {
        margin-bottom: 25px;
    }

    #todocontainer {
        margin-top: 20px;
    }
</style>

<t:wrapper>
    <div id="todocontainer" class="container">

        <h2 id="todoheader"> My tasks </h2>

        <c:choose>
            <c:when test="${sessionScope.delete_result eq true}">
                <div class="alert alert-success">
                    Task sucessfully deleted!
                    <c:remove var="delete_result"/>
                </div>
            </c:when>
            <c:when test="${sessionScope.delete_result eq false}">
                <div class="alert alert-warning">
                    Error! Cannot delete the task.
                    <c:remove var="delete_result"/>
                </div>
            </c:when>
        </c:choose>

        <c:if test="${sessionScope.todo_created eq true}">
            <div class="alert alert-success">
                New task added!
            </div>
            <c:remove var="todo_created"/>
        </c:if>
            <%---------------------------------------------------------------------%>
        <c:if test="${fn:length(todos) eq 0}">
            <div class="alert alert-warning">
                No tasks yet. Click <a href="/todo/create">here</a>, to add new.
            </div>

        </c:if>


        <c:if test="${fn:length(todos) gt 0}">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Title</th>
                    <th>Desctiprion</th>
                    <th>Date</th>
                    <th>Options</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="todo" items="${todos}">
                    <tr>
                        <td><c:out value="${todo.id}"/></td>
                        <td><c:out value="${todo.title}"/></td>
                        <td><c:out value="${todo.description}"/></td>
                        <td><c:out value="${todo.startDate}"/></td>
                        <td><a href="/todo/edit?id=<c:out value="${todo.id}"/>">Edit</a> |
                            <a href="#">Details</a> |
                            <a href="/todo/delete?id=<c:out value="${todo.id}"/>">Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <a href="/todo/create" class="btn btn-primary">Add</a>
        </c:if>
    </div>
</t:wrapper>