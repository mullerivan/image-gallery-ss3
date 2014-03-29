<%-- Check if PageID 2 (Used Equipment) has sub pages --%>
<% if $ChildrenOf(2) %>
	<h4>Used Equipment</h4>
	<div id="navigation">
		<ul class="usedEquipment">
			<% loop $ChildrenOf('used-equipment-sale') %>
				<li><a class="$LinkingMode" href="$Link">$MenuTitle</a></li>
			<% end_loop %>
		</ul>
	</div>
<% end_if %>
