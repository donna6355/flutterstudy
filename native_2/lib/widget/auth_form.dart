import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPW = '';

  void _trySubmit() {
    final isValid =
        _formKey.currentState!.validate(); //call validator in each formfield
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save(); //call onSave in each formfield
      print(_userEmail);
      print(_userName);
      print(_userPW);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (val) {
                      if (val!.isEmpty || !val.contains('@'))
                        return 'Please enter valid email address.';
                      return null;
                    },
                    onSaved: (val) {
                      _userEmail = val!;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                    ),
                  ),
                  if (!_isLogin) //to avoid bug, need to bind key, ValueKey is hardcodable!
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (val) {
                        if (val!.isEmpty || val.length < 4)
                          return 'Please enter at least 4 characters.';
                        return null;
                      },
                      onSaved: (val) {
                        _userName = val!;
                      },
                      decoration: InputDecoration(
                        labelText: 'User Name',
                      ),
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (val) {
                      if (val!.isEmpty || val.length < 6)
                        return 'Password must be at least 6 characters long.';
                      return null;
                    },
                    onSaved: (val) {
                      _userPW = val!;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _trySubmit,
                    child: Text(_isLogin ? 'Login' : 'Sign Up'),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          _isLogin = !_isLogin;
                        });
                      },
                      child: Text(_isLogin
                          ? 'Create new account'
                          : 'I already have an account'))
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
