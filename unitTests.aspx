<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="unitTests.aspx.cs" Inherits="Modules_unitTests" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/styles.css" rel="stylesheet" />
    <div class="row">
        <div class="col-md-12">
            <h1 class="myHeadingStyle">Unit Testing in C#</h1>
            <hr />
            <p class="p-indent ">by Daniel Cassin</p>
        </div>
    </div>
    <br />
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <h4 class="myHeadingStyle">Unit testing the various hand ranking for the Jacks or Better game</h4>
                <div class="code">
                    <span class="Namespace">using</span>&nbsp;System;<br />
                    <span class="Namespace">using</span>&nbsp;Microsoft.VisualStudio.TestTools.UnitTesting;<br />
                    <span class="Namespace">using</span>&nbsp;VideoPoker.GameBusiness;<br />
                    <br />
                    <span class="Namespace">namespace</span>&nbsp;VideoPoker.Tests<br />
                    {<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;[TestClass]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ReferenceType">class</span>&nbsp;UnitTest1<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;RoyalFlush()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;5&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.RoyalFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;StraightFlush()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;5&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1&nbsp;,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.StraightFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Straight()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.Straight(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Flush()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;5,&nbsp;0,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.Flush(suits);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Quads()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;4,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.Quads(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Trips()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;3,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.Trips(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;TwoPair()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;2,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.TwoPair(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;JacksOrBetter()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.JacksOrBetter(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;JacksOrBetter1()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;2,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.JacksOrBetter(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;AnyPair()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;2,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.JacksOrBetter(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;FullHouse()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;3,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.FullHouse(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;BroadwayStraight()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;HandValue.BroadwayStraight(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    }
                </div>

            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4 class="myHeadingStyle">The tests for the Jokers Wild game are slightly more complex due to the 2 jokers</h4>
                <div class="code">
                    <span class="Namespace">using</span>&nbsp;Microsoft.VisualStudio.TestTools.UnitTesting;<br />
                    <span class="Namespace">using</span>&nbsp;VideoPoker.GameBusiness;<br />
                    <br />
                    <span class="Namespace">namespace</span>&nbsp;VideoPoker.Tests<br />
                    {<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;[TestClass]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ReferenceType">class</span>&nbsp;UnitTest2<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;RoyalFlush()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;5,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.RoyalFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;WildRoyalFlushOneJoker()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;5,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;0,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.WildRoyalFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;WildRoyalFlushTwoJokers()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;5,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.WildRoyalFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;StraightFlush()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;5,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.StraightFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Straight()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;0,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.Straight(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Flush()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;4,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.Flush(suits);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;FiveOfAKind()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;4,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.FiveOfAKind(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Quads()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;3,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.Quads(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Trips()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.Trips(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;TwoPair()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;2,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.TwoPair(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;KingsOrBetter()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.KingsOrBetter(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;KingsOrBetter1()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.KingsOrBetter(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;AnyPair()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;2,&nbsp;0,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.AnyPair(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;FullHouse()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;2,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.FullHouse(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;BroadwayStraightOneJoker()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.BroadwayStraight(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;BroadwayStraightTwoJokers()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;WildHandValue.BroadwayStraight(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    }
                </div>
            </div>
        </div>
    </div>
    <hr />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h4 class="myHeadingStyle">And finally, testing the Deuces Wild game introduces yet more complexity since all 4 deuces are wild cards</h4>
                <div class="code">
                    <span class="Namespace">using</span>&nbsp;Microsoft.VisualStudio.TestTools.UnitTesting;<br />
                    <span class="Namespace">using</span>&nbsp;VideoPoker.GameBusiness;<br />
                    <br />
                    <span class="Namespace">namespace</span>&nbsp;VideoPoker.Tests<br />
                    {<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;[TestClass]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ReferenceType">class</span>&nbsp;UnitTest3<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;RoyalFlush()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;5,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.RoyalFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;WildRoyalFlushOneDeuce()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;4,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.WildRoyalFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;WildRoyalFlushTwoDeuces()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;2,&nbsp;0,&nbsp;1,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;2,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.WildRoyalFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;WildRoyalFlushThreeDeuces()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;2,&nbsp;3&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;3,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.WildRoyalFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;StraightFlush()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;3,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;3,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.StraightFlush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Straight()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;2,&nbsp;0,&nbsp;1,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.Straight(faces,&nbsp;suits);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Flush()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;3,&nbsp;0,&nbsp;0,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.Flush(suits,&nbsp;faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;FiveOfAKind()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;4,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.FiveOfAKind(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Quads()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;3,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;1,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.Quads(faces,&nbsp;suits);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;Trips()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1,&nbsp;1&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.Trips(faces,&nbsp;suits);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;FullHouse()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;2,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.FullHouse(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;BroadwayStraightOneDeuce()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;1,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;1&nbsp;};<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.BroadwayStraight(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;BroadwayStraightTwoDeuces()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;2,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;1,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;suits&nbsp;=&nbsp;{&nbsp;0,&nbsp;2,&nbsp;0,&nbsp;1,&nbsp;2&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.BroadwayStraight(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;BroadwayStraightThreeDeuces()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;3,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;1,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.BroadwayStraight(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[TestMethod]<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;FourDeuces()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">int</span>[]&nbsp;faces&nbsp;=&nbsp;{&nbsp;4,&nbsp;1,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0,&nbsp;0&nbsp;};<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Linq">var</span>&nbsp;result&nbsp;=&nbsp;DeucesWildHandValue.FourDeuces(faces);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Assert.AreEqual(<span class="Keyword">true</span>,&nbsp;result);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    }
                </div>
            </div>
        </div>
    </div>




</asp:Content>





