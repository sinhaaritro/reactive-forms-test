import 'package:reactive_forms/reactive_forms.dart';

/// Defines a custom value accessor that converts from String to int
/// and vice versa.
///
/// We use this valueAccessor when the FormControl() is of type int. FormControl<int>()
class PincodeValueAccessor extends ControlValueAccessor<int, String> {
  @override
  String? modelToViewValue(int? modelValue) {
    return modelValue == null ? '' : modelValue.toString();
  }

  @override
  int? viewToModelValue(String? viewValue) {
    return viewValue == null
        ? null
        : int.tryParse(viewValue.replaceAll(RegExp(r' '), ''));
  }
}
