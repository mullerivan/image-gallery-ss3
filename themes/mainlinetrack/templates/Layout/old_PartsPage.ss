<div id="specsheet">
    <div class="nocollapse">
        <div class="col-1-2">
            <h2>$Title</h2>

            <h1>$ShortDescription</h1>
            <table width="200" border="0" cellspacing="0" cellpadding="0" id="specs">
                <tr>
                    <td width="71" class="legend" scope="col">Stock No.</td>
                    <td width="129" scope="col">$StockNo</td>
                </tr>
                <tr>
                    <td class="legend">Size</td>
                    <td>$Size</td>
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
        </div>
        <div class="col-1-2 specsheet_track">
            <% include my_carousel %>
        </div>
    </div>


    <div id="rightBlockLinks">
        <div id="enquire_button">
            <input type="button" name="enquire" value="Enquire now &raquo;" onclick="showEnquiry();"
                   class="btn_yellow_short"/>
        </div>
        <%--<div id="sendToFriendLink">--%>
        <%--$SendFriendLink</div>--%>
        <div id="print_link">
            <a href="javascript:window.print()">
                <img src="$BaseHref/themes/mainlinetrack/images/printer.png" border="0" width="16" height="16"
                     alt="Print this page" title="Print this page"/>
                PRINT SPEC SHEET
            </a>
        </div>
        <div id="back_link">
            <a href="/excavators/">
                <img src="$BaseHref/themes/mainlinetrack/images/previous.png" border="0" width="10" height="16"
                     alt="Back to all Excavators" title="Back to all Excavators"/>BACK TO PARTS STOCKLIST
            </a>
        </div>
    </div>

    <strong>Description</strong>
    $Content

    <div id="enquiry" style="display:none;"><a name="enquire" id="enquire"></a>
        <small class="fright">*required fields</small>
        <h3>Enquiry</h3>
        $ProductInquireForm
    </div>
</div>