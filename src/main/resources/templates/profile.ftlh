<#import "parts/common.ftlh" as c>
<@c.page>
    <h3>${username}</h3>
    ${message!}
    <form method="post">
        <div class="mb-3">
            <label class="form-label">Password:</label>
            <input type="password" name="password" class="form-control" placeholder="Password">
        </div>
            <div class="mb-3">
                <label class="form-label">E-mail:</label>
                <input type="email" name="email" class="form-control" placeholder="email@email.com" value="${email!}">
            </div>
        <button type="submit" class="btn btn-outline-success">Save</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</@c.page>