<%@ Page Language="C#" AutoEventWireup="true" CodeFile="videoPoker.aspx.cs" MasterPageFile="~/Site.master" Inherits="Modules_videoPoker" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/styles.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-12">
            <h1 class="myHeadingStyle">MVC Video Poker</h1>
            <hr />

            <p class="p-indent ">by Daniel Cassin</p>
        </div>
    </div>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-10 img-rounded">
                <p class="p-indent">In an effort to simulate a real slot poker machine I created 3 different versions of video poker:</p>
                <a class="btn btn-lg btn-success btn-border-round" href="jacksOrBetter.aspx">Jacks or Better Poker &raquo;</a>
                <a class="btn btn-lg btn-primary btn-border-round" href="jokerswild.aspx">Jokers Wild Poker &raquo;</a>
                <a class="btn btn-lg btn-danger btn-border-round" href="deuceswild.aspx">Deuces Wild Poker &raquo;</a>
                <hr />
                <p class="p-indent">
                    Each game has a different pay table to account for the more 
                complex hands that can be made when wild cards are allowed.  To start, the user simply clicks on the game they 
                    want to play.  
                </p>
                <p class="p-indent">
                    The player's credits are stored in a SQL Server database.  For simplicity, I just created a default
                    user account to keep track of credits but we could extend this to simulate players club info, 
                    keeping track of every hand played, winners, losers, total amount wagered, etc...Enjoy
                </p>
            </div>
        </div>
    </div>
    <br />
    <hr />

    <div class="row">
        <div class="col-md-12">
            <p  class="p-indent">The <a href="videoPokerWelcome.aspx">Welcome View</a> allows player to select a game and redirects them to the appropriate controller action</p>
            <div class="row">
                <div class="col-md-10">
                    <a href="videoPokerWelcome.aspx"><img src="../Images/gameweb.png" /></a>
                </div>
            </div>
            <div class="row">
            </div>
            
        </div>
    </div>
    <hr />

</asp:Content>
