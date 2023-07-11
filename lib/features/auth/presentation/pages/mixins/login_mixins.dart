part of 'package:test_app/features/auth/presentation/pages/login_page.dart';

mixin LoginMixin on State<LoginPageBody> {
  late LoginBloc _bloc;
  late GlobalKey<FormState> _formKey;
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();


  void _init() {
    _formKey = GlobalKey<FormState>();
    _bloc = context.read<LoginBloc>();
  }
  void _login() {
    bool isValid = _formKey.currentState?.validate() ?? false;
    if(!isValid) return;

    String username = _usernameController.text;
    String password = _passwordController.text;

    final user = LoginRequestEntity(
      username: username,
      password: password,
    );
    _bloc.add(LoginUserEvent(user));
  }

  void _dispose() {
    _bloc.close();
  }
}
