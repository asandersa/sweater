<#import "parts/common.ftlh" as c>

<@c.page>
    <div xmlns="http://www.w3.org/1999/html">
        <p>
            <a class="btn btn-outline-success" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
                New message!
            </a>
        </p>
        <div class="collapse <#if message??>show</#if>" id="collapseExample">
            <div class="card card-body">
                <form method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                               value="<#if message??>${message.text}</#if>" name="text" placeholder="Enter your message" />
                    </div>
                    <#if textError??>
                    <div class="invalid-feedback">
                        ${textError}
                    </div>
                    </#if>
                    <div class="form-group my-3">
                        <input type="text" class="form-control"
                               value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Enter your Teg">
                    </div>
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                    <div class="form-group">
                        <div class="input-group mb-3">
                            <input type="file" name="file" class="form-control" id="customFile" d>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="form-group">
                        <button type="submit" class="btn btn-outline-success">Send!</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-2 g-4 mt-3">
        <#list messages as message>
            <div class="card border-success m-2" style="max-width: 40rem;">
                <div class="card-header">
                    <h3 class="card-title">${message.authorName}</h3>
                </div>
                <div>
                    <#if message.filename??>
                        <img src="/img/${message.filename}" class="img-thumbnail mx-auto d-block" alt="..." >
                    </#if>
                </div>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <h3 class="fw-lighter">${message.text}</h3>
                    </li>
                    <li class="list-group-item">
                        <p class="fst-italic">${message.tag}</p>
                    </li>
                </ul>
            </div>
        <#else>
            No message
        </#list>
    </div>
</@c.page>