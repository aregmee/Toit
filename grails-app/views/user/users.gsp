<%--
  Created by IntelliJ IDEA.
  User: asimsangram
  Date: 1/2/16
  Time: 5:56 PM
--%>

<%@ page import="toit.Follow;toit.ExtendedUser" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Search Result</title>
</head>

<body>
<div class="ui cards">
    <g:each in="${users}" var="user" status="i">
            <div class="card">
                <div class="content">
                    <div class="header"><asset:image class = "avatar" src="me.jpg"/>&nbsp;&nbsp;${users.get(i).firstName + " " +  users.get(i).lastName}</div>
                    <div class="description">
                        ${users.get(i).bio}
                    </div>
                </div>
                <div class="ui bottom attached">
                    <g:form action="follow">
                        <g:hiddenField name="userToFollow" value="${users.get(i).id}"/>
                        <g:if test="${Follow.findByFollowerAndFollowing(ExtendedUser.findByUsername(sec.username()), users.get(i))}">
                            <a class="follow-button btn waves-effect disabled">
                                +Follow
                            </a>
                        </g:if>
                        <g:else>
                        <button class="follow-button btn waves-effect waves-light green accent-3" type="submit" name="action">
                            +Follow
                        </button>
                        </g:else>
                    </g:form>
                </div>
            </div>
    </g:each>
</div>
</body>
</html>