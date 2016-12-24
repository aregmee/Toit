<%--
  Created by IntelliJ IDEA.
  User: asimsangram
  Date: 12/16/15
  Time: 9:16 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Register</title>
</head>

<body>
    <h2>Register</h2>
        <g:form controller="user" action="save" autocomplete="off">
            <div id="userDetail">
                <div class="row">
                    <div class="input-field col s6">
                        <label for="firstName">First Name</label>
                        <g:textField class="validate" id = "firstName" name="firstName"/>
                    </div>
                    <div class="input-field col s6">
                        <label for="lastName">Last Name</label>
                        <g:textField class="validate" name="lastName" id = "lastName"/>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <p>
                            <input name="gender" type="radio" id="male" value="Male"/>
                            <label for="male">Male</label>
                            <input name="gender" type="radio" id="female" value="Female"/>
                            <label for="female">Female</label>
                        </p>
                    </div>
                    <div class="input-field col s6">
                        <label for="email">Email</label>
                        <g:textField class="validate" name="email" id = "email"/>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s6">
                        <label for="username">Username</label>
                        <g:textField class="validate" name="username" id = "username"/>
                    </div>
                    <div class="input-field col s6">
                        <label for="password">Password</label>
                        <g:passwordField class="validate"  name="password" id = "password"/>
                    </div>
                </div>
                <div class="input-field col s6">
                    <label for="shortBio">Short Bio About Yourself...</label>
                    <textarea class="materialize-textarea" type="text" rows= "3" id = "shortBio" name="bio"></textarea>
                </div>
                <button type="submit" class="btn waves-effect waves-light green accent-3">
                    Continue
                </button>
            </div>
        </g:form>
</body>
</html>