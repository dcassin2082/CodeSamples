<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.master" CodeFile="crudExample1.aspx.cs" Inherits="Modules_crudExample1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../Content/styles.css" rel="stylesheet" />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 class="myHeadingStyle">Understanding Dependency Injection</h1>
                <br />
            </div>
        </div>
        <hr />
        <p class="p-indent ">by Daniel Cassin</p>
        <br />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
            </div>
        </div>
        <br />
        <h4 class="myHeadingStyle p-indent">The basic idea behind the DI design pattern is to provide loose coupling between objects, which makes code easier to modify, maintain, and test.
        </h4>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <%--<h3 class="myHeadingStyle">Dependency Injection Demystified</h3>--%>


                <br />
                <p class="p-indent">
                    For example, suppose class B contains a method that class A wants to use.
                    There are a number of ways we could implement this including:
                </p>
                <ul>
                    <li>Creating an instance of B inside A</li>
                    <li>Having class A inherit class B</li>
                </ul>
                <p class="p-indent">
                    The problem with the first option is that it tightly couples A & B which inevitably would complicate changes and testing. Ideally the two
                    classes should have no knowledge of each other.
                </p>
                <p class="p-indent">The problem with the second option is that C# only allows us to inherit from one class at a time, what if A is already inheriting from some other class?</p>
                <br />
                <p class="p-indent">The solution is use Dependency Injection, as the following examples demonstrate.</p>
                <hr />
                <h3 class="myHeadingStyle">Constructor Injection</h3>
                <p class="p-indent">
                    In Constructor Injection, the dependency (class B) is 'injected' to the dependent object (class A) through its constructor as follows: Let class B
                    implement an interface, <b>IMyInterface</b>.  Now in A we can create a member variable of type <b>IMyInterface</b> and set it in A's constructor.  This then allows A to call
                    any of B's methods without even knowing anything about class B.<br />
                </p>
                <p class="p-indent">
                    In the Main method, when an instance of class A is created we just pass a new instance of B to its
                    constructor since B implements the <b>IMyInterface</b> interface.  The beauty of this is that we can create an instance of A and pass an instance of ANY class that implements <b>IMyInterface</b>.
                </p>
                <div class="code">
                    <span class="Namespace">using</span>&nbsp;System;<br />
                    <br />
                    <span class="Namespace">namespace</span>&nbsp;ConstructorInjection<br />
                    {<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">class</span>&nbsp;Program<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">static</span>&nbsp;<span class="ValueType">void</span>&nbsp;Main(<span class="ReferenceType">string</span>[]&nbsp;args)<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A&nbsp;a&nbsp;=&nbsp;<span class="Keyword">new</span>&nbsp;A(<span class="Keyword">new</span>&nbsp;B());<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;a.GetBToDoSomething();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.ReadLine();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">class</span>&nbsp;A<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">private</span>&nbsp;IMyInterface&nbsp;_myObject;<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;A(IMyInterface&nbsp;myObject)<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Keyword">this</span>._myObject&nbsp;=&nbsp;myObject;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;GetBToDoSomething()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_myObject.DoSomething();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">class</span>&nbsp;B&nbsp;:&nbsp;IMyInterface<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;DoSomething()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(<span class="String">"this&nbsp;is&nbsp;an&nbsp;example&nbsp;of&nbsp;constructor&nbsp;injection.."</span>);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingElse()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(<span class="String">"this&nbsp;is&nbsp;an&nbsp;example&nbsp;of&nbsp;setter&nbsp;injection.."</span>);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingDifferent()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(<span class="String">"this&nbsp;is&nbsp;an&nbsp;example&nbsp;of&nbsp;method&nbsp;injection.."</span>);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">interface</span>&nbsp;IMyInterface<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">void</span>&nbsp;DoSomething();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingElse();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingDifferent();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    }
                </div>
                <br />
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <%--<h3 class="myHeadingStyle">Dependency Injection Demystified</h3>--%>

                <hr />
                <h3 class="myHeadingStyle">Setter, or Property Injection</h3>
                <p class="p-indent">In Setter Injection, the dependency is injected to the dependent object through the use of Set properties ...</p>
                <div class="code">
                    <span class="Namespace">using</span>&nbsp;System;<br />
                    <br />
                    <span class="Namespace">namespace</span>&nbsp;SetterInjection<br />
                    {<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">class</span>&nbsp;Program<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">static</span>&nbsp;<span class="ValueType">void</span>&nbsp;Main(<span class="ReferenceType">string</span>[]&nbsp;args)<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;C&nbsp;c&nbsp;=&nbsp;<span class="Keyword">new</span>&nbsp;C();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c.MyObject&nbsp;=&nbsp;<span class="Keyword">new</span>&nbsp;B();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;c.GetBToDoSomethingElse();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.ReadLine();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">class</span>&nbsp;C<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">private</span>&nbsp;IMyInterface&nbsp;_myObject;<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;IMyInterface&nbsp;MyObject<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;set<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Keyword">this</span>._myObject&nbsp;=&nbsp;value;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;GetBToDoSomethingElse()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;_myObject.DoSomethingElse();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">class</span>&nbsp;B&nbsp;:&nbsp;IMyInterface<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;DoSomething()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(<span class="String">"this&nbsp;is&nbsp;an&nbsp;example&nbsp;of&nbsp;constructor&nbsp;injection.."</span>);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingElse()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(<span class="String">"this&nbsp;is&nbsp;an&nbsp;example&nbsp;of&nbsp;setter&nbsp;injection.."</span>);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingDifferent()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(<span class="String">"this&nbsp;is&nbsp;an&nbsp;example&nbsp;of&nbsp;method&nbsp;injection.."</span>);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">interface</span>&nbsp;IMyInterface<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">void</span>&nbsp;DoSomething();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingElse();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingDifferent();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    }
                </div>
                <br />
            </div>
        </div>
        <hr />
        <div class="row">
            <div class="col-md-12">
                <%--<h3 class="myHeadingStyle">Dependency Injection Demystified</h3>--%>
                <h3 class="myHeadingStyle">Method Injection</h3>
                <p class="p-indent">Finally, In Method Injection, the dependency is injected as a parameter to the dependent object method ...</p>
                <div class="code">
                    <span class="Namespace">using</span>&nbsp;System;<br />
                    <br />
                    <span class="Namespace">namespace</span>&nbsp;MethodInjection<br />
                    {<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">class</span>&nbsp;Program<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">static</span>&nbsp;<span class="ValueType">void</span>&nbsp;Main(<span class="ReferenceType">string</span>[]&nbsp;args)<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;D&nbsp;d&nbsp;=&nbsp;<span class="Keyword">new</span>&nbsp;D();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;d.GetBToDoSomethingDifferent(<span class="Keyword">new</span>&nbsp;B());<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.ReadLine();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">class</span>&nbsp;D<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">private</span>&nbsp;IMyInterface&nbsp;_myObject;<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;GetBToDoSomethingDifferent(IMyInterface&nbsp;myObject)<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Keyword">this</span>._myObject&nbsp;=&nbsp;myObject;<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Keyword">this</span>._myObject.DoSomethingDifferent();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">class</span>&nbsp;B&nbsp;:&nbsp;IMyInterface<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;DoSomething()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(<span class="String">"this&nbsp;is&nbsp;an&nbsp;example&nbsp;of&nbsp;constructor&nbsp;injection.."</span>);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingElse()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(<span class="String">"this&nbsp;is&nbsp;an&nbsp;example&nbsp;of&nbsp;setter&nbsp;injection.."</span>);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="Modifier">public</span>&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingDifferent()<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Console.WriteLine(<span class="String">"this&nbsp;is&nbsp;an&nbsp;example&nbsp;of&nbsp;method&nbsp;injection.."</span>);<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    <br />
                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="ReferenceType">interface</span>&nbsp;IMyInterface<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;{<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">void</span>&nbsp;DoSomething();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingElse();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="ValueType">void</span>&nbsp;DoSomethingDifferent();<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;}<br />
                    }
                </div>
                <br />
            </div>
        </div>
    </div>
    <br />
    <br />
</asp:Content>
