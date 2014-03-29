<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<% base_tag %>
		<title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; Mainline Commercial &amp; Industrial Ltd</title>
		$MetaTags(false)
		<link rel="shortcut icon" href="/favicon.ico" />


		<!--[if IE 6]>
		<style type="text/css">
		@import url(themes/mainline/css/ie6.css);
		</style> 
		<![endif]-->

		<!--[if IE 7]>
		<style type="text/css">
		@import url(themes/mainline/css/ie7.css);
		</style> 
		<![endif]-->		



		<script type="text/javascript">
			<!--//--><![CDATA[//><!--
			sfHover = function() {
				var sfULs = document.getElementById("tab").getElementsByTagName("ul");
				for (var i=0; i<sfULs.length; i++) {
					if (sfULs[i].className=="level2") {
						sfULs[i].onmouseover=function() {
							this.className = "sfhover";
						}
						sfULs[i].onmouseout=function() {
							this.className = this.className.replace(new RegExp(" sfhover"), "");
						}						
					}
				}
			}
			if (window.attachEvent) window.attachEvent("onload", sfHover);
			//--><!]]>

			function showEnquiry() {
				document.getElementById("enquiry").style.display = '';
				window.location.hash="enquire"; 
			}
		</script>	

		<style type="text/css">
			body, html { background:#f3f3f3 url($BaseHref/themes/mainline/images/mainline_bodybg.gif) no-repeat top left; }
			#tabs { background:#3d3938 url($BaseHref/themes/mainline/images/mainline_tab_bg.jpg) repeat-x top; }
			#tab li a.current, #tab li a:hover { background:#ffc104 url($BaseHref/themes/mainline/images/mainline_tabactive_bg.jpg); }
			#tab li a.current { color:#000; }
			#tab li li a.current { color:#000;} 			
			#navigation ul li a { background: url($BaseHref/themes/mainline/images/mainline_navgb.jpg) repeat-x center right; }
			#prevLink:hover, #prevLink:visited:hover { background: url($BaseHref/themes/mainline/images/prevlabel.gif) left 15% no-repeat; }
			#nextLink:hover, #nextLink:visited:hover { background: url($BaseHref/themes/mainline/images/nextlabel.gif) right 15% no-repeat; }
			#footerNavigation { background:#3d3938 url($BaseHref/themes/mainline/images/mainline_tab_bg.jpg) repeat-x top; clear: both; height: 25px; line-height: 25px; margin: 0 auto; text-align: center; width: 900px; }
				#footerNavigation ul li   { float: left; padding:0 0 0 13px; }
					#footerNavigation ul li:after { content: "|"; color:#666; padding-left:13px; }
					#footerNavigation ul li:last-child:after { content: ""; padding-left:0;}
				#footerNavigation ul li a { text-decoration:none; color:#f0f0f0; }
				#footerNavigation ul li a:hover { text-decoration:underline; color:#FEDD2E; }
				#phone { width:250px; height:25px; z-index:100; position:relative; top:-25px; left:160px; color:#888; font-size:15px; }
				#phone a { text-decoration:none; color:#888; }
			
		</style>		
	</head>

	<body>
		<div id="header">
			<div id="tagline">
				<img src="$BaseHref/themes/mainline/images/mainline_excavator.jpg" height="105" alt="Nelson Excavators &amp; Trucks" style="clear:right" border="0"  usemap="#Map" />
				<map name="Map" id="Map">
					<area shape="rect" coords="1,1,150,100" href="http://www.mainlinecommercials.co.nz/excavators-for-sale/" alt="Excavators for Sale" />
					<area shape="rect" coords="150,1,309,100" href="http://www.mainlinecommercials.co.nz/trucks-for-sale/" alt="Trucks for Sale" />
				</map>
			</div>
			<div style="float: right; padding: 15px;" id="print_contact_info" class="print_contact_info">Freephone: 0800 551 201<br />Fax: 03 541 0787<br />Email: sales@mainlinecom.co.nz<br />website: http://www.mainlinecommercials.co.nz</div>
			<div id="logo"><a href="http://www.mainlinecommercials.co.nz"><img src="$BaseHref/themes/mainline/images/mainline_logo.jpg" width="426" height="105" alt="Mainline Commercial &amp; Industrial - Excavators &amp; Trucks, Richmond / Nelson" /></a></div>
			<div id="phone">NZ Freephone: <a href="tel:0800551201"><strong>$CompanyTagline</strong></a></div>
		</div>

		<div id="tabs">
			<% include TopNavigation %>
		</div>

		<div id="container">
			<div id="sidebar">
				<h2><a href="http://www.mainlinetrack.co.nz"><img class="center" src="$BaseHref/themes/mainline/images/btn_mainline-track.png" alt="Go to Mainline Track Website" title="Go to Mainline Track Website" width="160" height="56" border="0"/></a><br /></h2>
				<div id="quicksearch">
					$SearchForm
				</div>

				<div id="bookmark">
					<a href="javascript:Bookmark()" title="Add Page to bookmarks">
						<img src="assets/Buttons/bookmark.jpg" />
							<span id="bookmarklink"> Add page to Bookmarks</span>
					</a>
				</div>

				<h2><a href="photo-gallery/"><img class="center" src="assets/Buttons/photo-gallery.jpg" alt="Link to Photo Gallery" title="Link to Photo Gallery" width="160" height="70" /></a><br /></h2>

				<div id="newsletter">
					<h4 style="margin: 10px 0 0 10px;">Get Our Newsletter</h4>
					<%-- $Newsletter // Function in Page.php --%>
					<% include Subscription %>
				</div>
				
				<div id="navigation">
					<% include Navigation %>
				</div>
				<br clear="all" />
                <% if $SidebarContent %>
                    $SidebarContent
                <% else %>
                    <%  loop $Parent %>
                        $SidebarContent
                    <%  end_loop %>
                <% end_if %>

                <br clear="all" />
			</div>

			<div id="content">
				$Layout
			</div>
			<br clear="all" />
		</div>
		
		<div id="footerNavigation">
			<% include FooterNavigation %>
		</div>
		
		<div id="footercontainer">
			<div id="footer">
				<div id="footerLeft">
					<strong>&copy; Mainline Commercial &amp; Industrial LTD</strong> &#183; Trucks &amp; Earthmoving Machinery &#183; Richmond &#183; Nelson &#183; NZ<br />
					<a href="http://www.mainlinecommercials.co.nz/links/">Links</a>
				</div>
				<div id="ftright"><strong>NZ Freephone&#58; 0800 551 201<br />Phone&#58; 03 543 9030</strong></div>
			</div>
		</div>
		
		<div class="print_disclaimer" id="print_disclaimer">
		  <img src="$BaseHref/themes/mainline/images/disclaimer.jpg" alt="disclaimer" />
		</div>
		
		<script type="text/javascript">
			var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
			document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
		</script>
		<script type="text/javascript">
			try {
				var pageTracker = _gat._getTracker("UA-11007070-1");
				pageTracker._trackPageview();
		} catch(err) {}</script>
	</body>
</html>

