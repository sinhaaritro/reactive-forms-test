import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/form/extension/validation_message_extension.dart';

/// Validator that validates the user's email is unique, sending a request to
/// the Server.
class UniqueEmailAsyncValidator extends AsyncValidator<dynamic> {
  @override
  Future<Map<String, dynamic>?> validate(
      AbstractControl<dynamic> control) async {
    final error = <String, dynamic>{
      CustomValidationMessage.uniqueAsyncEmail: false
    };

    final isUniqueEmail = await _getIsUniqueEmail(control.value.toString());
    if (!isUniqueEmail) {
      control.markAsTouched();
      return error;
    }

    return null;
  }

  /// Simulates a time consuming operation (i.e. a Server request)
  Future<bool> _getIsUniqueEmail(String email) {
    // simple array that simulates emails stored in the Server DB.
    final storedEmails = ['johndoe@email.com', 'john@email.com'];

    return Future.delayed(
      const Duration(seconds: 2),
      () => !storedEmails.contains(email),
    );
  }
}
