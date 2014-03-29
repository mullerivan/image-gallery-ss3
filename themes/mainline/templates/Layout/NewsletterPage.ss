<div id="newsPage" class="typography">
	<div id="pageFunctions"><a href="javascript:window.print();" rel="nofollow"><img src="$BaseHref/themes/mainline/images/ico_print.png" alt="Print this page" title="Print this page" border="0" /></a>&nbsp;&nbsp;<a href="mailto:?subject=Interesting%20Mainline%20Commercial%20Newsletter&body=This%20Mainline%20Commercial%20newsletter%20might%20interest%20you:%20%0A{$BaseHref}$URLSegment"><img src="$BaseHref/themes/mainline/images/ico_email.png" alt="Email link to this page" title="Email link to this page" border="0" /></a></div>
	<% if Level(2) %>
        <div class="breadcrumbs">
            $Breadcrumbs
        </div>
    <% end_if %>
             
    <h1>$Title</h1>
    $Content
    <div class="newsFooter">
        Posted on $NewsletterDate.Nice by $NewsletterAuthor
    </div>
</div>