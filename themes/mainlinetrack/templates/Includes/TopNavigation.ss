 <ul id="tab">
	<% loop $Menu(1) %>
		<li><a href="$Link" title="Go to the $Title page" class="$LinkingMode">$MenuTitle</a>
			<% if $Children %>
			<ul class="level2">
				<% loop $Children %>
					<li><a href="$Link" title="Go to the $Title page" class="$LinkingMode">$MenuTitle</a>
					</li>
				<% end_loop %>
			</ul>
			<% end_if %>
		</li>
	<% end_loop %>
</ul>