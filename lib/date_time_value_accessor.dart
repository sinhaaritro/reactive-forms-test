import 'package:reactive_forms/reactive_forms.dart';

/// Defines a custom value accessor that converts from String to DateTime
/// and vice versa.
class DateTimeValueAccessor extends ControlValueAccessor<DateTime, String> {
  @override
  String? modelToViewValue(DateTime? modelValue) {
    return modelValue == null
        ? ''
        : '${modelValue.year}-${modelValue.month}-${modelValue.day}';
  }

  @override
  DateTime? viewToModelValue(String? viewValue) {
    return (viewValue == null || viewValue.isEmpty)
        ? null
        : DateTime.parse(viewValue);
  }
}
