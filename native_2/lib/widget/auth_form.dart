import 'package:flutter/material.dart';
import './img_picker.dart';
import 'dart:io';

class AuthForm extends StatefulWidget {
  final bool _isLoading;
  final Function(
    String email,
    String password,
    String username,
    File? image,
    bool isLogin,
  ) submit;
  AuthForm(
    this.submit,
    this._isLoading,
  );

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPW = '';
  File? _userImg;

  void setUserImg(File img) {
    _userImg = img;
  }

  void _trySubmit() {
    final isValid =
        _formKey.currentState!.validate(); //call validator in each formfield
    FocusScope.of(context).unfocus();

    if (_userImg == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please pick an image.'),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }
    if (isValid) {
      _formKey.currentState!.save(); //call onSave in each formfield
      widget.submit(
        _userEmail.trim(),
        _userPW.trim(),
        _userName.trim(),
        _userImg,
        _isLogin,
      );
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
                  if (!_isLogin) ImgPicker(setUserImg),
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
                  if (widget._isLoading) CircularProgressIndicator(),
                  if (!widget._isLoading)
                    ElevatedButton(
                      onPressed: _trySubmit,
                      child: Text(_isLogin ? 'Login' : 'Sign Up'),
                    ),
                  if (!widget._isLoading)
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
