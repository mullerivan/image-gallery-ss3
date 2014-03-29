<div id="specsheet">

	<script type="text/javascript">
		var clicked = false;
		var currentAutoPosition = 2;

		var autoExchangeArray = new Array()
		autoExchangeArray[2] = "sub1";
		autoExchangeArray[3] = "sub2";
		autoExchangeArray[4] = "sub3";
		autoExchangeArray[5] = "sub4";

		var imageArray = [];
		imageArray[1] = 'main';
		imageArray[2] = 'sub1';
		imageArray[3] = 'sub2';
		imageArray[4] = 'sub3';
		imageArray[5] = 'sub4';

		function exchangeImage (image, position) {
			exchangeImageHelp (image, position);
			clicked = true;
		}

		function exchangeImageHelp (image, position) {
			var currentTop = imageArray[1];
			var currentClick = imageArray[position];

			imageArray[1] = currentClick;
			imageArray[position] = currentTop;

			var largeCurrentName = currentClick + 'large';
			var largeCurrent = document.getElementById(largeCurrentName);
			var mainImage = document.getElementById('main');
			mainImage.src = largeCurrent.src;
			var mainImageLink = document.getElementById('linkToMain');
			mainImageLink.href = largeCurrent.src;

			var smallCurrentName = currentTop + 'small';
			var smallCurrent = document.getElementById(smallCurrentName);
			image.src = smallCurrent.src;
		}

		function autoExchange() {
			if (clicked) return;

			var p1 = currentAutoPosition;
			var p2 = autoExchangeArray[p1];
			var p2Obj = document.getElementById(p2);

			//alert(p2Obj.src);

			if (ifElementContains(p2Obj.src, 'assets')) exchangeImageHelp (p2Obj, p1);

			if (currentAutoPosition<5) currentAutoPosition++;
			else currentAutoPosition = 2;
		}

		function ifElementContains(eid, value) {
			var vapp= (eid.charCodeAt ? document.getElementById(eid) : eid ) || eid;
			var val = vapp.value || vapp.innerHTML || window[vapp] || vapp;
			return !! val.match(value);
		}

		function array_search (needle, haystack, argStrict) {
			// Searches the array for a given value and returns the corresponding key if successful  
			// 
			// version: 1004.1212
			// discuss at: http://phpjs.org/functions/array_search    // +   original by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
			// +      input by: Brett Zamir (http://brett-zamir.me)
			// +   bugfixed by: Kevin van Zonneveld (http://kevin.vanzonneveld.net)
			// *     example 1: array_search('zonneveld', {firstname: 'kevin', middle: 'van', surname: 'zonneveld'});
			// *     returns 1: 'surname' 
			var strict = !!argStrict;
			var key = '';

			for (key in haystack) {
				if ((strict && haystack[key] === needle) || (!strict && haystack[key] == needle)) {
					return key;
				}

				if (basename(haystack[key][0]) === basename(needle)) {
					return true;	
				}
			}
			return false;
		}

		$(function() {
			// show form when error has occured (and hide when there is no error)
			var errorFound =  document.getElementById("Form_ProductInquireForm_error");
			errorFound = errorFound.innerHTML;

			var requiredFieldsFound = document.getElementsByName("required");
			if (!errorFound && requiredFieldsFound.length<1) {
				var inquiryForm = document.getElementById('enquiry');
				inquiryForm.style.display = 'none';
			}
			else {
				window.location.hash="enquire";
			}

			$('#specimage a').lightBox({fixedNavigation:true}); // Select all links in object with specimage ID
			//$('#hiddenImages a').lightBox({fixedNavigation:true}); // Select all links in object with specimage ID

		});


		setInterval ('autoExchange()', 2000);
	</script>

	<div id="right_block">
		<div id="specimage"> <a href="$MainImage.MainImage.URL" id="linkToMain"> <img src="$MainImage.MainImage.URL" id="main" width="400"/> </a> 
			<p style="text-align: center; width: 100%; color: #9F9995;">click to enlarge</p>

			<div style="display: none;" id="hiddenImages">
				<img src="$MainImage.ProductImage.URL" id="mainsmall" />
				<a href="$MainImage.MainImage.URL"><img src="$MainImage.MainImage.URL" id="mainlarge" /></a>
				<a href="$SubImage1.MainImage.URL"><img src="$SubImage1.MainImage.URL" id="sub1large" /></a>
				<a href="$SubImage2.MainImage.URL"><img src="$SubImage2.MainImage.URL" id="sub2large" /></a>
				<a href="$SubImage3.MainImage.URL"><img src="$SubImage3.MainImage.URL" id="sub3large" /></a>
				<a href="$SubImage4.MainImage.URL"><img src="$SubImage4.MainImage.URL" id="sub4large" /></a>
				<img src="$SubImage1.ProductImage.URL" id="sub1small" />
				<img src="$SubImage2.ProductImage.URL" id="sub2small" />
				<img src="$SubImage3.ProductImage.URL" id="sub3small" />
				<img src="$SubImage4.ProductImage.URL" id="sub4small" />
			</div>		
		</div>

		<table width="400" border="0" cellspacing="0" cellpadding="0" id="specthumbs">
			<tr>
				<td width="25%"><img src="$SubImage1.ProductImage.URL" id="sub1" style="cursor: pointer;" onclick="exchangeImage(this, 2);" /></td>
				<td width="25%"><img src="$SubImage2.ProductImage.URL" id="sub2" style="cursor: pointer;" onclick="exchangeImage(this, 3);" /></td>
				<td width="25%"><img src="$SubImage3.ProductImage.URL" id="sub3" style="cursor: pointer;" onclick="exchangeImage(this, 4);" /></td>
				<td width="25%"><img src="$SubImage4.ProductImage.URL" id="sub4" style="cursor: pointer;" onclick="exchangeImage(this, 5);" /></td>
			</tr>
		</table>
		<div id="print_link"><A HREF="javascript:window.print()">
				<img src="$BaseHref/themes/mainline/images/print_icon.jpg" border="0" width="63" height="58" alt="Print this page" title="Print this page"><br />
				Click here to Print This Page</A></div>
		<a href="/trucks/" id="backLink">« BACK TO ALL TRUCKS</a>
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

	<strong>Description</strong>

	$Content

	<br />
	<input type="button" name="enquire" value="Enquire now &raquo;" onclick="showEnquiry();" class="btn_yellow" /><br />
</div>

<div id="enquiry" ><a name="enquire" id="enquire"></a>

	<small class="fright">*required fields&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</small>
	<h3>Enquiry</h3>
	<!--	<label>Name*</label><input name="name" type="text" class="txtfield w250" /><br /><br />
	<label>Email*</label><input name="email" type="text" class="txtfield w250" /><br /><br />
	<label>Phone*</label><input name="phone" type="text" class="txtfield w250" /><br /><br />

	<label>Comments / Questions</label><textarea name="comment" cols="" rows="3" class="txtfield w250"></textarea><br /><br />
	<label>&nbsp;</label><input name="submit" type="button" value="Submit enquiry &raquo;" />-->
	$ProductInquireForm
</div>
