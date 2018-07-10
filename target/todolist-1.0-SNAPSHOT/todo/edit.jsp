<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<t:wrapper>
    <h2>Edit your task</h2>
    <form action="/todo/edit" method="post" class="form-horizontal">
        <input type="hidden" name="id" value="<c:out value="${itemToEdit.id}"/>">

        <div class="form-group">
            <label for="title" class="control-label col-md-2">Title</label>
            <div class="col-md-6">
                <input id="title" type="text" name="title" class="form-control" value="<c:out value="${itemToEdit.title}"/>">
            </div>
        </div>
        <div class="form-group">
            <label for="description" class="control-label col-md-2">Description</label>
            <div class="col-md-6">
                <input id="description" type="text" name="description" class="form-control"
                       value="<c:out value="${itemToEdit.description}"/>">
            </div>
        </div>
        <div class="form-group">
            <label for="startdate" class="control-label col-md-2">Date</label>
            <div class="col-md-6">
                <input id="startdate" type="datetime-local" name="startdate" class="form-control" value="<c:out value="${itemToEdit.startDate}"/>"
                       placeholder="Data">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Save</button>
                <a href="/todo" class="btn btn-default">Back</a>
            </div>
        </div>

    </form>
</t:wrapper>
