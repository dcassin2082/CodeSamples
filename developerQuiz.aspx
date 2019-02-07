<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="developerQuiz.aspx.cs" Inherits="Modules_developerQuiz" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/styles.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="myHeadingStyle">Technical Interview Questions</h3>
            </div>
        </div>
    </div>
    <hr />
    <p class="p-indent ">by Daniel Cassin</p>
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">1. What are the 3 pillars of Object Oriented Programming?</p>
                <a data-toggle="collapse" href="#question1" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question1" class="panel-collapse collapse p-indent">
                    <div class="panel-body">Polymorphism, Inheritance, Encapsulation.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">2. What is the difference between an interface and an abstract class?</p>
                <a data-toggle="collapse" href="#question2" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question2" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        Interfaces can only contain definitions for methods, properties, events and indexers.  Any class
                            that implements an interface is contractually bound to implement all of its members.  All members are public by default.
                        <br />
                        <br />
                        Abstract classes can contain abstract, virtual, concrete, and static methods.  Only methods marked as abstract are required to
                            be implemented in the derived class.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">3. What are Generics?</p>
                <a data-toggle="collapse" href="#question3" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question3" class="panel-collapse collapse p-indent">
                    <div class="panel-body">They allow you define data structures without having to commit to actual types.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">4. What are SOLID principles?</p>
                <a data-toggle="collapse" href="#question4" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question4" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>S - Single responsibility principle
                                <ul>
                                    <li>An object should only have one job to do, for example lets say you have a class that calculates shapes.  That class should NOT also display the output
                                    </li>
                                </ul>
                            </li>
                            <li>O - Open / Closed principle
                                <ul>
                                    <li>Open for extension, Closed for modification, i.e., an object should be easily extendable without modifying the class itself.
                                    </li>
                                </ul>
                            </li>
                            <li>L - Liskov Substitution principle
                                <ul>
                                    <li>Every child class should be substitutable for its parent class.  If class B : A, then we should be able to replace an object of A by the
                                        object of B without changing A
                                    </li>
                                </ul>
                            </li>
                            <li>I - Interface Segregation principle
                                <ul>
                                    <li>Client should not be forced to depend on methods (or interfaces) it does not use.  
                                        Example: A Square doesn’t have a Volume so you shouldn’t include Volume in your Shape interface.  Instead create a Solid Shape interface
                                    </li>
                                </ul>
                            </li>
                            <li>D - Dependency Inversion principle
                                <ul>
                                    <li>Entities must depend on abstractions, not on concretions. 
                                    </li>
                                </ul>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">5. What are the 3 types of Dependency Injection?</p>
                <a data-toggle="collapse" href="#question6" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question6" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>Constructor Injection
                                <ul>
                                    <li>Dependencies are provided through a class constructor.</li>
                                </ul>
                            </li>
                            <li>Setter Injection
                                <ul>
                                    <li>The client exposes a setter method that the injector uses to inject the dependency.</li>
                                </ul>
                            </li>
                            <li>Method Injection
                                <ul>
                                    <li>Dependencies are injected into a single method.</li>
                                </ul>
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">6. Define Inversion of Control</p>
                <a data-toggle="collapse" href="#question7" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question7" class="panel-collapse collapse p-indent">
                    <div class="panel-body">Inversion of control means that objects should not create other objects upon which they rely to do their work.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">7. What is loose coupling?</p>
                <a data-toggle="collapse" href="#question8" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question8" class="panel-collapse collapse p-indent">
                    <div class="panel-body">Loose coupling is when each component has little or no knowledge of the definitions of other separate components</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">8. What does @Html.BeginForm do?</p>
                <a data-toggle="collapse" href="#question9" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question9" class="panel-collapse collapse p-indent">
                    <div class="panel-body">It writes an opening &lt;form&gt; tag to the response.  The form uses the POST method, and the request is processed by the action method for the view.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">9. What is an @Html.ActionLink?</p>
                <a data-toggle="collapse" href="#question10" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question10" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        It calls a controller action: @Html.ActionLink("Link Text", "Action Name")
                    </div>
                </div>
            </div>
        </div>
        <br />


        <%--next page--%>
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">10. What does an Upsert operation do?</p>
                <a data-toggle="collapse" href="#question11" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question11" class="panel-collapse collapse p-indent">
                    <div class="panel-body">Add or Update</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">11. In code-first migrations, what do the Up and Down methods do?</p>
                <a data-toggle="collapse" href="#question12" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question12" class="panel-collapse collapse p-indent">
                    <div class="panel-body">The Up method creates the database tables.  The Down method deletes them.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">12. What does the the ValidateAntiForgeryToken attribute do?</p>
                <a data-toggle="collapse" href="#question13" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question13" class="panel-collapse collapse p-indent">
                    <div class="panel-body">It prevents cross-site request forgery attacks using a unique token value.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">13. What does ModelState.IsValid do?</p>
                <a data-toggle="collapse" href="#question14" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question14" class="panel-collapse collapse p-indent">
                    <div class="panel-body">It performs server side validation.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">14. What is the difference between an ActionResult and a ViewResult?</p>
                <a data-toggle="collapse" href="#question15" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question15" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>ActionResult is the abstract class that ViewResult, JsonResult, etc. all inherit from.
                            </li>
                            <li>ViewResult renders a specified view to the response stream.
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">15. What is the ViewBag?</p>
                <a data-toggle="collapse" href="#question16" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question16" class="panel-collapse collapse p-indent">
                    <div class="panel-body">It is a dynamic object that enables you to dynamically share values from the controller to the view.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">16. What is the difference between a Model and a ViewModel?</p>
                <a data-toggle="collapse" href="#question17" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question17" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        They are both just simple classes, with or without attributes.  A model typically represents a data entity, while a
                         view model is a special kind of model created to interact with the view.
                    </div>
                </div>
            </div>
        </div>
        <br />

        <%--Entity framework--%>
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">17. What is a navigation property?</p>
                <a data-toggle="collapse" href="#question18" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question18" class="panel-collapse collapse p-indent">
                    <div class="panel-body">It holds related entities of this property.  Basically it represents a foreign key.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">18. What is the virtual keyword for?</p>
                <a data-toggle="collapse" href="#question19" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question19" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>It allows for methods in base classes to be overridden in a derived class.
                            </li>
                            <li>In entity framework, it represents a POCO (plain old CLR object).  When the EF creates the entity it overrides your virtual object.
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">19. How does Entity Framework know a property is a foreign key?</p>
                <a data-toggle="collapse" href="#question20" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question20" class="panel-collapse collapse p-indent">
                    <div class="panel-body">If it’s named like {nav prop name}{primary key name}</div>
                </div>
            </div>
        </div>
        <br />
        <%--next page--%>

        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">20. In Entity Framework, what is the DbSet?</p>
                <a data-toggle="collapse" href="#question21" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question21" class="panel-collapse collapse p-indent">
                    <div class="panel-body">It represents an entity set for each of your models.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">21. What are the 5 different Entity States?</p>
                <a data-toggle="collapse" href="#question22" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question22" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>Added - an insert statement gets issued on SaveChanges()
                            </li>
                            <li>Unchanged - the entity is unchanged
                            </li>
                            <li>Modified - SaveChanges on an Update statement
                            </li>
                            <li>Deleted - SaveChanges on an Delete statement
                            </li>
                            <li>Detached - entity is not being tracked by the DbContext
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">22. What is a DTO?</p>
                <a data-toggle="collapse" href="#question23" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question23" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        A Data Transfer Object is an object that carries data between processes in order to reduce the number of method calls. They are used to transfer parameters to methods and as return types. 
                        MVC Model classes are DTO’s
                    </div>
                </div>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">23. What are the benefits of using DTOs?</p>
                <a data-toggle="collapse" href="#question25" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question25" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        They reduce the amount of data that needs to be sent across the wire in distributed applications.  Must be serializable.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">24. What is the difference between IQueryable and IEnumerable?</p>
                <a data-toggle="collapse" href="#question26" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question26" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>IQueryable exists in the System.Linq namespace and is best for querying data from out-of-memory collections like remote databases or services.
                            </li>
                            <li>IEnumerable exists in the System.Collections namespace and is best for querying data from in-memory collections such as Lists and Arrays.
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">25. What are the differences between Lazy, Eager, and Explicit loading?</p>
                <a data-toggle="collapse" href="#question27" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question27" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>Lazy loading is a type of deferred loading in which related objects are not loaded with their parent object until they are requested. 
                            </li>
                            <li>With Eager loading, related objects are loaded automatically with the parent object.  In order to use Eager loading use the Include() method.
                            </li>
                            <li>Explicit loading is like lazy loading but related objects are not loaded until explicitly requested by using the Load() method on a navigation property.
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">26. Which type of loading is best performance-wise?</p>
                <a data-toggle="collapse" href="#question28" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question28" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>Eager loading is usually the most efficient, especially when using serialization.  It can cause some very complex joins though.
                            </li>
                            <li>Lazy loading is appropriate if you are only trying to use navigation properties.
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />

        <%-- SQL--%>
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">27. In SQL, What are indexes?</p>
                <a data-toggle="collapse" href="#question29" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question29" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        Indexes are created on columns in tables or views. Without an index a table scan has to be performed which can take a long time. They allow
                        SQL Server to find the column value in the index.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">28. What is the difference between a clustered and a non-clustered index?</p>
                <a data-toggle="collapse" href="#question30" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question30" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>Clustered indexes sort and store rows based on their key values. It is ordered, usually by the primary (ID) column. Can only have one clustered index per table such as a primary key.  Think of it like a dictionary organized from A-Z. Good for sorting. 
                                Note that the primary key is a clustered index by default, so you can create a CI on another column, usually the one you are going to order by.
                            </li>
                            <li>Non-clustered indexes do not sort but are (255 total) separate objects that point to the rows containing the index.  
                                Think of it like the index in the back of the book which lists the keywords with their page numbers. Good for searching
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <%--next page--%>

        <%--next page--%>

        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">29. What is a primary key?</p>
                <a data-toggle="collapse" href="#question31" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question31" class="panel-collapse collapse p-indent">
                    <div class="panel-body">A key in a relational database table that is unique for each record, such as an ID column.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">30. What is a foreign key?</p>
                <a data-toggle="collapse" href="#question32" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question32" class="panel-collapse collapse p-indent">
                    <div class="panel-body">A column in one table that uniquely identifies a row in another table</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">31. What is the difference between a stored procedure and a function?</p>
                <a data-toggle="collapse" href="#question33" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question33" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        A function must return a value while a stored procedure may or may not.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">32. What is a cursor?</p>
                <a data-toggle="collapse" href="#question34" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question34" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        It is a temporary work area created when a SQL Select statement is executed.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">33. What is a temporary table?</p>
                <a data-toggle="collapse" href="#question35" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question35" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        They are set-based virtual tables that, like cursors, are created by the use of select statements.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">34. In SQL, what is a view?</p>
                <a data-toggle="collapse" href="#question36" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question36" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        A view is a virtual table based on the result set of a sql statements. Example: CREATE VIEW view_name AS SELECT * FROM tblName WHERE condition
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">35. What is the difference between a table-valued and a scalar-valued function?</p>
                <a data-toggle="collapse" href="#question37" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question37" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>Scalar functions accept any number of params and return 1 value.
                            </li>
                            <li>Inline table valued functions return a result set, much like a view. The difference it they can accept parameters while views cannot.
                            </li>
                            <li>Multi-statement table-valued functions return table-type result sets.
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">36. What is a trigger?</p>
                <a data-toggle="collapse" href="#question38" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question38" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        A trigger is a special kind of stored procedure that executes when an event occurs on the db server.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">37. What is the difference between an inner, left, right, full, and cross join?</p>
                <a data-toggle="collapse" href="#question39" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question39" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>Inner join - Returns all matching rows from both tables.
                            </li>
                            <li>Left join - Returns all rows from the left table plus the matching rows from the right table and puts null values in all the unmatched rows (i.e. Rows not in the right table).
                            </li>
                            <li>Right join - Returns all rows from the right table plus the matching rows from the left table and puts null values in all the unmatched rows (i.e. Rows not in the left table).
                            </li>
                            <li>Full join - Returns all rows from both tables.
                            </li>
                            <li>Cross join - Returns the cartesian cross product of both tables, i.e.  (numRowsInTableA) * (numRowsInTableB).
                            </li>
                        </ol>

                    </div>
                </div>
            </div>
        </div>
        <br />
        <%--unit testing--%>
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">38. What is a mock object?</p>
                <a data-toggle="collapse" href="#question40" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question40" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        Mock objects are simulated objects that mimic the behavior of real objects in controlled ways.  It is useful to create mocks, or fakes, in situations where it is impractical
                        or impossible to use real objects in a unit test.
                    </div>
                </div>
            </div>
        </div>
        <br />

        <%--next page--%>

        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">39. What is code coverage?</p>
                <a data-toggle="collapse" href="#question41" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question41" class="panel-collapse collapse p-indent">
                    <div class="panel-body">Code coverage is the percentage of code covered by the test.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">40. What is cyclomatic complexity?</p>
                <a data-toggle="collapse" href="#question42" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question42" class="panel-collapse collapse p-indent">
                    <div class="panel-body">It is a measure of how complex your code is. The higher the code coverage, the lower the cyclomatic complexity.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">41. What are 5 essential steps in TDD?</p>
                <a data-toggle="collapse" href="#question43" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question43" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>Create test
                            </li>
                            <li>Validate test harness
                            </li>
                            <li>Write code to cause test to pass
                            </li>
                            <li>Run tests
                            </li>
                            <li>Refactor code
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <%--angular js--%>
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">42. What are ng-directives?</p>
                <a data-toggle="collapse" href="#question44" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question44" class="panel-collapse collapse p-indent">
                    <div class="panel-body">They are extended HTML attributes with the prefix ng-</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">43. What is the difference between the ng-init, ng-app, and ng-model directives?</p>
                <a data-toggle="collapse" href="#question45" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question45" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>The ng-init directive initializes application data.
                            </li>
                            <li>The ng-app directive initializes the angular js application.
                            </li>
                            <li>The ng-model directive binds the value of HTML controls to application data.
                            </li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">44. What is the $scope object?</p>
                <a data-toggle="collapse" href="#question46" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question46" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        In Angular JS, $scope represents the application object.  It is the owner of all the application variables and functions.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">45. What is a promise?</p>
                <a data-toggle="collapse" href="#question47" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question47" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        It is the eventual result of an operation: .success{function()..., .error{function()..., etc...
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">46. What is an angular js module?</p>
                <a data-toggle="collapse" href="#question48" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question48" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        A module defines the angular js application.  
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">47. What is an angular js controller?</p>
                <a data-toggle="collapse" href="#question49" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question49" class="panel-collapse collapse p-indent">
                    <div class="panel-body">Defined inside the module, they control angular js applications.</div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <p class="myHeadingStyle">48. What does the following function do?</p>
            <div class="col-md-6">
                <div class="code">
                    function&nbsp;()&nbsp;{<br />
                    $http.get('/api/Customers')<br />
                    .success(function&nbsp;(data)&nbsp;{<br />
                    $scope.customers&nbsp;=&nbsp;data;<br />
                    })
                </div>
            </div>
            <div class="col-md-12">
                <a data-toggle="collapse" href="#question51" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question51" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        It issues an http get request to the GetAll method in the Customers Web Api controller and loads the data into the $scope object.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row">
            <p class="myHeadingStyle">49. What does the following function do?</p>
            <div class="col-md-6">
                <div class="code">
                    $http.put('/api/Customers/'&nbsp;+&nbsp;id,&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'CustomerId':&nbsp;customer.CustomerId,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'Street':&nbsp;customer.Street,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'City':&nbsp;customer.City,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'State':&nbsp;customer.State,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'Zip':&nbsp;customer.Zip,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'Phone':&nbsp;customer.Phone,<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'Name':&nbsp;customer.Name<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;})
                </div>
            </div>
            <div class="col-md-12">
                <a data-toggle="collapse" href="#question50" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question50" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        It calls the Put method in the Web API controller and updates the customer with the specified ID.
                    </div>
                </div>
            </div>
        </div>
        <br />
        <h3 class="myHeadingStyle">50. Bonus Question</h3>
        <div class="row">
            <div class="col-md-12">
                <p class="myHeadingStyle">Suppose you have a list of a million integers from 1 to a million, in random order, with none repeating.  One number is missing.  What is the best way to determine the missing integer?</p>
                <a data-toggle="collapse" href="#question24" class="btn btn-xs btn-success btn-border-round">View answer</a>
                <div id="question24" class="panel-collapse collapse p-indent">
                    <div class="panel-body">
                        <ol>
                            <li>Sort the List using List.Sort().
                            </li>
                            <li>Use the formula for the Sum of the first n integers = n*(n + 1) / 2 to get the expected sum.
                            </li>
                            <li>Loop thru the list to calculate the actual sum. 
                            </li>
                            <li>Subtract the actual sum from the expected sum, the result is your missing integer.
                            </li>
                        </ol>

                    </div>
                </div>
            </div>
        </div>
        <br />
    </div>
</asp:Content>
