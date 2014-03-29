<div id="specsheet">
    <% include my_carousel %>

<h2>$Title</h2>

<h1>$ShortDescription</h1>
<table width="200" border="0" cellspacing="0" cellpadding="0" id="specs">
	<tr>
		<td width="71" class="legend" scope="col">Year</td>
		<td width="129" scope="col">$Year</td>
	</tr>
	<tr>
		<td class="legend">Stock No.</td>
		<td>$StockNo</td>
	</tr>
	<tr>
		<td class="legend">Engine</td>
		<td>$Engine</td>
	</tr>
	<tr>
		<td class="legend">Trans</td>
		<td>$Trans</td>
	</tr>
	<tr>
		<td class="legend">Hours</td>
		<td>$Hours</td>
	</tr>
	<tr>
		<td class="legend">Weight</td>
		<td>$Weight</td>
	</tr>
	<tr>
		<td class="legend">Buckets</td>
		<td>$Buckets</td>
	</tr>
	<tr>
		<td class="legend">Tracks</td>
		<td>$Tracks</td>
	</tr>
	<tr>
		<td class="legend">Sprockets</td>
		<td>$Sprockets</td>
	</tr>
	<tr>
		<td class="legend">Rollers</td>
		<td>$Rollers</td>
	</tr>
	<tr>
		<td class="legend">Quick Hitch</td>
		<td>$QuickHitch</td>
	</tr>
	<tr>
		<td class="legend">Extra Plumbing</td>
		<td>$ExtraPlumbing</td>
	</tr>
	<tr>
		<td class="legend">Cab Guard</td>
		<td>$CabGuard</td>
	</tr>
	<tr>
		<td class="legend">Extras</td>
		<td>$Extras</td>
	</tr>
	<tr>
		<td class="legend">&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td class="legend"><strong>Price</strong></td>

		<td><strong>NZ$ $Price</strong></td>

	</tr>
	<tr>
		<td colspan="2" class="spacer">&nbsp;</td>
	</tr>
</table>
<br />

	<div id="rightBlockLinks">
		<div id="enquire_button">
				<input type="button" name="enquire" value="Enquire now &raquo;" onclick="showEnquiry();" class="btn_yellow_short" />
		</div>
		<div id="sendToFriendLink">

		$SendFriendLink</div>
		<div id="print_link">
			<a href="javascript:window.print()">
				<img src="$BaseHref/themes/mainline/images/printer.png" border="0" width="16" height="16" alt="Print this page" title="Print this page" />
				PRINT SPEC SHEET
			</a>
		</div>
		<div id="back_link">	
			<a href="/excavators/">
				<img src="$BaseHref/themes/mainline/images/previous.png" border="0" width="10" height="16" alt="Back to all Excavators" title="Back to all Excavators" />BACK TO EXCAVATORS
			</a>
		</div>
	</div>

	
<strong>Description</strong>

$Content

<% include ProductInquire %>
</div>