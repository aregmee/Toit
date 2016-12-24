<%@ page import="toit.ExtendedUser" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
  		<asset:stylesheet src="application.css"/>
        <asset:javascript src="application.js"/>
		<g:layoutHead/>
	</head>
	<body>
    <nav>
        <div class="ui fixed inverted menu nav-bar-opinion">
            <div class="ui container">
                <g:link controller="opinion" action="opinionFeed" class="brand-logo item">
                    <h2>Toit</h2>
                </g:link>
                <sec:ifLoggedIn>
                    <div class="item">
                        <g:form controller="user" action="users">
                            <input type="text" id="search" name = "key" placeholder="Search...">
                        </g:form>
                    </div>
                    <div class="item right">
                        <g:link controller="logout">
                            Logout
                        </g:link>
                    </div>
                    <div class="user-profile item right">
                        <div class="ui comments">
                            <div class="comment">
                                <a class="avatar" id="profilePicture">
                                    <img src="${createLink(controller:'user', action:'avatar_image', id:ExtendedUser.findByUsername(sec.username()).id)}" class="ui avatar imageg"/>
                                </a>&nbsp;
                                <h4>${ExtendedUser.findByUsername(sec.username()).firstName}</h4>
                            </div>
                        </div>
                    </div>
                </sec:ifLoggedIn>
            </div>
        </div>
    </nav>
    <div class="container">
    <sec:ifLoggedIn>
        <g:form enctype="multipart/form-data" controller="user" action="uploadProfilePic">
        <div class="ui small modal" id="changePP">
            <div class="header">Change Profile Picture</div>
            <div class="content">
                    <input type = "file" name="pp" placeholder="Change"/>
                    <input type = "hidden" value="${ExtendedUser.findByUsername(sec.username()).id}" name = "userId"/>

            </div>
            <div class="actions">
                <input type="submit" value="Save" class="ui positive button"/>
                <div class="ui cancel negative button" id="cancelPP">Cancel</div>
            </div>
        </div>
        </g:form>
    </sec:ifLoggedIn>
        <br><br>
        <g:layoutBody/>
        <br><br>
    </div>
	</body>
</html>
