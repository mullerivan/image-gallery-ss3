<% if $Level(2) %>
    <div class="breadcrumbs">
        $Breadcrumbs
    </div>
<% end_if %>
<div id="specsheet">

    <% include my_carousel %>
</div>

<h2 style="width: 260px;">$Title</h2>

<h1 style="width: 260px;">$ShortDescription</h1>
<table width="260" border="0" cellspacing="0" cellpadding="0" id="specs">
	<tr>
		<td width="71" class="legend" scope="col">Year</td>
		<td width="129" scope="col">$Year</td>
	</tr>
	<tr>
		<td class="legend">Stock No.</td>
		<td>$StockNo</td>
	</tr>
	<tr>
		<td class="legend">Reg Exp</td>
		<td>$RegExp</td>
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
		<td class="legend">R/Axle</td>
		<td>$RAxle</td>
	</tr>
	<tr>
		<td class="legend">T/Gear</td>
		<td>$TGear</td>
	</tr>
	<tr>
		<td class="legend">Speedo</td>
		<td>$Speedo</td>
	</tr>
	<tr>
		<td class="legend">GVM</td>
		<td>$GVM</td>
	</tr>
	<tr>
		<td class="legend">GCM</td>
		<td>$GCM</td>
	</tr>
	<tr>
		<td class="legend">Tare</td>
		<td>$Tare</td>
	</tr>
	<tr>
		<td class="legend">Payload</td>
		<td>$Payload</td>
	</tr>
	<tr>
		<td class="legend">COF Exp</td>
		<td>$COFExp</td>
	</tr>
	<tr>
		<td class="legend">Radio</td>
		<td>$Radio</td>
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
		<a href="/trucks/">
			<img src="$BaseHref/themes/mainline/images/previous.png" border="0" width="10" height="16" alt="Back to all Excavators" title="Back to all Trucks" />BACK TO TRUCK STOCKLIST
		</a>
	</div>
</div>

<strong>Description</strong>

$Content

<% include ProductInquire %>
