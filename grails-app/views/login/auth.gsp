<html>
<head>
	<meta name='layout' content='main'/>
	<title>Login</title>
</head>
<body>
<div class="login-card card">
    <div class="card-content">
        <span class="card-title grey-text text-darken-4">Login</span>
        <form action='${postUrl}' method='POST' autocomplete='off'>
            <div class="row">
                <div class="input-field col s12">
                    <input type='text' class='validate' name='j_username' id='username'/>
                    <label for="username">Username</label>
                </div>
            </div>
            <div class="row">
                <div class="input-field col s12">
                    <input class="validate" type="password" name='j_password' id='password'/>
                    <label for="password">Password</label>
                </div>
            </div>
            <div class="mdl-card__actions mdl-card--border">
                <g:link controller="user" action="register" class="btn waves-effect waves-light green accent-3" type="submit">
                    Register
                </g:link>&nbsp;&nbsp;If not yet logged in.
                <button class="login-button btn waves-effect waves-light green accent-3" type="submit">
                    Login
                </button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
