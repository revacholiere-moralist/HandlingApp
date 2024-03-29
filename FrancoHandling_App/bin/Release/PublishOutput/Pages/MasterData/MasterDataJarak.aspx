﻿<%@ Page Title="JARAK TBBM - SPSH" Language="C#" AutoEventWireup="true" MasterPageFile="~/Layout.master" CodeBehind="MasterDataJarak.aspx.cs" Inherits="FrancoHandling_App.Pages.MasterData.MasterDataJarak" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.1, Version=17.1.8.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
<div class="container">
    <div class="row">
        <div class="col-md-12" >
            <div class="page-header">
                <h1>Master Data Jarak</h1>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" >
            
            <dx:ASPxPanel ID="panGv" ClientInstanceName="panGV" Width="100%" runat="server" ScrollBars="Horizontal">
                <PanelCollection>
                    <dx:PanelContent>
                        <dx:BootstrapGridView ID="gv" ClientInstanceName="gv" runat="server" KeyFieldName="TBBM_ID;SPSH_ID" AutoGenerateColumns="False"
                            ClientSideEvents-CallbackError="function(s,e){ ShowModalPopupMsg(e.message); }" 
                            ClientSideEvents-EndCallback="GvEndCallbackShowPopupMsg"
                            OnDataBinding="gv_DataBinding"
                            OnRowUpdating="gv_RowUpdating">
                            <Settings ShowHeaderFilterButton="true" ShowGroupPanel="false" />
                            <SettingsDataSecurity AllowEdit="true" />
                            <SettingsEditing Mode="Inline"></SettingsEditing>
                            <SettingsSearchPanel Visible="true" ShowApplyButton="true" HighlightResults="true" />
                            <SettingsLoadingPanel Mode="ShowAsPopup" />
                            <SettingsPager Mode="ShowPager" PageSize="10"></SettingsPager>
                            <Columns>
                                <dx:BootstrapGridViewCommandColumn  Caption="Action" ShowEditButton="true" AllowDragDrop="False" ButtonRenderMode="Button" Width="1px"  />
                                <dx:BootstrapGridViewTextColumn FieldName="TBBMName" Caption="TBBM" Settings-AllowDragDrop="False">
                                    <EditItemTemplate>
                                        <dx:ASPxLabel runat="server" Text='<%# Eval("TBBMName") %>'></dx:ASPxLabel>
                                    </EditItemTemplate>
                                </dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewTextColumn FieldName="SPSHName" Caption="SPSH" Settings-AllowDragDrop="False">
                                    <EditItemTemplate>
                                        <dx:ASPxLabel runat="server" Text='<%# Eval("SPSHName") %>'></dx:ASPxLabel>
                                    </EditItemTemplate>
                                </dx:BootstrapGridViewTextColumn>
                                <dx:BootstrapGridViewSpinEditColumn FieldName="Distance" Caption="Jarak" PropertiesSpinEdit-NumberType="Float" PropertiesSpinEdit-DisplayFormatString="{0:N2} KM" PropertiesSpinEdit-DisplayFormatInEditMode="true"  Settings-AllowDragDrop="False"/>
                                <dx:BootstrapGridViewSpinEditColumn FieldName="NormalRate" Caption="Tarif Angkut" PropertiesSpinEdit-NumberType="Float" PropertiesSpinEdit-DisplayFormatString="{0:N2} IDR" PropertiesSpinEdit-DisplayFormatInEditMode="true"  Settings-AllowDragDrop="False"/>
                                <dx:BootstrapGridViewSpinEditColumn FieldName="SpecialRate" Caption="Tarif >40 KM" PropertiesSpinEdit-NumberType="Float" PropertiesSpinEdit-DisplayFormatString="{0:N2} IDR" PropertiesSpinEdit-DisplayFormatInEditMode="true"  Settings-AllowDragDrop="False"/>
                            </Columns>
                        </dx:BootstrapGridView>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxPanel>
            
        </div>
    </div>
</div>
</asp:Content>