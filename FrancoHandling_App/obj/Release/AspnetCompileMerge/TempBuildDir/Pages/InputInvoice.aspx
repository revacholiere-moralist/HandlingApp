﻿<%@ Page Title="Invoice" Language="C#" MasterPageFile="~/Layout.master" AutoEventWireup="true" CodeBehind="InputInvoice.aspx.cs" Inherits="FrancoHandling_App.Pages.InputInvoice" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">

<script type="text/javascript">
    function OnAddLO(s, e) {
        if (txtInvoiceNumber.GetText() != "" && dateInvoice.GetText() != "") {
            popupAddLO.Show();
            popupAddLO.PerformCallback('Load');
        }
            
    }

    function OnClearInputInvoice(s, e) {
        txtInvoiceNumber.Clear();
        txtApproveBy.Clear();
        dateInvoice.Clear();
        txtNote.Clear();
        gridInvoiceItem.CancelEdit();
    }
    
    function OnClickAddGridLO(s, e) {        
        gridAddLO.PerformCallback('Checked');
        popupAddLO.Hide();
        gridInvoiceItem.Refresh();
    }

    function txtInvoiceNumber_LostFocus()
    {
        gridInvoiceItem.Refresh();
    }

    /*popup alert*/
    function GridShowPopup(s, e) {
        if (gridAddLO.cpRes != null && gridAddLO.cpRes != "") {
            if (gridAddLO.cpRes.includes("Succes")) {
                Alert("success", "Invoice", gridAddLO.cpRes);
                gridInvoiceItem.Refresh();
            }
            else {
                Alert("error", "Invoice", gridAddLO.cpRes);
            }
            gridAddLO.cpRes = null;
        }
    }

    function GridInvoiceItem_EndCallback(s, e) {
        if (gridInvoiceItem.cpRes != null && gridInvoiceItem.cpRes != "") {
            if (gridInvoiceItem.cpRes.includes("Succes")) {
                Alert("success", "Invoice", gridInvoiceItem.cpRes);
            }
            else {
                Alert("error", "Invoice", gridInvoiceItem.cpRes);
            }
            gridInvoiceItem.cpRes = null;
        }
    }        

    function PriceUnitChange(s, e) {
        SubTotal.SetValue(Quantity.GetValue() * PriceUnit.GetValue());
    }
</script>

<div class="container">
    <div class="row">
        <div class="page-header">
            <h1>Input Invoice</h1>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <dx:BootstrapTextBox runat="server" ID="txtInvoiceNumber" ClientInstanceName="txtInvoiceNumber" Caption="Nomor Invoice">
                <ClientSideEvents LostFocus="txtInvoiceNumber_LostFocus" />
                <ValidationSettings RequiredField-IsRequired="true" RequiredField-ErrorText="Field is Required" SetFocusOnError="true"></ValidationSettings>
            </dx:BootstrapTextBox><br />
            <dx:BootstrapTextBox runat="server" ID="txtApproveBy" ClientInstanceName="txtApproveBy" Caption="Penandatangan"></dx:BootstrapTextBox>
        </div>
        <div class="col-md-6">
            <dx:BootstrapDateEdit runat="server" ID="dateInvoice" ClientInstanceName="dateInvoice" Caption="Tanggal Invoice" DisplayFormatString="dd.MM.yyyy">
                <ValidationSettings  RequiredField-IsRequired="true"  RegularExpression-ErrorText="Field is Required" SetFocusOnError="true"></ValidationSettings>
            <ClientSideEvents GotFocus="function(s,e){s.ShowDropDown();}"/></dx:BootstrapDateEdit><br />
            <dx:BootstrapMemo runat="server" ID="txtNote" ClientInstanceName="txtNote" Caption="Catatan" Rows="3"></dx:BootstrapMemo><br />
        </div>

        <div class="row" style="text-align:center;">
            <div class="col-md-12">
                <dx:BootstrapButton runat="server" ID="btnSaveHeader" ClientInstanceName="btnSaveHeader" Text="Save Data Header" ToolTip="Simpan data header" 
                    style="background-color:#0477C0; color:white" CausesValidation="true" AutoPostBack="true"
                    OnClick="btnSaveHeader_Click" >
                </dx:BootstrapButton>
            </div>
        </div>

        <div class="col-md-12">
            <dx:BootstrapButton runat="server" ID="btnAdd" ClientInstanceName="btnAdd" Text="Tambah LO" style="background-color:#0477C0; color:white" AutoPostBack="false" CausesValidation="true">
                <ClientSideEvents Click="OnAddLO" />
            </dx:BootstrapButton>
            <dx:BootstrapGridView ID="gridInvoiceItem" ClientInstanceName="gridInvoiceItem" runat="server" KeyFieldName="LO_ID;Product_ID" 
                AutoGenerateColumns="False" EnableCallBacks="true" 
                OnDataBinding="gridInvoiceItem_DataBinding"
                OnRowDeleting="gridInvoiceItem_RowDeleting"
                OnRowUpdating="gridInvoiceItem_RowUpdating"
                ClientSideEvents-EndCallback="GridInvoiceItem_EndCallback">
                <SettingsDataSecurity AllowDelete="true" AllowEdit="true" />
                <SettingsBehavior ConfirmDelete="true"/>
                <Settings ShowHeaderFilterButton="false" ShowGroupPanel="false" ShowFooter="true"/>
                <SettingsSearchPanel Visible="false" ShowApplyButton="false" />
                <SettingsPager Mode="ShowAllRecords"/>
                <SettingsDetail ShowDetailRow="false" />
                <SettingsEditing Mode="Inline"></SettingsEditing>
                <SettingsBehavior ConfirmDelete="true"/>
                <SettingsCommandButton DeleteButton-IconCssClass="glyphicon glyphicon-remove"
                    EditButton-IconCssClass="glyphicon glyphicon-edit"></SettingsCommandButton>
                <Columns>
                    <dx:BootstrapGridViewCommandColumn Caption=" " AllowDragDrop="False" ButtonRenderMode="Button" Name="CmdInvoiceItem" ShowDeleteButton="true" ShowEditButton="true"/>
                    <dx:BootstrapGridViewDataColumn FieldName="NoLO" Caption="Nomor LO"  ReadOnly="true" />
                        <dx:BootstrapGridViewDataColumn FieldName="Product_ID" Visible="false"/>
                        <dx:BootstrapGridViewDataColumn FieldName="ProductName" Caption="Produk"  ReadOnly="true" />
                        <dx:BootstrapGridViewSpinEditColumn FieldName="QuantityVolume" Caption="Kuantitas" ReadOnly="true">
                            <PropertiesSpinEdit ClientInstanceName="Quantity" DisplayFormatString="{0:N0} LITER" SpinButtons-ClientVisible="false"></PropertiesSpinEdit>
                        </dx:BootstrapGridViewSpinEditColumn>
                        <dx:BootstrapGridViewSpinEditColumn FieldName="PriceUnit" Caption="Harga OAT" ReadOnly="false" >
                            <PropertiesSpinEdit ClientInstanceName="PriceUnit" NumberType="Float" DisplayFormatString="IDR {0:N0}" DisplayFormatInEditMode="true"
                                SpinButtons-ClientVisible="false"
                                ClientSideEvents-ValueChanged="PriceUnitChange">
                                <ValidationSettings RequiredField-IsRequired ="true" RequiredField-ErrorText="Field is Required" SetFocusOnError="true"/>
                            </PropertiesSpinEdit>
                        </dx:BootstrapGridViewSpinEditColumn>
                        <dx:BootstrapGridViewSpinEditColumn FieldName="SubTotal" Caption="Harga SubTotal" ReadOnly="true" >
                            <PropertiesSpinEdit ClientInstanceName="SubTotal" DisplayFormatString="IDR {0:N0}" SpinButtons-ClientVisible="false"></PropertiesSpinEdit>
                        </dx:BootstrapGridViewSpinEditColumn>
                </Columns>
                <TotalSummary>
                    <dx:ASPxSummaryItem FieldName="SubTotal" SummaryType="Sum" />
                </TotalSummary>
            </dx:BootstrapGridView>
        </div>
        
    </div>

    <div class="row" style="text-align:center;">
    <div class="col-md-12">
        <dx:BootstrapButton runat="server" ID="btnSave" ClientInstanceName="btnSave" Text="Simpan" style="background-color:#0477C0; color:white" 
                OnClick="btnSave_Click" AutoPostBack="true"></dx:BootstrapButton>
        <dx:BootstrapButton runat="server" ID="btnSubmit" ClientInstanceName="btnSubmit" Text="Submit" style="background-color:#0477C0; color:white" 
                OnClick="btnSubmit_Click" AutoPostBack="true"></dx:BootstrapButton>
        <%--<dx:BootstrapButton runat="server" ID="btnCancel" ClientInstanceName="btnCancel" Text="Cancel" AutoPostBack="false" CausesValidation="false">
            <ClientSideEvents Click="OnClearInputInvoice" />
        </dx:BootstrapButton>--%>
        <dx:BootstrapButton runat="server" ID="btnClose" ClientInstanceName="btnClose" Text="Close" AutoPostBack="true" CausesValidation="false"
            OnClick="btnClose_Click" />   
        </div>
    </div>
</div>


    <dx:BootstrapPopupControl ID="popupAddLO" runat="server" ClientInstanceName="popupAddLO" Modal="true" EncodeHtml="false" EnableClientSideAPI="true"
        PopupAnimationType="Slide" CloseAnimationType="Slide" ShowCloseButton="true" CloseAction="CloseButton"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="600"
        HeaderText="Add Loading Order" OnCallback="popupAddLO_Callback" >
        <ContentCollection>
            <dx:ContentControl>
                <dx:BootstrapGridView runat="server" ID="gridAddLO" ClientInstanceName="gridAddLO" KeyFieldName="LO_ID" 
                    EnableCallBacks="true" AutoGenerateColumns="False"
                    OnCustomCallback="gridAddLO_CustomCallback"
                    OnDataBinding="gridAddLO_DataBinding"
                    ClientSideEvents-EndCallback="GridShowPopup">
                    <Settings ShowFooter="false" />
                    <SettingsSearchPanel Visible="true" ShowApplyButton="true" />
                    <SettingsPager Mode="ShowPager" PageSize="4"></SettingsPager>
                    <Columns>
                        <dx:BootstrapGridViewCommandColumn ShowSelectCheckbox="True" SelectAllCheckboxMode="Page">
                        </dx:BootstrapGridViewCommandColumn>
                        <dx:BootstrapGridViewDataColumn FieldName="NoLO" Caption="Nomor LO"  ReadOnly="true" />
                        <dx:BootstrapGridViewDataColumn FieldName="Product_ID" Visible="false"/>
                        <dx:BootstrapGridViewDataColumn FieldName="ProductName" Caption="Produk"  ReadOnly="true" />
                        <dx:BootstrapGridViewTextColumn FieldName="QuantityVolume" Caption="Kuantitas" ReadOnly="true">
                            <PropertiesTextEdit ClientInstanceName="SubTotal" DisplayFormatString="{0:N0} LITER" DisplayFormatInEditMode="true"></PropertiesTextEdit>
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewTextColumn FieldName="PriceUnit" Caption="Harga Satuan" ReadOnly="true" >
                            <PropertiesTextEdit ClientInstanceName="SubTotal" DisplayFormatString="IDR {0:N0}" DisplayFormatInEditMode="true"></PropertiesTextEdit>
                        </dx:BootstrapGridViewTextColumn>
                        <dx:BootstrapGridViewTextColumn FieldName="SubTotal" Caption="Harga SubTotal" ReadOnly="true" >
                            <PropertiesTextEdit ClientInstanceName="SubTotal" DisplayFormatString="IDR {0:N0}" DisplayFormatInEditMode="true"></PropertiesTextEdit>
                        </dx:BootstrapGridViewTextColumn>
                    </Columns>
                </dx:BootstrapGridView>
                <div style="text-align:right;">
                    <dx:BootstrapButton runat="server" ID="btnAddGridLO" ClientInstanceName="btnAddGridLO" Text="Add LO" style="background-color:#0477C0; color:white" 
                        AutoPostBack="false">
                        <ClientSideEvents Click="OnClickAddGridLO"/>
                    </dx:BootstrapButton>
                    <dx:BootstrapButton runat="server" ID="btnCloseGridLO" ClientInstanceName="btnCloseGridLO" Text="Close" AutoPostBack="false" CausesValidation="false">
                        <ClientSideEvents Click="function(){ popupAddLO.Hide(); gridInvoiceItem.Refresh(); }" />
                    </dx:BootstrapButton>
                </div>
            </dx:ContentControl>
        </ContentCollection>
    </dx:BootstrapPopupControl>


    <asp:HiddenField ID="hfInvoiceType" runat="server" />
    <asp:HiddenField ID="hfInvoiceNumber" runat="server" />
    <asp:HiddenField ID="hfStatus" runat="server" />
</asp:Content>
