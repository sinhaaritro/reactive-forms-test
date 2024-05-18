import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/form/unique_email_async_validator.dart';

extension CustomValidators on Validators {
  /// Creates a validator that checks is the email is valid in the server
  static AsyncValidator<dynamic> get uniqueAsyncEmail =>
      UniqueEmailAsyncValidator();
}
