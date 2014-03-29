
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<html>
<head>
    <% base_tag %>
    <title><% if MetaTitle %>$MetaTitle<% else %>$Title<% end_if %></title>
    $MetaTags(false)
    <link rel="shortcut icon" href="/favicon.ico"/>

</head>

<body>
<div id="header">
    <div id="tagline"><img src="$BaseHref/themes/mainlinetrack/images/mainline_tracks_headphotos.jpg"
                           alt="Mainline track - Rubber Track specialists" style="clear:right"/></div>
    <div id="logo"><a href="http://www.mainlinetrack.co.nz"><img
            src="$BaseHref/themes/mainlinetrack/images/mainlinetrack_logo.jpg" width="426" height="105"
            alt="Mainline Track - Rubber Track specialists, Richmond / Nelson"/></a></div>
    <div id="phone">NZ Freephone: <a href="tel:0800551201"><strong>$CompanyTagline</strong></a></div>
</div>
<div id="submenu">
    <% include SubMenu %>
</div>
<div id="RTnavigation">
    <% include Navigation %>
</div>

<div id="printHeader">
    <img src="/themes/mainlinetrack/images/MainlineTrackLogoSmall.JPG" border="0"/>

    <h2>NZ Freephone: 0800 551 201</h2>

    <h2>Phone: 03 543 9030</h2>

    <h2>Fax: 03 541 0787</h2>

    <h2>Email: rubbertrack@mainlinecom.co.nz</h2>

    <h2>Website: http://www.mainlinetrack.co.nz</h2>
</div>

<div id="container">
    <div id="sidebar">


        <h2><a href="http://www.mainlinecommercials.co.nz"><img class="center"
                                                          src="$BaseHref/themes/mainlinetrack/images/btn_mainline-commercials.png"
                                                          alt="Go to Mainline Commercials Website"
                                                          title="Go to Mainline Commercials Website" width="160"
                                                          height="56" border="0"/></a></h2>

        <div id="newsletter">
            <h4 style="margin: 10px 0 0 10px;">Get Our Newsletter</h4>
            <% include Subscription %>
        </div>
        <%--BOOKMARK--%>
        <div id="bookmark">
            <a id="bookmarkme" href="#" rel="sidebar" title="bookmark this page">
                <img src="assets/Buttons/bookmark.jpg"/>
                <span id="bookmarklink"> Add page to Bookmarks</span>
            </a>
        </div>

        <div class="sidebar-content">
            <% if $SidebarContent %>
                $SidebarContent
            <% else %>
                <%  loop $Parent %>
                    $SidebarContent
                <%  end_loop %>
            <% end_if %>
        </div>
    </div>
    <div id="content">
        $Layout
    </div>
    <br clear="all"/>
</div>
<div id="footerNavigation">
    <% include FooterNavigation %>
</div>
<div id="footercontainer">
    <div id="footer">
        <div id="footerLeft">
            <strong>&copy; Mainline Track</strong> &middot; Rubber Tracks, Excavator Buckets &amp; Undercarriage
            <p>Parts &middot; Richmond &middot; Nelson &middot; NZ</p>
        </div>
    </div>
</div>
</body>
</html>

