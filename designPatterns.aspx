<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="designPatterns.aspx.cs" Inherits="Modules_designPatterns" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-md-12">
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h2>Creating an MVC application using a Generic Repository and Unit of Work classs</h2>
            <h4>by Daniel Cassin</h4>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <div>
                <p>
                    Fire up Visual Studio and select New Project / Asp.NET Web Application and name it 'RepositoryExample'
                </p>
                <p>
                Select the MVC template and click OK

                </p>
                <p>
                <img src="../Images/newAsp.png" />

                </p>
            </div>
            <div>
                <h3>Create the Entity Framework Data Model</h3>
                <p>Right-click on the Models folder and select Add / ADO.NET Entity Data Model</p>
                <p>Choose EF Designer from database and click Next ></p>
                <img src="../Images/adonetedmx.png" />
            </div>
            <div>
                <p>In the wizard click New Connection... select your connection and databse and click OK</p>
                <p>
                    <img src="../Images/efwizard.png" />

                </p>
            </div>
        </div>
    </div>
</asp:Content>
