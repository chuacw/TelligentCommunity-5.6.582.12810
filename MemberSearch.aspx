<%@ Page language="c#" Codebehind="MemberSearch.aspx.cs" AutoEventWireup="false" Inherits="CommunityServer.ControlPanel.Membership.MemberSearch" MasterPageFile="~/ControlPanel/Masters/MembershipAdmin.master" %>
<%@ Import Namespace = "CommunityServer.Components" %>

<asp:Content ContentPlaceHolderId="DescriptionRegion" runat="server">
	<cp:resourcecontrol runat="server" resourcename="CP_Membership_Default_Title" />
</asp:Content>

<asp:Content ContentPlaceHolderId="TaskRegion" runat="Server">
    <cp:controlpanelselectednavigation selectednavitem="BrowseMembers" runat="server" />
    <SCRIPT type="text/javascript">
    <!--

    var actionsName = '<cp:resourcecontrol runat="server" resourcename="CP_MemberSearch_GridCol_Actions" />';
    var sUrl = unescape(window.location.pathname);
    -->
    </SCRIPT>

    <div class="CommonFormArea">
	    <cp:usersearch id="UserSearchControl" runat="Server" destinationurl="MemberSearch.aspx">
	        <SkinTemplate>
                    <script type="text/javascript">
                    // <![CDATA[
                    joinedDateValue = new Date();
                    lastPostDateValue = new Date();
                    
                    function LastPostDateComparerChange()
                    {
                        var dateComparerIndex = document.getElementById('<%=CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "lastPostDateComparer").ClientID%>').selectedIndex;
                        if (dateComparerIndex == 0)
                            document.getElementById('lastPostDateContainer').style.display = 'none';
                        else
                            document.getElementById('lastPostDateContainer').style.display = 'inline';
                    }

                    function JoinedDateComparerChange()
                    {
                        var dateComparerIndex = document.getElementById('<%=CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "joinedDateComparer").ClientID%>').selectedIndex;
                        if (dateComparerIndex == 0)
                            document.getElementById('joinedDateContainer').style.display = 'none';
                        else
                            document.getElementById('joinedDateContainer').style.display = 'inline';
                    }

                    function disableJoinedDate(DropDownList) 
                    {
	                    joinedDateValue = <%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "joinedDate").ClientID %>.DateTime;
                    }
                    
                    function disableLastPostDate(DropDownList) 
                    {
		                lastPostDateValue = <%= CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "lastPostDate").ClientID %>.DateTime;
                    }
                    
                    function toggleAdvancedOptions(toggleCheckbox)
                    {
                        var optionsContainer = document.getElementById("AdvancedSearchContainer");
                        if (optionsContainer == null)
                            return;
              
                        if (!toggleCheckbox.checked)
                            optionsContainer.style.display = 'none';
                        else
                            optionsContainer.style.display = 'block';
                    }
                    
                    function KeyDownHandler(event)
                    {
                        if (event.keyCode == 13)
                        {
                            <%= Page.GetPostBackClientEvent(CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "searchButton"), "") %>;
                        }
                    }
                    
                    // ]]>
                    </script>
                    
                    <asp:Panel runat="server" DefaultButton="searchButton">
                    <div class="CommonFormFieldName">
	                    <CP:ResourceControl runat="server" ResourceName="CP_Membership_Default_Description" />
                    </div>
                    <div>
                        <asp:textbox id="searchText" runat="server" Columns=75 class="shorttxt" maxlength="255" onkeydown="KeyDownHandler(event);" />
                        <asp:Button id="searchButton" runat="server" />
                    </div>
                    <p />
                    <input type="checkbox" onclick="toggleAdvancedOptions(this)"><CP:ResourceControl ID="ResourceControl1" runat="server" ResourceName="CP_Membership_MoreOptions" /></input>
                    <p />
                    <div id="AdvancedSearchContainer" style="display: none;">
                        <p />
                        <CP:ResourceControl runat="server" ResourceName="CP_Membership_Default_SearchOptions" />
                        <p />
                        <div class="CommonFormFieldName">
                            <cp:resourcecontrol runat="server" resourcename="CP_Membership_Default_UserSearchControl_SortBy" />
                        </div>
                        <div class="CommonFormField">
                            <cp:membersortdropdownlist id="memberSortDropDown" runat="server" />
                            <cp:sortorderdropdownlist id="sortOrderDropDown" runat="server" />
                        </div>
                        <div class="CommonFormFieldName">
                            <cp:resourcecontrol runat="server" resourcename="CP_Membership_UserSearchControl_FilterByDate" />
                        </div>
                        <div class="CommonFormField">
                            <asp:dropdownlist id="joinedDateComparer" runat="server" />
                            <!-- chuacw datetime format -->
                            <span id="joinedDateContainer">
                                <TWC:DateTimeSelector runat="server" ID="joinedDate" DateTimeFormat="d MMM yyyy" ShowCalendarPopup="true" />
                            </span>
                            <asp:dropdownlist id="lastPostDateComparer" runat="server" />
                            <span id="lastPostDateContainer">
                                <TWC:DateTimeSelector runat="server" ID="lastPostDate" DateTimeFormat="d MMM yyyy" ShowCalendarPopup="true" />
                            </span>
                        </div>
                        <div class="CommonFormFieldName">
                            <cp:resourcecontrol runat="server" resourcename="CP_Membership_UserSearchControl_Role" />
                        </div>
                        <div class="CommonFormField">
                            <asp:dropdownlist id="searchRole" runat="server" />
                        </div>
                        <div class="CommonFormFieldName">
                            <cp:resourcecontrol runat="server" resourcename="CP_Membership_UserSearchControl_Status" />
                        </div>
                        <div class="CommonFormField">
                            <cp:accountstatusdropdownlist enableshowall = "true" id="currentAccountStatus" runat="server" />
                        </div>
                        <div class="CommonFormFieldName" id="AdminRow1" runat=server>
                            <cp:resourcecontrol runat="server" resourcename="CP_Membership_UserSearchControl_SearchFor" />
                        </div>
                        <div class="CommonFormField">
                            <asp:dropdownlist id="searchType" runat="server" align="absmiddle" />
                        </div>
                    </div>
					<div class="CommonFormFieldName">
						<cp:resourcelabel id="DescResourceLabel" runat="server" resourcename="CP_Membership_UserSearchControl_PageSize" />
					</div>
					<div class="CommonFormField">
						<asp:dropdownlist id="pageList" runat="server">
							<asp:listitem value="10">10</asp:listitem>
							<asp:listitem value="20">20</asp:listitem>
							<asp:listitem value="30">30</asp:listitem>
							<asp:listitem value="40">40</asp:listitem>
							<asp:listitem value="50">50</asp:listitem>
						</asp:dropdownlist>
					</div>
              </asp:Panel>
	        </SkinTemplate>
	    </cp:usersearch>
    </div>

    <CP:StatusMessage runat="server" id="Status" Visible="false"/>
                    
    <asp:Panel runat="server" id="UserResultsPanel">
    <CP:RepeaterPlusNone runat="server" ID="UserSearchResults">
        <HeaderTemplate>
            <table cellpadding="0" cellspacing="0" border="0"  width="100%">
                <tr>
                    <th class="CommonListHeaderLeftMost"><CP:ResourceControl runat="server" ResourceName="CP_MemberSearch_GridCol_Username" /></th>
                    <th class="CommonListHeader" style="text-align: center;"><CP:ResourceControl runat="server" ResourceName="CP_MemberSearch_GridCol_Email" /></th>
                    <th class="CommonListHeader" style="text-align: center;"><CP:ResourceControl runat="server" ResourceName="CP_MemberSearch_GridCol_Posts" /></th>
                    <th class="CommonListHeader" style="text-align: center;"><CP:ResourceControl runat="server" ResourceName="CP_MemberSearch_GridCol_Joined" /></th>
                    <th class="CommonListHeader" style="text-align: center;">&nbsp;</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td class="CommonListCellLeftMost">
                    <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:CustomCondition CustomResult='<%# Eval("IsSystemAccount")%>' runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:UserData runat="server" Property="Username" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:UserData runat="server" Property="Username" LinkTo="Profile" /></FalseContentTemplate>
                    </CSControl:ConditionalContent>
                </td>
                <td class="CommonListCell" style="text-align: center;">
                    <a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a>
                </td>
                <td class="CommonListCell" style="text-align: center;">
                    <a href='<%# Eval("SearchPostsUrl") %>'><%# Eval("TotalPosts") %></a>
                </td>
                <td class="CommonListCell" style="text-align: center;">
                    <%# Eval("DateCreated", "{0:d MMM yyyy h:mm:ss tt}") %>
                    <!-- chuacw date created format -->
                </td>
                <td class="CommonListCell">
                    <input type="button" onclick="window.location = 'UserEdit.aspx?UserID=<%# Eval("UserID") %>';" value="<%# ResourceManager.GetString("CP_UserEdit_EditUser", "ControlPanelResources.xml") %>" />
                    
                    <input type="button" onclick="javascript:Telligent_Modal.Open('UserName.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);" value="<%# ResourceManager.GetString("CP_UserEdit_ChangeUserName", "ControlPanelResources.xml") %>" />
                    
                    <input type="button" onclick="javascript:Telligent_Modal.Open('UserPassword.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);" value="<%# ResourceManager.GetString("CP_UserEdit_ChangePassword", "ControlPanelResources.xml") %>" />
                    
                    <input type="button" onclick="javascript:Telligent_Modal.Open('UserRoles.aspx?UserID=<%# Eval("UserID") %>', 500, 400, refresh);" value="<%# ResourceManager.GetString("CP_UserEdit_ChangeRoles", "ControlPanelResources.xml") %>" />
                    
                    <input type="button" onclick="javascript:Telligent_Modal.Open('UserDelete.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);" value="<%# ResourceManager.GetString("CP_UserEdit_DeleteUser", "ControlPanelResources.xml") %>" />
                </td>
            </tr>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <tr class="AltListRow">
                <td class="CommonListCellLeftMost">
                    <CSControl:ConditionalContent runat="server">
                    <ContentConditions><CSControl:CustomCondition CustomResult='<%# Eval("IsAnonymous")%>' runat="server" /></ContentConditions>
                    <TrueContentTemplate><CSControl:UserData runat="server" Property="Username" /></TrueContentTemplate>
                    <FalseContentTemplate><CSControl:UserData runat="server" Property="Username" LinkTo="Profile" /></FalseContentTemplate>
                    </CSControl:ConditionalContent>
                </td>
                <td class="CommonListCell" style="text-align: center;">
                    <a href='mailto:<%# Eval("Email") %>'><%# Eval("Email") %></a>
                </td>
                <td class="CommonListCell" style="text-align: center;">
                    <a href='<%# Eval("SearchPostsUrl") %>'><%# Eval("TotalPosts") %></a>
                </td>
                <td class="CommonListCell" style="text-align: center;">
                    <%# Eval("DateCreated", "{0:d MMM yyyy h:mm:ss tt}") %>
                    <!-- chuacw date created format -->
                </td>
                <td class="CommonListCell">
                    <input type="button" onclick="window.location = 'UserEdit.aspx?UserID=<%# Eval("UserID") %>';" value="<%# ResourceManager.GetString("CP_UserEdit_EditUser", "ControlPanelResources.xml") %>" />
                    
                    <input type="button" onclick="javascript:Telligent_Modal.Open('UserName.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);" value="<%# ResourceManager.GetString("CP_UserEdit_ChangeUserName", "ControlPanelResources.xml") %>" />
                    
                    <input type="button" onclick="javascript:Telligent_Modal.Open('UserPassword.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);" value="<%# ResourceManager.GetString("CP_UserEdit_ChangePassword", "ControlPanelResources.xml") %>" />
                    
                    <input type="button" onclick="javascript:Telligent_Modal.Open('UserRoles.aspx?UserID=<%# Eval("UserID") %>', 500, 400, refresh);" value="<%# ResourceManager.GetString("CP_UserEdit_ChangeRoles", "ControlPanelResources.xml") %>" />
                    
                    <input type="button" onclick="javascript:Telligent_Modal.Open('UserDelete.aspx?UserID=<%# Eval("UserID") %>', 500, 300, refresh);" value="<%# ResourceManager.GetString("CP_UserEdit_DeleteUser", "ControlPanelResources.xml") %>" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <FooterTemplate>
            </table>
            
        </FooterTemplate>
    </CP:RepeaterPlusNone>
    <CSControl:Pager runat="Server" id="csPager" />
    </asp:Panel>

    <script type="text/javascript">
    // <![CDATA[
    document.getElementById('<%=CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "lastPostDateComparer").ClientID%>').onchange = LastPostDateComparerChange;
    document.getElementById('<%=CommunityServer.Controls.CSControlUtility.Instance().FindControl(this, "joinedDateComparer").ClientID%>').onchange = JoinedDateComparerChange;
    LastPostDateComparerChange();
    JoinedDateComparerChange();
    // ]]>
    </script>

</asp:Content>