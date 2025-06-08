<!DOCTYPE html>
<html lang="es">
<head>
    <title>Sayrex | Login</title>
    @include('include.header')
</head>
<body class="login-page">
    <div class="auth-wrapper">
        <div class="auth-card">
            <div class="auth-logo">
                <a href="javascript:void(0);">
                    <img class="img-fluid" src="{{ url('images/logo.png') }}" alt="Inventory logo">
                </a>
            </div>
            <div class="auth-body">
                <form id="sign_in" method="POST" action="{{ route('login') }}">
                    {{ csrf_field() }}
                    <div class="auth-msg">Iniciar sesión</div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">person</i>
                        </span>
                        <div class="form-line">
                            <input type="text" class="form-control" name="email" placeholder="Correo electrónico" required autofocus>
                        </div>
                        @if ($errors->has('email'))
                            <span class="help-block">
                                <strong>{{ $errors->first('email') }}</strong>
                            </span>
                        @endif
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="material-icons">lock</i>
                        </span>
                        <div class="form-line">
                            <input type="password" class="form-control" name="password" placeholder="Contraseña" required>
                            @if ($errors->has('password'))
                                <span class="help-block">
                                    <strong>{{ $errors->first('password') }}</strong>
                                </span>
                            @endif
                        </div>
                    </div>
                    <div class="remember-wrapper">
                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }} id="rememberme" class="filled-in chk-col-pink">
                        <label for="rememberme">Recuérdame</label>
                    </div>
                    <button class="auth-button" type="submit">Ingresar</button>
                </form>
            </div>
        </div>
    </div>
@include('include.footer')
</body>
</html>