<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeFile="updateContacts.aspx.cs" Inherits="Modules_updateContacts" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/styles.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-12">
            <h1 class="myHeadingStyle">Data Grooming in SQL Server</h1>
            <hr />

            <p class="p-indent ">by Daniel Cassin</p>
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <p class="p-indent">
                I was recently faced with the task of cleaning up an existing contacts database table containing over 300,000 records.
                    The problem was that the current database had contact and customer tables with multiple phone numbers
                entered randomly in various phone number fields (home, work, mobile, fax, etc).
            </p>
            <p class="p-indent">
                The challenge was to go through
                the table (over 300,000 contacts in this case) and attempt to put the various phone types in the correct fields.  This sample is for the contacts table.  I did a
                similar stored procedure for customers.  
            </p>
            <hr />
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
            </div>
            <div class="code">
                <span class="ReservedKeyword">USE</span>&nbsp;[cdb&nbsp;]<br />
                GO<br />
                <br />
                <span class="BlockComment">/******&nbsp;Object:&nbsp;&nbsp;StoredProcedure&nbsp;[dbo].[UpdateContactPhoneRecords1]&nbsp;&nbsp;&nbsp;&nbsp;Script&nbsp;Date:&nbsp;2/7/2016&nbsp;1:23:29&nbsp;PM&nbsp;******/</span><br />
                <span class="ReservedKeyword">SET</span>&nbsp;<span class="ReservedKeyword">ANSI_NULLS</span>&nbsp;<span class="ReservedKeyword">ON</span><br />
                GO<br />
                <br />
                <span class="ReservedKeyword">SET</span>&nbsp;<span class="ReservedKeyword">QUOTED_IDENTIFIER</span>&nbsp;<span class="ReservedKeyword">ON</span><br />
                GO<br />
                <br />
                <span class="InlineComment">--&nbsp;Batch&nbsp;submitted&nbsp;through&nbsp;debugger:&nbsp;SQLQuery7.sql|9|0|C:\Users\Daniel\AppData\Local\Temp\~vs1F90.sql</span><br />
                <br />
                <span class="InlineComment">--&nbsp;=============================================</span><br />
                <span class="InlineComment">--&nbsp;Author:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Daniel&nbsp;Cassin</span><br />
                <span class="InlineComment">--&nbsp;Create&nbsp;date:&nbsp;14-Aug-2015</span><br />
                <span class="InlineComment">--&nbsp;Description:&nbsp;&nbsp;&nbsp;&nbsp;'Clean&nbsp;up'&nbsp;the&nbsp;contact&nbsp;table&nbsp;by</span><br />
                <span class="InlineComment">--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;putting&nbsp;phone&nbsp;records&nbsp;where&nbsp;they&nbsp;</span><br />
                <span class="InlineComment">--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;are&nbsp;supposed&nbsp;to&nbsp;be</span><br />
                <span class="InlineComment">--&nbsp;=============================================</span><br />
                <br />
                <span class="ReservedKeyword">alter</span>&nbsp;<span class="ReservedKeyword">procedure</span>&nbsp;[dbo].[UpdateContactPhoneRecords1]<br />
                <span class="ReservedKeyword">as</span><br />
                <span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;<span class="ReservedKeyword">nocount</span>&nbsp;<span class="ReservedKeyword">on</span>;<br />
                <br />
                <span class="ReservedKeyword">declare</span>&nbsp;@contactId&nbsp;<span class="DataType">int;</span><br />
                <span class="ReservedKeyword">declare</span>&nbsp;@phone&nbsp;<span class="DataType">varchar</span>(255);<br />
                <span class="ReservedKeyword">declare</span>&nbsp;@phone1&nbsp;<span class="DataType">varchar</span>(255);<br />
                <span class="ReservedKeyword">declare</span>&nbsp;@phone2&nbsp;<span class="DataType">varchar</span>(255);<br />
                <span class="ReservedKeyword">declare</span>&nbsp;@phonename1&nbsp;<span class="DataType">varchar</span>(255);<br />
                <span class="ReservedKeyword">declare</span>&nbsp;@phonename2&nbsp;<span class="DataType">varchar</span>(255);<br />
                <span class="ReservedKeyword">declare</span>&nbsp;@fax&nbsp;<span class="DataType">varchar</span>(255);<br />
                <span class="ReservedKeyword">declare</span>&nbsp;@otherphone&nbsp;<span class="DataType">varchar</span>(255);<br />
                <span class="ReservedKeyword">declare</span>&nbsp;@firstPhone&nbsp;<span class="DataType">varchar</span>(255);<br />
                <span class="ReservedKeyword">declare</span>&nbsp;@secondPhone&nbsp;<span class="DataType">varchar</span>(255);<br />
                <span class="ReservedKeyword">declare</span>&nbsp;@recordcount&nbsp;<span class="DataType">int</span>,&nbsp;@rowcount&nbsp;<span class="DataType">int</span><br />
                <br />
                <span class="InlineComment">--&nbsp;get&nbsp;work&nbsp;phones&nbsp;---</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#WorkPhone(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone2&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename2&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#WorkPhone(contactid,&nbsp;phone,&nbsp;phone1,&nbsp;phone2,&nbsp;phonename1,&nbsp;phonename2)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone,&nbsp;phone1,&nbsp;phone2,&nbsp;phonename1,&nbsp;phonename2&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;(phone1&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">or</span>&nbsp;phone1&nbsp;=<span class="String">''</span>)<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">select</span>&nbsp;@contactid&nbsp;=&nbsp;contactid,&nbsp;@phone&nbsp;=&nbsp;phone,&nbsp;@phone1&nbsp;=&nbsp;phone1,&nbsp;@phonename1&nbsp;=&nbsp;phonename1,&nbsp;@phonename2&nbsp;=&nbsp;phonename2,&nbsp;@phone2&nbsp;=&nbsp;phone2<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">from</span>&nbsp;#WorkPhone<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">where</span>&nbsp;rowid&nbsp;=&nbsp;@rowcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;(@phonename1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%work%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%wk%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%business%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%office%'</span>)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Operator">and</span>&nbsp;@phone1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phone&nbsp;=&nbsp;@phone1,&nbsp;phone1&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;phonename1&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;mobile&nbsp;phone&nbsp;to&nbsp;work&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;(@phonename2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%work%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%wk%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%business%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%office%'</span>)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Operator">and</span>&nbsp;@phone2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phone&nbsp;=&nbsp;@phone2,&nbsp;phonename2&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;phone2&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;home&nbsp;phone&nbsp;to&nbsp;work&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#WorkPhone<br />
                <span class="InlineComment">--&nbsp;end&nbsp;work&nbsp;phones&nbsp;---</span><br />
                <br />
                <span class="InlineComment">--&nbsp;get&nbsp;phone1&nbsp;phones&nbsp;----</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Phone1(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone2&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename2&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#Phone1(contactid,&nbsp;phone1,&nbsp;phone2,&nbsp;phonename1,&nbsp;phonename2)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone1,&nbsp;phone2,&nbsp;phonename1,&nbsp;phonename2&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;(phone1&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">or</span>&nbsp;phone1&nbsp;=<span class="String">''</span>)<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">select</span>&nbsp;@contactid&nbsp;=&nbsp;contactid,&nbsp;@phone1&nbsp;=&nbsp;phone1,&nbsp;@phonename1&nbsp;=&nbsp;phonename1,&nbsp;@phonename2&nbsp;=&nbsp;phonename2,&nbsp;@phone2&nbsp;=&nbsp;phone2<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">from</span>&nbsp;#Phone1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">where</span>&nbsp;rowid&nbsp;=&nbsp;@rowcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;(@phonename2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%mob%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%cell%'</span>)&nbsp;<span class="Operator">and</span>&nbsp;@phone2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phone1&nbsp;=&nbsp;@phone2,&nbsp;phonename1&nbsp;=&nbsp;<span class="String">'Mobile'</span>,&nbsp;phone2&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;phonename2&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;home&nbsp;phone&nbsp;to&nbsp;mobile&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Phone1<br />
                <span class="InlineComment">--&nbsp;end&nbsp;phone1</span><br />
                <br />
                <span class="InlineComment">--&nbsp;get&nbsp;phone2&nbsp;phones&nbsp;---&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Phone2(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone2&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename2&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#Phone2(contactid,&nbsp;phone1,&nbsp;phone2,&nbsp;phonename1,&nbsp;phonename2)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone1,&nbsp;phone2,&nbsp;phonename1,&nbsp;phonename2&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;(phone2&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">or</span>&nbsp;phone2&nbsp;=<span class="String">''</span>)<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">select</span>&nbsp;@contactid&nbsp;=&nbsp;contactid,&nbsp;@phone1&nbsp;=&nbsp;phone1,&nbsp;@phonename1&nbsp;=&nbsp;phonename1,&nbsp;@phonename2&nbsp;=&nbsp;phonename2,&nbsp;@phone2&nbsp;=&nbsp;phone2<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">from</span>&nbsp;#Phone2<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">where</span>&nbsp;rowid&nbsp;=&nbsp;@rowcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;(@phonename1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%home%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%hm%'</span>)&nbsp;<span class="Operator">and</span>&nbsp;@phone1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phone2&nbsp;=&nbsp;@phone1,&nbsp;phonename2&nbsp;=&nbsp;<span class="String">'Home'</span>,&nbsp;phone1&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;phonename1&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;mobile&nbsp;phone&nbsp;to&nbsp;home&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Phone2<br />
                <span class="InlineComment">--&nbsp;end&nbsp;get&nbsp;phone2&nbsp;phones&nbsp;---</span><br />
                <br />
                <span class="InlineComment">--get&nbsp;fax&nbsp;phones&nbsp;---</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Fax(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone2&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename2&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;fax&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#Fax(contactid,&nbsp;phone1,&nbsp;phone2,&nbsp;phonename1,&nbsp;phonename2,&nbsp;fax)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone1,&nbsp;phone2,&nbsp;phonename1,&nbsp;phonename2,&nbsp;fax&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;(fax&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">or</span>&nbsp;fax&nbsp;=<span class="String">''</span>)<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">select</span>&nbsp;@contactid&nbsp;=&nbsp;contactid,&nbsp;@phone1&nbsp;=&nbsp;phone1,&nbsp;@phonename1&nbsp;=&nbsp;phonename1,&nbsp;@phonename2&nbsp;=&nbsp;phonename2,&nbsp;@phone2&nbsp;=&nbsp;phone2,&nbsp;@fax&nbsp;=&nbsp;fax<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">from</span>&nbsp;#Fax<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">where</span>&nbsp;rowid&nbsp;=&nbsp;@rowcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;@phonename1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%fax%'</span>&nbsp;<span class="Operator">and</span>&nbsp;@phone1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;fax&nbsp;=&nbsp;@phone1&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;mobile&nbsp;phone&nbsp;to&nbsp;fax&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;@phonename2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%fax%'</span>&nbsp;<span class="Operator">and</span>&nbsp;@phone2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;fax&nbsp;=&nbsp;@phone2&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;home&nbsp;phone&nbsp;to&nbsp;fax&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Fax<br />
                <span class="InlineComment">--&nbsp;end&nbsp;get&nbsp;fax&nbsp;phones&nbsp;---</span><br />
                <br />
                <span class="InlineComment">--&nbsp;get&nbsp;mobile&nbsp;phones&nbsp;---</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Mobile(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;otherphone&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#Mobile(contactid,&nbsp;phone1,&nbsp;phonename1,&nbsp;otherphone)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone1,&nbsp;phonename1,&nbsp;otherphone&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;phonename1&nbsp;<span class="Operator">not</span>&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%mob%'</span>&nbsp;<span class="Operator">and</span>&nbsp;phonename1&nbsp;<span class="Operator">not</span>&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%cell%'</span>&nbsp;<br />
                <span class="Operator">and</span>&nbsp;phone1&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">not</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">and</span>&nbsp;phone1&nbsp;!=<span class="String">''</span>;&nbsp;<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">select</span>&nbsp;@contactid&nbsp;=&nbsp;contactid,&nbsp;@phone1&nbsp;=&nbsp;phone1,&nbsp;@phonename1&nbsp;=&nbsp;phonename1,&nbsp;@otherphone&nbsp;=&nbsp;otherphone&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">from</span>&nbsp;#Mobile<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">where</span>&nbsp;rowid&nbsp;=&nbsp;@rowcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;@otherphone&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">or</span>&nbsp;@otherphone&nbsp;=&nbsp;<span class="String">''</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;otherphone&nbsp;=&nbsp;phone1,&nbsp;phone1&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;phonename1&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;mobile&nbsp;phone&nbsp;to&nbsp;other&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">else</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;mobile&nbsp;phone&nbsp;to&nbsp;notes'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span>&nbsp;<br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Mobile<br />
                <span class="InlineComment">--&nbsp;end&nbsp;get&nbsp;mobile&nbsp;phones&nbsp;---</span><br />
                <br />
                <span class="InlineComment">--&nbsp;get&nbsp;home&nbsp;phones&nbsp;---&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Home(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone2&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename2&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;otherphone&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#Home(contactid,&nbsp;phone2,&nbsp;phonename2,&nbsp;otherphone)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone2,&nbsp;phonename2,&nbsp;otherphone&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;phonename2&nbsp;<span class="Operator">not</span>&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%hm%'</span>&nbsp;<span class="Operator">and</span>&nbsp;phonename2&nbsp;<span class="Operator">not</span>&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%home%'</span>&nbsp;<br />
                <span class="Operator">and</span>&nbsp;phone2&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">not</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">and</span>&nbsp;phone2&nbsp;!=<span class="String">''</span>;&nbsp;<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">select</span>&nbsp;@contactid&nbsp;=&nbsp;contactid,&nbsp;@phone2&nbsp;=&nbsp;phone2,&nbsp;@phonename2&nbsp;=&nbsp;phonename2,&nbsp;@otherphone&nbsp;=&nbsp;otherphone<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">from</span>&nbsp;#Home<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">where</span>&nbsp;rowid&nbsp;=&nbsp;@rowcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;@otherphone&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">or</span>&nbsp;@otherphone&nbsp;=&nbsp;<span class="String">''</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;otherphone&nbsp;=&nbsp;phone2,&nbsp;phone2&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;phonename2&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;home&nbsp;phone&nbsp;to&nbsp;other&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">else</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;home&nbsp;phone&nbsp;to&nbsp;notes'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#Home<br />
                <span class="InlineComment">--&nbsp;end&nbsp;get&nbsp;home&nbsp;phones&nbsp;---</span><br />
                <br />
                <span class="InlineComment">--&nbsp;set&nbsp;mobile&nbsp;---</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#SetMobile(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename1&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;otherphone&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#SetMobile(contactid,&nbsp;phone1,&nbsp;phonename1,&nbsp;otherphone)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone1,&nbsp;phonename1,&nbsp;otherphone&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts;<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">select</span>&nbsp;@contactid&nbsp;=&nbsp;contactid,&nbsp;@phone1&nbsp;=&nbsp;phone1,&nbsp;@phonename1&nbsp;=&nbsp;phonename1,&nbsp;@otherphone&nbsp;=&nbsp;otherphone&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">from</span>&nbsp;#SetMobile<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">where</span>&nbsp;rowid&nbsp;=&nbsp;@rowcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;(@phonename1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%mob%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%cell%'</span>)&nbsp;<span class="Operator">and</span>&nbsp;@phone1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Operator">and</span>&nbsp;@phone1&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">not</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">and</span>&nbsp;@phone1&nbsp;!=&nbsp;<span class="String">''</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phonename1&nbsp;=&nbsp;<span class="String">'Mobile'</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;changed&nbsp;to&nbsp;Mobile'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;(@otherphone&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">or</span>&nbsp;@otherphone&nbsp;=&nbsp;<span class="String">''</span>)&nbsp;<span class="Operator">and</span>&nbsp;@phone1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;otherphone&nbsp;=&nbsp;@phone1,&nbsp;phonename1&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;phone1&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;mobile&nbsp;phone&nbsp;to&nbsp;other&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">else</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phone1&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;phonename1&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;mobile&nbsp;phone&nbsp;to&nbsp;notes'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#SetMobile<br />
                <span class="InlineComment">--end&nbsp;set&nbsp;mobile&nbsp;---</span><br />
                <br />
                <span class="InlineComment">--&nbsp;set&nbsp;home&nbsp;---</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#SetHome(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone2&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phonename2&nbsp;<span class="DataType">varchar</span>(50),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;otherphone&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#SetHome<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone2,&nbsp;phonename2,&nbsp;otherphone&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">select</span>&nbsp;@contactid&nbsp;=&nbsp;contactid,&nbsp;@phone2&nbsp;=&nbsp;phone2,&nbsp;@phonename2&nbsp;=&nbsp;phonename2,&nbsp;@otherphone&nbsp;=&nbsp;otherphone<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">from</span>&nbsp;#SetHome<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">where</span>&nbsp;rowid&nbsp;=&nbsp;@rowcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;(@phonename2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%hm%'</span>&nbsp;<span class="Operator">or</span>&nbsp;@phonename2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'%home%'</span>)&nbsp;<span class="Operator">and</span>&nbsp;@phone2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Operator">and</span>&nbsp;@phone2&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">not</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">and</span>&nbsp;@phone2&nbsp;!=&nbsp;<span class="String">''</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phonename2&nbsp;=&nbsp;<span class="String">'Home'</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;changed&nbsp;to&nbsp;Home'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">if</span>&nbsp;(@otherphone&nbsp;<span class="ReservedKeyword">is</span>&nbsp;<span class="Operator">null</span>&nbsp;<span class="Operator">or</span>&nbsp;@otherphone&nbsp;=&nbsp;<span class="String">''</span>)&nbsp;<span class="Operator">and</span>&nbsp;@phone2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;otherphone&nbsp;=&nbsp;@phone2,&nbsp;phone2&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;phonename2&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;home&nbsp;phone&nbsp;to&nbsp;other&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">else</span>&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@phone2&nbsp;=&nbsp;<span class="Operator">null</span>,&nbsp;@phonename2&nbsp;=&nbsp;<span class="Operator">null</span>&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'listed&nbsp;as&nbsp;'</span>,&nbsp;<span class="Function">replace</span>(@phonename2,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;home&nbsp;phone&nbsp;to&nbsp;notes'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#SetHome<br />
                <span class="InlineComment">--&nbsp;end&nbsp;set&nbsp;home&nbsp;---</span><br />
                <br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#WorkSplit(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#WorkSplit(contactid,&nbsp;phone)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;phone&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*&nbsp;/&nbsp;^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="Operator">and</span>&nbsp;<span class="Function">len</span>(phone)&nbsp;&gt;&nbsp;12;&nbsp;<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">select</span>&nbsp;@contactid&nbsp;=&nbsp;contactid,&nbsp;@phone&nbsp;=&nbsp;phone<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">from</span>&nbsp;#WorkSplit<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">where</span>&nbsp;rowid&nbsp;=&nbsp;@rowcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@firstPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@phone,&nbsp;0,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;@phone)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@secondPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@phone,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;-1),&nbsp;<span class="Function">len</span>(@phone)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phone&nbsp;=&nbsp;@firstPhone,&nbsp;otherphone&nbsp;=&nbsp;@secondPhone&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid=@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'multiple&nbsp;numbers&nbsp;in&nbsp;phone&nbsp;field&nbsp;'</span>,&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Function">replace</span>(@secondPhone,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;phone&nbsp;to&nbsp;other&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span>&nbsp;<br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#WorkSplit<br />
                <br />
                <span class="InlineComment">--&nbsp;mobile&nbsp;splits&nbsp;---</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#MobileSplit(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone1&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#MobileSplit(contactid,&nbsp;phone1)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone1&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;phone1&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*&nbsp;/&nbsp;^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="Operator">and</span>&nbsp;<span class="Function">len</span>(phone1)&nbsp;&gt;&nbsp;12;<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@firstPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@phone1,&nbsp;0,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;1)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@secondPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@phone1,&nbsp;0,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;-1)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phone1&nbsp;=&nbsp;@firstPhone,&nbsp;otherphone&nbsp;=&nbsp;@secondPhone&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid=@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'multiple&nbsp;numbers&nbsp;in&nbsp;mobile&nbsp;phone&nbsp;field&nbsp;'</span>,&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Function">replace</span>(@secondPhone,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;mobile&nbsp;phone&nbsp;to&nbsp;other&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span>&nbsp;&nbsp;&nbsp;&nbsp;<br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#MobileSplit<br />
                <span class="InlineComment">--&nbsp;end&nbsp;mobile&nbsp;splits&nbsp;---</span><br />
                <br />
                <span class="InlineComment">--&nbsp;home&nbsp;splits&nbsp;--</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#HomeSplit(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;phone2&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#HomeSplit(contactid,&nbsp;phone2)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;phone2&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;phone2&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*&nbsp;/&nbsp;^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="Operator">and</span>&nbsp;<span class="Function">len</span>(phone2)&nbsp;&gt;&nbsp;12;<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@firstPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@phone2,&nbsp;0,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;1)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@secondPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@phone2,&nbsp;0,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;-1)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;phone2&nbsp;=&nbsp;@firstPhone,&nbsp;otherphone&nbsp;=&nbsp;@secondPhone&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid=@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@phone1,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'multiple&nbsp;numbers&nbsp;in&nbsp;home&nbsp;phone&nbsp;field&nbsp;'</span>,&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Function">replace</span>(@secondPhone,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;home&nbsp;phone&nbsp;to&nbsp;other&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#HomeSplit<br />
                <span class="InlineComment">--&nbsp;end&nbsp;home&nbsp;splits&nbsp;---</span><br />
                <br />
                <span class="InlineComment">--&nbsp;fax&nbsp;splits&nbsp;---</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#FaxSplits(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;fax&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#FaxSplits(contactid,&nbsp;fax)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;fax&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;fax&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*&nbsp;/&nbsp;^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="Operator">and</span>&nbsp;<span class="Function">len</span>(fax)&nbsp;&gt;&nbsp;12;<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@firstPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@fax,&nbsp;0,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;1)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@secondPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@fax,&nbsp;0,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;-1)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@fax&nbsp;=&nbsp;@firstPhone,&nbsp;otherphone&nbsp;=&nbsp;@secondPhone&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid=@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@fax,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'multiple&nbsp;numbers&nbsp;in&nbsp;fax&nbsp;field&nbsp;'</span>,&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Function">replace</span>(@secondPhone,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;fax&nbsp;to&nbsp;other&nbsp;phone&nbsp;field'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#FaxSplits<br />
                <span class="InlineComment">--&nbsp;end&nbsp;fax&nbsp;splits&nbsp;---</span><br />
                <br />
                <span class="InlineComment">--&nbsp;other&nbsp;splits&nbsp;---</span><br />
                <span class="ReservedKeyword">create</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#OtherSplits(<br />
                &nbsp;&nbsp;&nbsp;&nbsp;rowid&nbsp;<span class="DataType">int</span>&nbsp;<span class="ReservedKeyword">identity</span>(1,1),<br />
                &nbsp;&nbsp;&nbsp;&nbsp;contactid&nbsp;<span class="DataType">int</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;fax&nbsp;<span class="DataType">varchar</span>(50)<br />
                )<br />
                <span class="ReservedKeyword">insert</span>&nbsp;<span class="ReservedKeyword">into</span>&nbsp;#OtherSplits(contactid,&nbsp;fax)<br />
                <span class="ReservedKeyword">select</span>&nbsp;contactid,&nbsp;fax&nbsp;<span class="ReservedKeyword">from</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">where</span>&nbsp;otherphone&nbsp;<span class="Operator">like</span>&nbsp;<span class="String">'^[0-9]+\.[0-9]+(\.[0-9]+)*&nbsp;/&nbsp;^[0-9]+\.[0-9]+(\.[0-9]+)*'</span>&nbsp;<span class="Operator">and</span>&nbsp;<span class="Function">len</span>(otherphone)&nbsp;&gt;&nbsp;12;<br />
                <span class="ReservedKeyword">set</span>&nbsp;@recordcount&nbsp;=&nbsp;<span class="GlobalVariable">@@rowcount</span><br />
                <span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;1<br />
                <span class="ReservedKeyword">while</span>&nbsp;@rowcount&nbsp;&lt;=&nbsp;@recordcount<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">begin</span><br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@firstPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@otherphone,&nbsp;0,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;1)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@secondPhone&nbsp;=&nbsp;(<span class="ReservedKeyword">select</span>&nbsp;<span class="Function">substring</span>(@otherphone,&nbsp;0,&nbsp;<span class="Function">charindex</span>(<span class="String">'/'</span>,&nbsp;-1)));<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">update</span>&nbsp;tblcontacts&nbsp;<span class="ReservedKeyword">set</span>&nbsp;otherphone&nbsp;=&nbsp;@firstPhone&nbsp;<span class="ReservedKeyword">where</span>&nbsp;contactid&nbsp;=&nbsp;@contactId;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">insert</span>&nbsp;tblnotes&nbsp;(created,&nbsp;parenttype,&nbsp;parentid,&nbsp;creator,&nbsp;notes,&nbsp;private,&nbsp;shared,&nbsp;access,&nbsp;sticky)&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">values</span>(<span class="Function">getdate</span>(),&nbsp;<span class="String">'Contact'</span>,&nbsp;@contactId,&nbsp;<span class="String">'System'</span>,&nbsp;CONCAT(<span class="Function">replace</span>(@otherphone,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),<span class="String">'multiple&nbsp;numbers&nbsp;in&nbsp;other&nbsp;phone&nbsp;field&nbsp;'</span>,&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Function">replace</span>(@secondPhone,&nbsp;<span class="String">''''</span>,&nbsp;<span class="String">''</span>),&nbsp;<br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="String">',&nbsp;moved&nbsp;from&nbsp;other&nbsp;phone&nbsp;field&nbsp;to&nbsp;notes'</span>),&nbsp;0,&nbsp;0,&nbsp;<span class="String">'Public'</span>,&nbsp;0);<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">set</span>&nbsp;@rowcount&nbsp;=&nbsp;@rowcount&nbsp;+&nbsp;1<br />
                &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReservedKeyword">end</span><br />
                <span class="ReservedKeyword">drop</span>&nbsp;<span class="ReservedKeyword">table</span>&nbsp;#OtherSplits<br />
                <span class="InlineComment">--&nbsp;end&nbsp;other&nbsp;splits&nbsp;---</span><br />
                <span class="ReservedKeyword">END</span><br />
                <br />
                <br />
                GO
            </div>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <h4 class="myHeadingStyle">To create the contacts and notes tables execute the following scripts</h4>
            <br />
            <p class="p-indent">First the contacts table</p>
            <div class="code">
                <span class="ReservedKeyword">USE</span>&nbsp;[cdb&nbsp;]<br />
                GO<br />
                <br />
                <span class="BlockComment">/******&nbsp;Object:&nbsp;&nbsp;Table&nbsp;[dbo].[tblContacts]&nbsp;&nbsp;&nbsp;&nbsp;Script&nbsp;Date:&nbsp;2/7/2016&nbsp;1:53:57&nbsp;PM&nbsp;******/</span><br />
                <span class="ReservedKeyword">SET</span>&nbsp;<span class="ReservedKeyword">ANSI_NULLS</span>&nbsp;<span class="ReservedKeyword">ON</span><br />
                GO<br />
                <br />
                <span class="ReservedKeyword">SET</span>&nbsp;<span class="ReservedKeyword">QUOTED_IDENTIFIER</span>&nbsp;<span class="ReservedKeyword">ON</span><br />
                GO<br />
                <br />
                <span class="ReservedKeyword">CREATE</span>&nbsp;<span class="ReservedKeyword">TABLE</span>&nbsp;[dbo].[tblContacts](<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[ContactId]&nbsp;[<span class="DataType">int</span>]&nbsp;<span class="ReservedKeyword">IDENTITY</span>(1,1)&nbsp;<span class="Operator">NOT</span>&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[CompanyId]&nbsp;[<span class="DataType">int</span>]&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[FirstName]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[LastName]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Email]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Phone]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[PhoneName1]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Phone1]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[PhoneName2]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Phone2]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[OtherPhone]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Fax]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span><br />
                )&nbsp;<span class="ReservedKeyword">ON</span>&nbsp;[<span class="ReservedKeyword">PRIMARY</span>]<br />
                <br />
                GO
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <p class="p-indent">Now the Notes table</p>
            <div class="code">
                <span class="ReservedKeyword">USE</span>&nbsp;[cdb&nbsp;]<br />
                GO<br />
                <br />
                <span class="BlockComment">/******&nbsp;Object:&nbsp;&nbsp;Table&nbsp;[dbo].[tblNotes]&nbsp;&nbsp;&nbsp;&nbsp;Script&nbsp;Date:&nbsp;2/7/2016&nbsp;1:52:06&nbsp;PM&nbsp;******/</span><br />
                <span class="ReservedKeyword">SET</span>&nbsp;<span class="ReservedKeyword">ANSI_NULLS</span>&nbsp;<span class="ReservedKeyword">ON</span><br />
                GO<br />
                <br />
                <span class="ReservedKeyword">SET</span>&nbsp;<span class="ReservedKeyword">QUOTED_IDENTIFIER</span>&nbsp;<span class="ReservedKeyword">ON</span><br />
                GO<br />
                <br />
                <span class="ReservedKeyword">CREATE</span>&nbsp;<span class="ReservedKeyword">TABLE</span>&nbsp;[dbo].[tblNotes](<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[NoteId]&nbsp;[<span class="DataType">int</span>]&nbsp;<span class="ReservedKeyword">IDENTITY</span>(1,1)&nbsp;<span class="Operator">NOT</span>&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Created]&nbsp;[date]&nbsp;<span class="Operator">NOT</span>&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[ParentType]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[ParentId]&nbsp;[<span class="DataType">int</span>]&nbsp;<span class="Operator">NOT</span>&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Creator]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Notes]&nbsp;[<span class="DataType">nvarchar</span>](<span class="Function">max</span>)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Private]&nbsp;[<span class="DataType">int</span>]&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Shared]&nbsp;[<span class="DataType">int</span>]&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Access]&nbsp;[<span class="DataType">nvarchar</span>](50)&nbsp;<span class="Operator">NULL</span>,<br />
                &nbsp;&nbsp;&nbsp;&nbsp;[Sticky]&nbsp;[<span class="DataType">int</span>]&nbsp;<span class="Operator">NULL</span><br />
                )&nbsp;<span class="ReservedKeyword">ON</span>&nbsp;[<span class="ReservedKeyword">PRIMARY</span>]&nbsp;TEXTIMAGE_ON&nbsp;[<span class="ReservedKeyword">PRIMARY</span>]<br />
                <br />
                GO
            </div>
        </div>

    </div>
</asp:Content>

