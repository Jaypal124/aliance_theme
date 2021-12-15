<#import "template.ftl" as layout>
<@layout.registrationLayout bodyClass="oauth"; section>

<style>
#button {
    width:50px;
    background-color: rgb(0, 50, 137);
    color: white;
    padding: 7px;
    border: 1px solid black;
    font-family: Raleway,Arial, Helvetica, sans-serif;
}

</style>

    <#if section = "header">
        <#if client.name?has_content>
            ${msg("oauthGrantTitle",advancedMsg(client.name))}
        <#else>
            ${msg("oauthGrantTitle",client.clientId)}
        </#if>
    <#elseif section = "form">
        <div id="kc-oauth" class="content-area">
            <h3>${msg("oauthGrantRequest")}</h3>
            <ul>
                <#if oauth.clientScopesRequested??>
                    <#list oauth.clientScopesRequested as clientScope>
                        <li>
                            <span>${advancedMsg(clientScope.consentScreenText)}</span>
                        </li>
                    </#list>
                </#if>
            </ul>

            <form class="form-actions" action="${url.oauthAction}" method="POST">
                <input type="hidden" name="code" value="${oauth.code}">
                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                        </div>
                    </div>

                    <div id="kc-form-buttons">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <input id="button"  class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="accept" id="kc-login" type="submit" value="${msg("doYes")}"/>&nbsp;
                            <input id="button"  class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="cancel" id="kc-cancel" type="submit" value="${msg("doNo")}"/>
                        </div>
                    </div>
                </div>
            </form>
            <div class="clearfix"></div>
        </div>
    </#if>
</@layout.registrationLayout>
