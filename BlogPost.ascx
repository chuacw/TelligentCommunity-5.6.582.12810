<%@ Control Language="C#" AutoEventWireup="true" %>

<div class="full-post-header"></div>
<div class="full-post">
	<!-- chuacw WeblogPostData Subject WeblogPostDataSubject -->
 <CSBlog:WeblogPostData runat="server" Tag="H3" CssClass="post-name" Property="Subject" />
	<CSBlog:WeblogPostRating runat="server" RatingCssClass="rating" RatingReadOnlyCssClass="rating readonly" RatingActiveCssClass="rating active" ImagesBaseUrl="~/Utility/images/">
	    <LeaderTemplate>
	        <div class="post-rating">
	            <CSControl:ResourceControl runat="server" ResourceName="RateThis" /><br />
	    </LeaderTemplate>
	    <TrailerTemplate>
	        </div>
	    </TrailerTemplate>
	</CSBlog:WeblogPostRating>
    <div class="post-author">
        <CSControl:UserData runat="server" LinkTo="Profile" Tag="Span" CssClass="avatar">
            <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
            <ContentTemplate><CSControl:UserAvatar runat="server" Width="32" Height="32" /></ContentTemplate>
        </CSControl:UserData>
        <CSControl:UserAvatar runat="server" Width="32" Height="32" Tag="Span" CssClass="avatar">
            <DisplayConditions><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
        </CSControl:UserAvatar>
        <CSControl:UserData runat="server" LinkTo="Profile" Tag="Span" CssClass="user-name" LinkCssClass="internal-link view-user-profile">
            <DisplayConditions Operator="Not"><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
            <ContentTemplate><span></span><CSControl:UserData Property="DisplayName" runat="server" /></ContentTemplate>
        </CSControl:UserData>
        <CSControl:UserData runat="server" Property="DisplayName" Tag="Span" CssClass="user-name">
            <DisplayConditions><CSControl:UserPropertyValueComparison runat="server" ComparisonProperty="IsAnonymous" Operator="IsSetOrTrue" /></DisplayConditions>
        </CSControl:UserData>
    </div>
    <div class="post-date">
        <span class="value">
            <!-- modified by chuacw 6 Aug 2020 to add date format -->
            <CSBlog:WeblogPostData Property="PostDate" FormatString="ddd, d MMM yyyy @ h:mm tt" runat="server" IncludeTimeInDate="true" />
        </span>
    </div>
    <div class="post-attributes">
        <div class="attribute-list-header"></div>
        <ul class="attribute-list">
             <li class="attribute-item post-reply-count">
                <span class="attribute-name"><CSControl:ResourceControl runat="server" ResourceName="Comments" /></span>
                <span class="attribute-value"><a href="#comments" class="internal-link view-replies"><span></span><CSBlog:WeblogPostData runat="server" Property="Replies" /></a></span>
             </li>
        </ul>
        <div class="attribute-list-footer"></div>
    </div>
    <div class="post-content user-defined-markup"><CSBlog:WeblogPostData Property="FormattedBody" runat="server" IncrementViewCount="true" /></div>
    <div class="post-attachment-viewer">
		<CSBlog:PostAttachmentData runat="server" LinkTo="Attachment" LinkCssClass="internal-link download-attachment">
			<LeaderTemplate><div class="post-attachment">
				<CSControl:ResourceControl runat="server" ResourceName="CreateEditPost_Inline12" Tag="Span" CssClass="label" />
				<span class="value"></LeaderTemplate>
			<ContentTemplate>
				<CSBlog:PostAttachmentViewer runat="server" ViewType="Preview" Width="28" Height="28" CssClass="avatar" Tag="Span" />
				<CSBlog:PostAttachmentData runat="server" Property="FileName" />
			</ContentTemplate>
			<TrailerTemplate></span></div></TrailerTemplate>
		</CSBlog:PostAttachmentData>
    </div>
    <div class="post-actions">
        <div class="navigation-list-header"></div>
        <ul class="navigation-list">
            <CSBlog:WeblogPostFavoriteToggleButton runat="server" Tag="Li" CssClass="navigation-item" ButtonOnCssClass="internal-link favorite-on" ButtonOffCssClass="internal-link favorite-off" ButtonProcessingCssClass="internal-link processing">
                <OffTemplate><span></span><CSControl:ResourceControl runat=server ResourceName="Blogs_BlogPost_FavoritePost" /></OffTemplate>
                <OnTemplate><span></span><CSControl:ResourceControl runat=server ResourceName="Blogs_BlogPost_RemoveFromFavoritesPost" /></OnTemplate>
                <ProcessingTemplate><span></span>...</ProcessingTemplate>
            </CSBlog:WeblogPostFavoriteToggleButton>
            <li class="navigation-item"><CSBlog:WeblogPostData runat="server" LinkTo="CommentsPage" Property="Replies" LinkCssClass="internal-link view-replies" ResourceName="Blog_PostQuestionAnswerView_CommentsCountFormatString" /></li>
            <CSBlog:WeblogPostData Tag="Li" CssClass="navigation-item" Property="TitleUrl" runat="server">
                <DisplayConditions><CSBlog:WeblogPostPropertyValueComparison runat="server" ComparisonProperty="IsExternal" Operator="IsSetOrTrue" /></DisplayConditions>
                <ContentTemplate>
                    <CSControl:ResourceControl ResourceName="Weblog_ReadMirroredPost" runat="server">
                        <Parameter1Template><CSBlog:WeblogPostData Property="TitleUrl" Encoding="HTML" runat="server" /></Parameter1Template>
                        <Parameter2Template><%# CommunityServer.Components.Formatter.TruncateLinkText(WeblogControlUtility.Instance().GetCurrentWeblogPost(this).TitleUrl) %></Parameter2Template>
                    </CSControl:ResourceControl>
                </ContentTemplate>
            </CSBlog:WeblogPostData>
            <CSBlog:WeblogPostSubscriptionToggleButton runat="server" Tag="Li" CssClass="navigation-item" ButtonOnCssClass="internal-link subscription-on" ButtonOffCssClass="internal-link subscription-off" ButtonProcessingCssClass="internal-link processing">
                <OnTemplate><span></span><CSControl:ResourceControl runat="server" ResourceName="Blog_PostQuestionAnswerView_StopFollowing" runat="server" /></OnTemplate>
                <OffTemplate><span></span><CSControl:ResourceControl runat="server" ResourceName="Blog_PostQuestionAnswerView_FollowThisQuestion" runat="server" /></OffTemplate>
               <ProcessingTemplate>...</ProcessingTemplate>
            </CSBlog:WeblogPostSubscriptionToggleButton>
        </ul>
        <div class="navigation-list-footer"></div>
    </div>
    <CSBlog:WeblogPostTagEditableList runat="server" Tag="Div" CssClass="post-tags" EditorCssClass="tags-editor" LinkCssClass="internal-link edit-tags" />
</div>
<div class="full-post-footer"></div>