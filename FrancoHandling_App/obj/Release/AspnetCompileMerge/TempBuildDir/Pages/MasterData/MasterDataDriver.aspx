﻿<%@ Page Title="DRIVER" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="MasterDataDriver.aspx.cs" Inherits="FrancoHandling_App.Pages.MasterData.MasterDataDriver" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<style>
    .ImagePhoto {
        border: 1px solid #ddd;
        border-radius: 4px;
        padding: 5px;
    }
    .ImagePhoto:hover {
        box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
        cursor: pointer;
    }
</style>

<div class="container">
    <div class="row">
        <div class="col-md-12" >
            <div class="page-header">
                <h1>Master Data Driver</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" >
            
            <dx:ASPxPanel ID="panGv" ClientInstanceName="panGV" Width="100%" runat="server" ScrollBars="Horizontal">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:BootstrapGridView ID="gv" ClientInstanceName="gv" runat="server" KeyFieldName="Driver_ID" AutoGenerateColumns="False"
                            ClientSideEvents-CallbackError="function(s,e){ ShowModalPopupMsg(e.message); }" 
                            ClientSideEvents-EndCallback="GvEndCallbackShowModalPopupMsg"
                            OnHtmlDataCellPrepared="gv_HtmlDataCellPrepared"
                            OnDataBinding="gv_DataBinding"
                            OnRowInserting="gv_RowInserting"
                            OnRowUpdating="gv_RowUpdating"
                            OnRowDeleting="gv_RowDeleting"
                            OnHtmlEditFormCreated="gv_HtmlEditFormCreated">
                            <Settings ShowHeaderFilterButton="true" ShowGroupPanel="false" />
                            <SettingsDataSecurity AllowDelete="true" AllowEdit="true" AllowInsert="true"/>
                            <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                            <SettingsPopup EditForm-HorizontalAlign="WindowCenter" EditForm-VerticalAlign="WindowCenter" EditForm-Modal="true" EditForm-ShowHeader="true"></SettingsPopup>
                            <SettingsText PopupEditFormCaption="Add / Edit Driver"/>
                            <SettingsSearchPanel Visible="true" ShowApplyButton="true" HighlightResults="true" />
                            <SettingsBehavior ConfirmDelete="true" />
                            <SettingsLoadingPanel Mode="ShowAsPopup" />
                            <SettingsPager Mode="ShowPager" PageSize="10"></SettingsPager>
                            <Columns>
                                <dx:BootstrapGridViewCommandColumn Caption="Action" ShowNewButtonInHeader="true" ShowEditButton="true" ShowDeleteButton="true" AllowDragDrop="False" ButtonRenderMode="Button" Width="1px"  />
                                <dx:BootstrapGridViewDataColumn FieldName="ImageBytes" Caption="Photo" Settings-AllowDragDrop="False" Settings-AllowSort="False" Width="100px">
                                    <DataItemTemplate>
                                        <dx:BootstrapBinaryImage runat="server" ID="imgPhotoGrid" ImageSizeMode="FillAndCrop" Width="100px" Height="100px" EnableServerResize="true" EmptyImageUrl="~/Content/Images/Common/NoPhoto.png"></dx:BootstrapBinaryImage>
                                    </DataItemTemplate>
                                </dx:BootstrapGridViewDataColumn>
                                <dx:BootstrapGridViewTextColumn FieldName="Name" Caption="Nama" Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewDataColumn FieldName="Transporter_ID" Visible="false" Settings-AllowDragDrop="False"></dx:BootstrapGridViewDataColumn>
                                <dx:BootstrapGridViewTextColumn FieldName="TransporterName" Caption="Transportir" Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewMemoColumn FieldName="Address" Caption="Alamat" Settings-AllowDragDrop="False"/>
                                <dx:BootstrapGridViewDateColumn FieldName="Birthday" Caption="Tanggal Lahir" PropertiesDateEdit-DisplayFormatString="dd-MMM-yyyy" Settings-AllowDragDrop="False"/>
                                <dx:BootstrapGridViewTextColumn FieldName="Email" Caption="Email" Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewTextColumn FieldName="Phone1" Caption="Phone1" Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewTextColumn FieldName="Phone2" Caption="Phone2" Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewDateColumn FieldName="CreationDate" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy HH:mm:ss" Visible="False" Settings-AllowDragDrop="False"/>
                                <dx:BootstrapGridViewDataColumn FieldName="CreationBy" Visible="False" Settings-AllowDragDrop="False"/>
                                <dx:BootstrapGridViewDateColumn FieldName="UpdateDate" PropertiesDateEdit-DisplayFormatString="dd-MM-yyyy HH:mm:ss" Visible="False" Settings-AllowDragDrop="False"/>
                                <dx:BootstrapGridViewDataColumn FieldName="UpdateBy" Visible="False" Settings-AllowDragDrop="False"/>
                            </Columns>
                            <Templates>
                                <EditForm>
                                    <div class="row">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-6">
                                            <div style="text-align:center">
                                                <dx:BootstrapCallbackPanel runat="server" ID="cpPhoto" ClientInstanceName="cpPhoto" OnCallback="cpPhoto_Callback" >
                                                    <ClientSideEvents EndCallback="function(s,e){imgPhoto.GetMainElement().className=''}" />
                                                    <ContentCollection>
                                                        <dx:ContentControl>
                                                            <dx:BootstrapBinaryImage runat="server" ID="imgPhoto" ClientInstanceName="imgPhoto" CssClasses-Control="ImagePhoto" Width="100px" Height="100px" ImageSizeMode ="FillAndCrop" EnableServerResize="true" OnInit="imgPhoto_Init" EmptyImageUrl="~/Content/Images/Common/AddPhoto.png"></dx:BootstrapBinaryImage>
                                                            <br />
                                                            <strong>Upload Photo<br />Max 512 KB (.jpg, .jpeg, .png)</strong>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:BootstrapCallbackPanel>
                                                <dx:BootstrapUploadControl runat="server" ID="ucPhoto" ClientInstanceName="ucPhoto" UploadMode="Advanced" AutoStartUpload="true" ClientVisible="false" DialogTriggerID="imgPhoto" ShowProgressPanel="true" ValidationSettings-AllowedFileExtensions=".jpg,.jpeg,.png" ValidationSettings-MaxFileSize="524288" ValidationSettings-MaxFileSizeErrorText="File size exceeds the maximum allowed size, which is 512 KB" OnFileUploadComplete="ucPhoto_FileUploadComplete">
                                                    <ClientSideEvents 
                                                        FilesUploadStart="function(s,e){s.SetVisible(true);}"
                                                        FilesUploadComplete="function(s,e){s.SetVisible(false); cpPhoto.PerformCallback();}"/>
                                                </dx:BootstrapUploadControl>
                                            </div>
                                            
                                            <br />
                                            <dx:BootstrapTextBox runat="server" ID="txtName" Caption="Nama" Text='<%# Eval("Name") %>'>
                                                <ValidationSettings RequiredField-IsRequired="true" RequiredField-ErrorText="Field is Required"></ValidationSettings>
                                            </dx:BootstrapTextBox>
                                            <br />
                                            <dx:BootstrapComboBox runat="server" ID="cmbTransportir" Caption="Transportir" ValueField="Transporter_ID" TextField="TransporterName" IncrementalFilteringMode="Contains" OnInit="cmbTransportir_Init">
                                                <ValidationSettings RequiredField-IsRequired="true" RequiredField-ErrorText="Field is Required"></ValidationSettings>
                                            </dx:BootstrapComboBox>
                                            <br />
                                            <dx:BootstrapMemo runat="server" ID="txtAddress" Caption="Alamat" Text='<%# Eval("Address") %>' CssClasses-Control="MemoNoResize" >
                                            </dx:BootstrapMemo>
                                            <br /> 
                                            <dx:BootstrapDateEdit runat="server" ID="deBirthday" Caption="Tanggal Lahir" DisplayFormatString="dd-MMM-yyyy" AllowNull="true" OnInit="deBirthday_Init"></dx:BootstrapDateEdit>
                                            <br />  
                                            <dx:BootstrapTextBox runat="server" ID="txtEmail" Caption="Email" Text='<%# Eval("Email") %>' >
                                                <ValidationSettings>
                                                    <RegularExpression ErrorText="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                </ValidationSettings>
                                            </dx:BootstrapTextBox>
                                            <br />  
                                            <dx:BootstrapTextBox runat="server" ID="txtPhone1" Caption="No Telepon 1" Text='<%# Eval("Phone1") %>' MaxLength="20">
                                                <ValidationSettings RequiredField-IsRequired="true" RequiredField-ErrorText="Field is Required"></ValidationSettings>
                                                <ClientSideEvents KeyDown="InputDigitOnly" />
                                            </dx:BootstrapTextBox>
                                            <br />
                                            <dx:BootstrapTextBox runat="server" ID="txtPhone2" Caption="No Telepon 2" Text='<%# Eval("Phone2") %>' MaxLength="20">
                                                <ClientSideEvents KeyDown="InputDigitOnly" />
                                            </dx:BootstrapTextBox>
                                        
                                            <br />
                                            <br />
                                            
                                            <div style="text-align:center">
                                                <dx:BootstrapButton runat="server" ID="btnUpdate" CssClasses-Control="btn-success" Text="Save" AutoPostBack="false" Width="150px">
                                                    <ClientSideEvents Click="function(s,e){ 
                                                                                if(ASPxClientEdit.ValidateGroup(null)) 
                                                                                    gv.UpdateEdit();
                                                                                else 
                                                                                    Alert('warning', 'Warning', 'Some required fields is still empty or have a wrong format. Please check again.');
                                                                             }"/>
                                                </dx:BootstrapButton>
                                        
                                                <br />
                                                <br />
                                    
                                                <dx:BootstrapButton runat="server" ID="btnCancel" Text="Cancel" AutoPostBack="false" Width="150px">
                                                    <ClientSideEvents Click="function(s,e){ gv.CancelEdit(); }" />
                                                </dx:BootstrapButton>
                                            </div>
                                        
                                        </div>
                                        <div class="col-md-3"></div>
                                    
                                            
                                </EditForm>
                            </Templates>
                        </dx:BootstrapGridView>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
            
        </div>
    </div>
</div>
</asp:Content>