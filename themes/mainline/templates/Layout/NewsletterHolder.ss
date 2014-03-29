<div id="newsOverview" class="typography">    
    $Content
    <div>
        <%-- control Children --%>
		<% control Newsletters %>
            <div class="newsItem">
                <div class="newsTitle"><a href="$Link" title="Read more on &quot;{$Title}&quot;">$Title</a></div>
                <div class="newsDate">$NewsletterDate.Nice</div>
                <div class="newsSummary">$Content.FirstParagraph <a href="$Link" title="Read more on &quot;{$Title}&quot;">Read more &gt;&gt;</a></div>
            </div>
        <% end_control %>
		
		<%-- Pagination --%>
		<% if Newsletters.MoreThanOnePage %>
		  <p>
		  <% if Newsletters.PrevLink %>
			<a href="$Newsletters.PrevLink">&lt;&lt; Prev</a> | 
		  <% end_if %>
		 
		  <% control Newsletters.Pages %>
			<% if CurrentBool %>
			  <strong>$PageNum</strong> 
			<% else %>
			  <a href="$Link" title="Go to page $PageNum">$PageNum</a> 
			<% end_if %>
		  <% end_control %>
		 
		  <% if Newsletters.NextLink %>
			| <a href="$Newsletters.NextLink">Next &gt;&gt;</a>
		  <% end_if %>
		  </p>
		<% end_if %>
    </div>
</div>