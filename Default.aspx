<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/styles.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="myHeadingStyle">Code Samples<br />
                </h1>
            </div>
        </div>
        <hr />
        <p class="p-indent">by Daniel Cassin, Software Developer</p>
        <br />
    </div>
    <div class="container">

        <div class="row">
            <div class="col-md-12">
                <a href="Modules/videoPoker.aspx">
                    <h3>MVC Video Poker</h3>
                </a>
                <p class="p-indent">
                    In this project I created a casino-style video poker <a href="Modules/videoPoker.aspx">game</a> using MVC 5, EF 6, JavaScript, JQuery, AJAX, and unit testing.  
                The user can select from 3 different game options: <a href="Modules/jacksOrBetter.aspx">Jacks or Better</a>, 
                <a href="Modules/jokersWild.aspx">Jokers Wild</a>, and <a href="Modules/deucesWild.aspx">Deuces Wild</a>
                </p>
                <%--<p>
                    <a class="btn btn-default btn-round" href="/modules/videoPoker.aspx">View code &raquo;</a>
                </p>--%>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <a href="Modules/updateContacts.aspx">
                    <h3>Data Grooming in SQL Server</h3>
                </a>
                <p class="p-indent">
                    This is an example of a task I was assigned to groom hundreds of thousands of existing 
                contact records in preparation for an upcoming merge with Salesforce
                </p>
                <%--<p>
                    <a class="btn btn-default btn-round" href="/modules/updateContacts.aspx">View code &raquo;</a>
                </p>--%>
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <a href="Modules/crudExample.aspx">
                    <h3>Simple CRUD Operations Part 1: Bootstrap & Angular JS</h3>
                </a>
                <p class="p-indent">
                    In this example I show how to create simple <a href="Modules/crudExample.aspx">CRUD</a> operations using Bootstrap and Angular js.
                </p>
                <%--<p>
                    <a class="btn btn-default btn-round" href="/modules/crudExample.aspx">View code &raquo;</a>
                </p>--%>
            </div>
        </div><hr />
        <div class="row">
            <div class="col-md-12">
                <a href="Modules/crudExample1.aspx">
                    <h3>Simple CRUD Operations Part 2: Web API</h3>
                </a>
                <p class="p-indent">
                    I use this example for the business logic and data access layers in the <a href="Modules/crudExample1.aspx">CRUD</a> example using Entity Framework and the Repository & Unit of Work design patterns 
                </p>
                <%--<p>
                    <a class="btn btn-default btn-round" href="/modules/crudExample1.aspx">View code &raquo;</a>
                </p>--%>
            </div>
        </div><hr />
        <div class="row">
            <div class="col-md-12">
                <a href="Modules/dependencyInjection.aspx">
                    <h3>An Introduction to Dependency Injection<br /></h3>
                </a>
                <p class="p-indent">
                    In this example I demonstrate a simple, yet clear introduction to the DI design pattern. 
                </p>
                <%--<p>
                    <a class="btn btn-default btn-round" href="/modules/dependencyInjection.aspx">View code &raquo;</a>
                </p>--%>
            </div>
        </div><hr />
        <div class="row">
            <div class="col-md-12">
                <a href="Modules/unityDI.aspx">
                    <h3>More Dependency Injection with Unity<br /></h3>
                </a>
                <p class="p-indent">
                    This example expands on the previous one by introducting the Unity DI container
                </p>
                <%--<p>
                    <a class="btn btn-default btn-round" href="/modules/dependencyInjection.aspx">View code &raquo;</a>
                </p>--%>
            </div>
        </div><hr />
        <div class="row">
            <div class="col-md-12">
                <a href="Modules/unitTests.aspx">
                    <h3>Unit Testing in C#<br /></h3>
                </a>
                <p class="p-indent">
                    Creating test methods for the Jacks or Better, Jokers Wild, and Deuces Wild games. 
                </p>
                <%--<p>
                    <a class="btn btn-default btn-round" href="/modules/dependencyInjection.aspx">View code &raquo;</a>
                </p>--%>
            </div>
        </div><hr />
        <div class="row">
            <div class="col-md-12">
                <a href="Modules/developerQuiz.aspx">
                    <h3>My .NET Developer Quiz<br /></h3>
                </a>
                <p class="p-indent">
                    Test your knowledge in Object Oriented Programming, SQL, MVC, Entity Framework, Angular JS and more with these 50 questions.
                </p>
                <%--<p>
                    <a class="btn btn-default btn-round" href="/modules/dependencyInjection.aspx">View code &raquo;</a>
                </p>--%>
            </div>
        </div>
    </div>
</asp:Content>
