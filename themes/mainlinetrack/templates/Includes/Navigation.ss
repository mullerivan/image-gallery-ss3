<ul>
	<% control ChildrenOf(categorymenu) %>	 		
		<li class="$LinkingMode"><a href="$Link" title="Go to the $Title page">$MenuTitle</a>
			<% if Children %>
			<ul class="level2">
				<% control Children %>
					<li class="$LinkingMode"><a href="$Link" title="Go to the $Title page">$MenuTitle</a></li>
				<% end_control %>
			</ul>
			<% end_if %>
		</li>		
	<% end_control %>
</ul>
