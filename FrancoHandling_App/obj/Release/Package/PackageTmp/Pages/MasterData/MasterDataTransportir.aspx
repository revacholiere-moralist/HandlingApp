﻿<%@ Page Title="TRANSPORTIR" Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.master" CodeBehind="MasterDataTransportir.aspx.cs" Inherits="FrancoHandling_App.Pages.MasterData.MasterDataTransportir" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<div class="container">
    <div class="row">
        <div class="col-md-12" >
            <div class="page-header">
                <h1>Master Data Transportir</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" >
            
            <dx:ASPxPanel ID="panGv" ClientInstanceName="panGV" Width="100%" runat="server" ScrollBars="Horizontal">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:BootstrapGridView ID="gvMasterDataTransportir" ClientInstanceName="gvMasterDataTransportir" runat="server" KeyFieldName="Transporter_ID" AutoGenerateColumns="False"
                            ClientSideEvents-CallbackError="function(s,e){ ShowModalPopupMsg(e.message); }" 
                            ClientSideEvents-EndCallback="GvEndCallbackShowModalPopupMsg"
                            OnDataBinding="gvMasterDataTransportir_DataBinding"
                            OnRowInserting="gvMasterDataTransportir_RowInserting"
                            OnRowUpdating="gvMasterDataTransportir_RowUpdating"
                            OnRowDeleting="gvMasterDataTransportir_RowDeleting"
                            >
                            <Settings ShowHeaderFilterButton="true" ShowGroupPanel="false" />
                            <SettingsDataSecurity AllowInsert="true" AllowEdit="true" AllowDelete="true"/>
                            <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                            <SettingsDetail ShowDetailRow="true" AllowOnlyOneMasterRowExpanded="true" />
                            <SettingsPopup EditForm-HorizontalAlign="WindowCenter" EditForm-VerticalAlign="WindowCenter" EditForm-Modal="true" EditForm-ShowHeader="true"></SettingsPopup>
                            <SettingsText PopupEditFormCaption="Add / Edit Transportir"/>
                            <SettingsSearchPanel Visible="true" ShowApplyButton="true" HighlightResults="true" />
                            <SettingsBehavior ConfirmDelete="true" />
                            <SettingsLoadingPanel Mode="ShowAsPopup" />
                            <SettingsPager Mode="ShowPager" PageSize="10"></SettingsPager>
                            <Columns>
                                <dx:BootstrapGridViewCommandColumn  Caption="Action" ShowNewButtonInHeader="true" ShowEditButton="true" ShowDeleteButton="true" AllowDragDrop="False" ButtonRenderMode="Button"   Width="1px"  />
                                <dx:BootstrapGridViewTextColumn FieldName="TransporterName" Caption="Nama Transportir" PropertiesTextEdit-ValidationSettings-RequiredField-IsRequired="true" Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewMemoColumn FieldName="Address" Caption="Alamat" Settings-AllowDragDrop="False"/>
                                <dx:BootstrapGridViewTextColumn FieldName="Email" Caption="Email" Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewTextColumn FieldName="Phone" Caption="No Telepon"  Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewTextColumn FieldName="Contact1" Caption="Nama PIC 1" Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewTextColumn FieldName="Contact2" Caption="Nama PIC 2" Settings-AllowDragDrop="False"></dx:BootstrapGridViewTextColumn>
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
                                            <dx:BootstrapTextBox runat="server" ID="txtName" Caption="Nama Transportir" Text='<%# Eval("TransporterName") %>'>
                                                <ValidationSettings RequiredField-IsRequired="true" RequiredField-ErrorText="Field is Required"></ValidationSettings>
                                            </dx:BootstrapTextBox>
                                            <br />
                                            <dx:BootstrapMemo runat="server" ID="txtAddress" Caption="Alamat" Text='<%# Eval("Address") %>' CssClasses-Control="MemoNoResize" >
                                            </dx:BootstrapMemo>
                                            <br />
                                            <dx:BootstrapTextBox runat="server" ID="txtEmail" Caption="Email" Text='<%# Eval("Email") %>' >
                                                <ValidationSettings RequiredField-IsRequired="true" RequiredField-ErrorText="Field is Required">
                                                    <RegularExpression ErrorText="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                </ValidationSettings>
                                            </dx:BootstrapTextBox>
                                            <br />    
                                            <dx:BootstrapTextBox runat="server" ID="txtPhone" Caption="No Telepon" Text='<%# Eval("Phone") %>' MaxLength="20">
                                                <ValidationSettings RequiredField-IsRequired="true" RequiredField-ErrorText="Field is Required"></ValidationSettings>
                                                <ClientSideEvents KeyDown="InputDigitOnly" />
                                            </dx:BootstrapTextBox>
                                            <br />  
                                            <dx:BootstrapTextBox runat="server" ID="txtContact1" Caption="Nama PIC 1" Text='<%# Eval("Contact1") %>' >
                                            </dx:BootstrapTextBox>
                                            <br />
                                            <dx:BootstrapTextBox runat="server" ID="txtContact2" Caption="Nama PIC 2" Text='<%# Eval("Contact2") %>' >
                                            </dx:BootstrapTextBox>
                                            <br />  
                                        </div>
                                        <div class="col-md-3"></div>
                                        
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12" style="text-align:center">
                                            <dx:BootstrapButton runat="server" ID="btnUpdate" CssClasses-Control="btn-success" Text="Save" AutoPostBack="false" Width="150px">
                                                <ClientSideEvents Click="function(s,e){ 
                                                                            if(ASPxClientEdit.ValidateGroup(null)) 
                                                                                gvMasterDataTransportir.UpdateEdit();
                                                                            else 
                                                                                Alert('warning', 'Warning', 'Some required fields is still empty or have a wrong format. Please check again.');
                                                                         }"/>
                                            </dx:BootstrapButton>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-md-12" style="text-align:center">
                                            <dx:BootstrapButton runat="server" ID="btnCancel" Text="Cancel" AutoPostBack="false" Width="150px">
                                                <ClientSideEvents Click="function(s,e){ gvMasterDataTransportir.CancelEdit(); }" />
                                            </dx:BootstrapButton>
                                        </div>
                                    </div>
                                </EditForm>

                                <DetailRow>
                                    <dx:ASPxLabel runat="server" Text='<%# "Ongkos Angkut Transport " + Eval("TransporterName") %>' Font-Bold="true"></dx:ASPxLabel>
                                    <dx:BootstrapGridView ID="gvFee" ClientInstanceName="gvFee" runat="server" KeyFieldName="Transporter_ID;Region_ID" AutoGenerateColumns="False"
                                        ClientSideEvents-CallbackError="function(s,e){ ShowModalPopupMsg(e.message); }" 
                                        ClientSideEvents-EndCallback="GvEndCallbackShowPopupMsg"
                                        OnBeforePerformDataSelect="gvFee_BeforePerformDataSelect"
                                        OnRowUpdating="gvFee_RowUpdating">
                                        <Settings ShowHeaderFilterButton="true" ShowGroupPanel="false" />
                                        <SettingsDataSecurity AllowEdit="true" />
                                        <SettingsEditing Mode="Inline"></SettingsEditing>
                                        <SettingsLoadingPanel Mode="ShowAsPopup" />
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                        <Columns>
                                            <dx:BootstrapGridViewCommandColumn  Caption="Action" ShowEditButton="true" AllowDragDrop="False" ButtonRenderMode="Button" Width="1px"  />
                                            <dx:BootstrapGridViewTextColumn FieldName="RegionName" Caption="Region" Settings-AllowDragDrop="False">
                                                <EditItemTemplate>
                                                    <dx:ASPxLabel runat="server" Text='<%# Eval("RegionName") %>'></dx:ASPxLabel>
                                                </EditItemTemplate>
                                            </dx:BootstrapGridViewTextColumn>
                                            <dx:BootstrapGridViewSpinEditColumn FieldName="HandlingFee" Caption="Handling Fee" PropertiesSpinEdit-NumberType="Float" PropertiesSpinEdit-DisplayFormatString="IDR {0:N2}" PropertiesSpinEdit-DisplayFormatInEditMode="true"  Settings-AllowDragDrop="False"/>
                                            <dx:BootstrapGridViewSpinEditColumn FieldName="OATDistanceLimit" Caption="Limit Jarak OAT" PropertiesSpinEdit-NumberType="Integer" PropertiesSpinEdit-DisplayFormatString="{0:N0} KM" PropertiesSpinEdit-DisplayFormatInEditMode="true"  Settings-AllowDragDrop="False"/>
                                            <dx:BootstrapGridViewSpinEditColumn FieldName="OATPriceUnderEqualLimit" Caption="OAT ≤ Limit Jarak" PropertiesSpinEdit-NumberType="Float" PropertiesSpinEdit-DisplayFormatString="IDR {0:N2}" PropertiesSpinEdit-DisplayFormatInEditMode="true"  Settings-AllowDragDrop="False"/>
                                            <dx:BootstrapGridViewSpinEditColumn FieldName="OATPriceAboveLimit" Caption="OAT > Limit Jarak" PropertiesSpinEdit-NumberType="Float" PropertiesSpinEdit-DisplayFormatString="IDR {0:N2}" PropertiesSpinEdit-DisplayFormatInEditMode="true"  Settings-AllowDragDrop="False"/>
                                        </Columns>
                                    </dx:BootstrapGridView>
                                </DetailRow>
                            </Templates>
                        </dx:BootstrapGridView>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
            
        </div>
    </div>
</div>
</asp:Content>