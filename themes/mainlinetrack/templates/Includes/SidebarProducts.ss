<% if $Menu(3) %>
	<h5>Used Equipment In Stock</h5>
	<ul class="productsMenu">
		<% loop $Menu(3) %>
			<li><a href="$Link" title="Go to the $Title page" <%--class="$LinkingMode"--%> >$MenuTitle</a></li>
		<% end_loop %>
	</ul> 
<% end_if %>
