<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="mb-3">
            <label class="form-label">User name:</label>
            <input type="text" name="username" value="<#if user??>${user.username}</#if>"
                   class="form-control ${(usernameError??)?string('is-invalid', '')}"
                   placeholder="User name">
            <#if usernameError??>
                <div class="invalid-feedback">
                    ${usernameError}
                </div>
            </#if>
        </div>
        <div class="mb-3">
            <label class="form-label">Password:</label>
            <input type="password" name="password"
                   class="form-control ${(passwordError??)?string('is-invalid', '')}"
                   placeholder="Password">
            <#if passwordError??>
                <div class="invalid-feedback">
                    ${passwordError}
                </div>
            </#if>
        </div>
        <#if isRegisterForm>
            <div class="mb-3">
                <label class="form-label">Password:</label>
                <input type="password" name="password2"
                       class="form-control ${(password2Error??)?string('is-invalid', '')}"
                       placeholder="Retype password">
                <#if password2Error??>
                    <div class="invalid-feedback">
                        ${password2Error}
                    </div>
                </#if>
            </div>
            <div class="mb-3">
                <label class="form-label">E-mail:</label>
                <input type="email" name="email" value="<#if user??>${user.email}</#if>"
                       class="form-control ${(emailError??)?string('is-invalid', '')}"
                       placeholder="email@email.com">
                <#if emailError??>
                    <div class="invalid-feedback">
                        ${emailError}
                    </div>
                </#if>
            </div>
            <div>
                <div class="g-recaptcha mb-3" data-sitekey="6Lcjxe0gAAAAAEdc1q_IwVfE_hsUXwpwI0OP7Pkv"></div>
            </div>
            <#if captchaError??!>
                <div class="alert alert-danger" role="alert">
                    ${captchaError}
                </div>
            </#if>
        </#if>
        <button type="submit" class="btn btn-outline-success"><#if isRegisterForm>Create<#else>Sign In</#if></button>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <#if !isRegisterForm><a href="/registration">Add new user!</a></#if>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-outline-success">Log out!</button>
    </form>
</#macro>