<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoPokerWelcome.aspx.cs" MasterPageFile="~/Site.master" Inherits="Modules_videoPokerWelcome" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/styles.css" rel="stylesheet" />
    <div class="row">
        <h1 class="myHeadingStyle">MVC Video Poker Welcome Screen<br />
        </h1>
        <hr />

        <p class="p-indent ">by Daniel Cassin</p>
        <div class="row">
            <div class="col-md-10">
                <p class="p-indent">The Welcome View will redirect the player to the game they select</p>
            </div>
            <hr />
        </div>
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-10">
                    <img src="../Images/gameweb.png" />
                </div>
            </div>
            <br />
            <br />
            <div class="row">
                <p class="p-indent">Welcome View Code</p>
                <div class="code">
                    @Styles.Render("~/Content/Styles.css")<br />
                    <br />
                    @{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;ViewBag.Title&nbsp;=&nbsp;"MVC&nbsp;Casino";<br />
                    }<br />
                    <span class="Element">&lt;div&nbsp;class="jumbotron"&nbsp;style="background-color:black;"&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;div&nbsp;class="carousel"&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;h1&nbsp;class="text-center"&gt;</span>Welcome&nbsp;to&nbsp;My&nbsp;MVC&nbsp;Casino<span class="Element">&lt;/h1&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;h2&nbsp;class="text-center"&gt;</span>Select&nbsp;a&nbsp;game<span class="Element">&lt;/h2&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;/div&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;br&nbsp;/&gt;&lt;br&nbsp;/&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;div&nbsp;class="row&nbsp;container"&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;div&nbsp;class="col-md-12"&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;div&nbsp;class="row"&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;div&nbsp;class="col-md-5"&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;a&nbsp;href="@Url.Action("Index",&nbsp;"Payouts")"&nbsp;class="jacksOrBetterImage"&gt;&lt;img&nbsp;src="~/Images/newJacksOrBetterImg2.png"&nbsp;class="center-images&nbsp;img-clickable"&nbsp;id="imgJacksOrBetter"&nbsp;/&gt;&lt;/a&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;/div&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;div&nbsp;class="col-md-4"&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;a&nbsp;href="@Url.Action("Index",&nbsp;"DeucesWildPaytable")"&nbsp;class="deucesWildImage"&gt;&lt;img&nbsp;src="~/Images/deuces-wild.png"&nbsp;class="center-images&nbsp;img-clickable"&nbsp;id="imgDeucesWild"&nbsp;/&gt;&lt;/a&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;/div&gt;</span><br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;div&nbsp;class="col-md-3"&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;a&nbsp;href="@Url.Action("Index",&nbsp;"JokersWild")"&nbsp;class="jokersWildImage"&gt;&lt;img&nbsp;src="~/images/Double-Joker.jpg"&nbsp;class="center-images&nbsp;img-clickable"&nbsp;id="&nbsp;imgjokerswild"&nbsp;/&gt;&lt;/a&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;/div&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;/div&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;/div&gt;</span><br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="Element">&lt;/div&gt;</span><br />
                    <span class="Element">&lt;/div&gt;</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <%--<div class="row">--%>
                    <p class="p-indent">The game controller simply returns the main view</p>
                    <%--</div>--%>
                    <div class="code">
                        <span class="Namespace">using</span>&nbsp;System.Web.Mvc;<br />
                        <br />
                        <span class="Namespace">namespace</span>&nbsp;VideoPoker.Controllers<br />
                        {<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ReferenceType">class</span>&nbsp;GameController&nbsp;:&nbsp;Controller<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;ActionResult&nbsp;Index()<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Statement">return</span>&nbsp;View();<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                        }
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-10">
                <a class="btn btn-lg btn-success btn-border-round" href="jacksOrBetter.aspx">Jacks or Better Poker &raquo;</a>
                <a class="btn btn-lg btn-primary btn-border-round" href="deuceswild.aspx">Deuces Wild Poker &raquo;</a>
                <a class="btn btn-lg btn-danger btn-border-round" href="kingsorbetter.aspx">Kings or Better Poker &raquo;</a>
                <hr />
            </div>
        </div>
    </div>
</asp:Content>
