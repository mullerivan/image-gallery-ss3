<div id="specsheet">

	<script type="text/javascript">
		var imageArray = [];
		imageArray[1] = 'main';
		imageArray[2] = 'sub1';
		imageArray[3] = 'sub2';
		imageArray[4] = 'sub3';
		imageArray[5] = 'sub4';
		
		function exchangeImage (image, position) {
			var currentTop = imageArray[1];
			var currentClick = imageArray[position];
			
			imageArray[1] = currentClick;
			imageArray[position] = currentTop;
			
			var largeCurrentName = currentClick + 'large';
			var largeCurrent = document.getElementById(largeCurrentName);
			var mainImage = document.getElementById('main');
			mainImage.src = largeCurrent.src;
			
			var smallCurrentName = currentTop + 'small';
			var smallCurrent = document.getElementById(smallCurrentName);
			image.src = smallCurrent.src;							
		}
	</script>

	<div id="specimage"><img src="$MainImage.MainImage.URL" id="main" /></div>
	<table width="400" border="0" cellspacing="0" cellpadding="0" id="specthumbs">
		<tr>
			<td width="25%"><img src="$SubImage1.ProductImage.URL" id="sub1" style="cursor: pointer;" onclick="exchangeImage(this, 2);" /></td>
			<td width="25%"><img src="$SubImage2.ProductImage.URL" id="sub2" style="cursor: pointer;" onclick="exchangeImage(this, 3);" /></td>
			<td width="25%"><img src="$SubImage3.ProductImage.URL" id="sub3" style="cursor: pointer;" onclick="exchangeImage(this, 4);" /></td>
			<td width="25%"><img src="$SubImage4.ProductImage.URL" id="sub4" style="cursor: pointer;" onclick="exchangeImage(this, 5);" /></td>
		</tr>
	</table>
	
	<div style="display: none;">
		<img src="$MainImage.ProductImage.URL" id="mainsmall" />
		<img src="$MainImage.MainImage.URL" id="mainlarge" />
		<img src="$SubImage1.MainImage.URL" id="sub1large" />
		<img src="$SubImage2.MainImage.URL" id="sub2large" />
		<img src="$SubImage3.MainImage.URL" id="sub3large" />
		<img src="$SubImage4.MainImage.URL" id="sub4large" />
		<img src="$SubImage1.ProductImage.URL" id="sub1small" />
		<img src="$SubImage2.ProductImage.URL" id="sub2small" />
		<img src="$SubImage3.ProductImage.URL" id="sub3small" />
		<img src="$SubImage4.ProductImage.URL" id="sub4small" />
	</div>
	
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

			<td class="legend">Size</td>
			<td>$Size</td>

		</tr>
		<tr>
			<td class="legend">Hours</td>
			<td>$Hours</td>
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

			<td class="legend">Aux Piping</td>
			<td>$AuxPiping</td>
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

	<strong>Description</strong>

	$Content
	</div>
	<br />
	<input type="button" name="enquire" value="Enquire now &raquo;" onclick="showEnquiry();" class="btn_yellow" /><br /><br />


<div id="enquiry" style="display: none;"><a name="enquire" id="enquire"></a>

	<small class="fright">*required fields&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small>
	<h3>Enquiry</h3>
<!--	<label>Name*</label><input name="name" type="text" class="txtfield w250" /><br /><br />
	<label>Email*</label><input name="email" type="text" class="txtfield w250" /><br /><br />
	<label>Phone*</label><input name="phone" type="text" class="txtfield w250" /><br /><br />

	<label>Comments / Questions</label><textarea name="comment" cols="" rows="3" class="txtfield w250"></textarea><br /><br />
	<label>&nbsp;</label><input name="submit" type="button" value="Submit enquiry &raquo;" />-->
	$ProductInquireForm
</div>
