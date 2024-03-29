﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="FrancoHandling_App.UserControls.Login" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<script type="text/javascript">

    function ShowPopupForgetPassword(s,e){
        popupForgetPassword.Show();
    }
        
    function DoProcessEnterKey(htmlEvent) {
        if (htmlEvent.keyCode == 13)
        {
            ASPxClientUtils.PreventEventAndBubble(htmlEvent);
            btn.DoClick();
        }
    }
</script>

<div class="container">
    <div class="text-center" style="width:240px; margin:auto;">
        <h1 style="margin-top:80px;">Please Login</h1>
        <br />

        <section style="width:240px;">
            <div>
                <dx:BootstrapTextBox ID="txtUsername" NullText="Username" runat="server">
                    <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" />
                    <ValidationSettings ValidationGroup="Validation" SetFocusOnError="true">
                        <RequiredField IsRequired="true" ErrorText="Username is required" />
                    </ValidationSettings>
                </dx:BootstrapTextBox>
            </div>
            <br />
            <div>
                <dx:BootstrapTextBox ID="txtPassword" NullText="Password" runat="server" Password="true">
                    <ClientSideEvents KeyDown="function(s, e) { DoProcessEnterKey(e.htmlEvent); }" />
                    <ValidationSettings ValidationGroup="Validation">
                        <RequiredField IsRequired="true" ErrorText="Password is required" />
                    </ValidationSettings>
                </dx:BootstrapTextBox>
            </div>
        </section>
        
        <section class="text-right" style="margin-top:5px;">
            <i class="glyphicon glyphicon-info-sign"></i>
            <a style="font-size:small; font-style:italic;" href="javascript:ShowPopupForgetPassword();"> Forgot Password</a>
        </section>
        
        <section class="marginTop20">
            <dx:ASPxButton runat="server" ID="btn" ClientInstanceName="btn" OnClick="btnLogin_Click" ClientVisible="false">
                <ClientSideEvents Click="function(s, e) {  
                    var isValidated = ASPxClientEdit.ValidateGroup('Validation');
                    if(isValidated) lpModal.Show();
                    e.processOnServer = isValidated }" />
            </dx:ASPxButton>
            <dx:BootstrapButton ID="btnLogin" ClientInstanceName="btnLogin" runat="server" Text="Login" style="background-color:#0477C0; color:white"
                SettingsBootstrap-RenderOption="Success"
                OnClick="btnLogin_Click">
                <ClientSideEvents Click="function(s, e) {  
                    var isValidated = ASPxClientEdit.ValidateGroup('Validation');
                    if(isValidated) lpModal.Show();
                    e.processOnServer = isValidated }" />
                <CssClasses Icon="glyphicon glyphicon-log-in" />
            </dx:BootstrapButton>
        </section>
    </div>
</div>


<dx:BootstrapPopupControl ID="popupForgetPassword" runat="server" ClientInstanceName="popupForgetPassword" Modal="true" EncodeHtml="false"
    PopupAnimationType="Slide" CloseAnimationType="Slide"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="360px"
    HeaderText="Forget Password" 
    Text="Saat ini <i>Forget Password</i> belum dapat dilakukan,<br/>Harap menghubungi administator aplikasi...">
</dx:BootstrapPopupControl>
