import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'sign_up_widget.dart' show SignUpWidget;
import 'package:flutter/material.dart';

class SignUpModel extends FlutterFlowModel<SignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for EmailAddressSignUp widget.
  FocusNode? emailAddressSignUpFocusNode;
  TextEditingController? emailAddressSignUpTextController;
  String? Function(BuildContext, String?)?
      emailAddressSignUpTextControllerValidator;
  String? _emailAddressSignUpTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email address is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  // State field(s) for UsernameSignUp widget.
  FocusNode? usernameSignUpFocusNode;
  TextEditingController? usernameSignUpTextController;
  String? Function(BuildContext, String?)?
      usernameSignUpTextControllerValidator;
  String? _usernameSignUpTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Username is required';
    }

    if (val.length < 3) {
      return 'Username must be at least 3 characters';
    }

    if (!RegExp(kTextValidatorUsernameRegex).hasMatch(val)) {
      return 'Must start with a letter and can only contain letters, digits and - or _.';
    }
    return null;
  }

  // State field(s) for PasswordSignUp widget.
  FocusNode? passwordSignUpFocusNode;
  TextEditingController? passwordSignUpTextController;
  late bool passwordSignUpVisibility;
  String? Function(BuildContext, String?)?
      passwordSignUpTextControllerValidator;
  String? _passwordSignUpTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Password is required';
    }

    if (val.length < 8) {
      return 'The password must be at least 8 characters long';
    }

    if (!RegExp('^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@\$!%*?&]).*\$')
        .hasMatch(val)) {
      return '\"Requires: uppercase, lowercase, number & symbol.\"';
    }
    return null;
  }

  // State field(s) for ConfirmPasswordSignUp widget.
  FocusNode? confirmPasswordSignUpFocusNode;
  TextEditingController? confirmPasswordSignUpTextController;
  late bool confirmPasswordSignUpVisibility;
  String? Function(BuildContext, String?)?
      confirmPasswordSignUpTextControllerValidator;
  String? _confirmPasswordSignUpTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Confirm Password is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressSignUpTextControllerValidator =
        _emailAddressSignUpTextControllerValidator;
    usernameSignUpTextControllerValidator =
        _usernameSignUpTextControllerValidator;
    passwordSignUpVisibility = false;
    passwordSignUpTextControllerValidator =
        _passwordSignUpTextControllerValidator;
    confirmPasswordSignUpVisibility = false;
    confirmPasswordSignUpTextControllerValidator =
        _confirmPasswordSignUpTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressSignUpFocusNode?.dispose();
    emailAddressSignUpTextController?.dispose();

    usernameSignUpFocusNode?.dispose();
    usernameSignUpTextController?.dispose();

    passwordSignUpFocusNode?.dispose();
    passwordSignUpTextController?.dispose();

    confirmPasswordSignUpFocusNode?.dispose();
    confirmPasswordSignUpTextController?.dispose();
  }
}
