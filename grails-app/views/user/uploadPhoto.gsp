<%--
  Created by IntelliJ IDEA.
  User: asimsangram
  Date: 1/3/16
  Time: 11:41 PM
--%>

<%@ page import="toit.ExtendedUser" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta content="main" name="layout"/>
    <title>Upload Your Photo</title>
</head>

<body>
<div class="ui success message">
    <i class="close icon"></i>
    <div class="header">
        Upload a profile picture to start using Toit.
    </div>
</div>
<g:form enctype="multipart/form-data" controller="user" action="uploadProfilePic">
    <div class="ui card">
        <div class="content">
            <div class="header">Upload a Profile Picture</div>
        </div>
        <div class="content">
            <div class="ui small feed">
                <div class="event">
                    <div class="content">
                        <div class="summary">
                            <input type = "hidden" value="${ExtendedUser.findByUsername(sec.username()).id}" name = "userId"/>
                            <input type = "file" name="pp" placeholder="Change"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="extra content">
            <button type="submit" class="btn waves-effect waves-light green accent-3">Upload</button>
        </div>
    </div>
</g:form>
</body>
</html>