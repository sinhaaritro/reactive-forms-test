import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_reactive_forms/data/location.dart';
import 'package:test_reactive_forms/data/user.dart';

part 'form_data.g.dart';

/// Hold all information needed to make a [FormGroup].
class FormFieldGroup {
  final String key;
  final String name;

  FormFieldGroup({required this.key, String? name}) : name = name ?? key;
}

/// Hold all information needed to make a [FormControl].
///
/// For [FormArray], put the type of control. Let the actual [FormGroup] to
/// define it is an array.
/// For [FormGroup], used [FormFieldGroup].
///
class FormField<T> {
  ///  This is the name of the [FormControl], that is used by [FormGroup] to
  /// find the control.
  final String key;

  ///  In case the [FormControl] is part of group, then [fullName] will be used
  /// instead of [key]
  /// Example:
  /// Create Static Data:
  /// static FormFieldGroup user = FormFieldGroup(key: 'user');
  /// static FormField<String> userName = FormField(
  ///     key: 'userName',
  ///     name: '${FormStaticData.user.name}.userName',
  ///     control: FormControl(      ));
  /// static FormField<String> email = FormField(
  ///     key: 'email',
  ///    name: '${FormStaticData.user.name}.email',
  ///     control: FormControl<String>());
  ///
  /// Create a Control:
  ///  FormStaticData.systemInfo.key: FormGroup({
  ///   FormStaticData.usename.key: FormStaticData.usename.control,
  ///   FormStaticData.email.key: FormStaticData.email.control,
  /// })
  ///
  /// Usage:
  /// ```dart
  /// ReactiveTextField(
  ///   formControlName: FormStaticData.userName.fullName,
  ///   onSubmitted: (control) => formGroup.focus(FormStaticData.email.fullName),
  /// )
  /// `
  final String fullName;
  final FormControl<T> control;
  final String labelText;
  final String hintText;

  FormField({
    required this.key,
    required this.control,
    String? name,
    String? labelText,
    String? hintText,
  })  : fullName = name ?? key,
        labelText = labelText ?? key,
        hintText = hintText ?? labelText ?? key;
}

/// Holds all values of [FormControl] and [FormGroup]
///
/// Tip: Only create [FormGroup] when partial validation is needed,
/// or some other reason.
/// Dont create to just visually group data. This is create unnessary problems
/// with naming and accessing controls. Example: The form control name cannot
/// have dot('.') in the name. Now if we have group then we have to construct
/// fullname from parent group name's and the current name.
///
/// Example: No Group
/// To create a control:
/// 'userName': FormControl<String>()
/// 'email': FormControl<String>()
///
/// Usage:
/// ```dart
/// ReactiveTextField(
///   formControlName: 'userName',
///   onSubmitted: (control) => formGroup.focus('email'),
/// )
/// `
///
/// Example: Group
/// To create a control:
/// 'user': FormGroup({
///   'userName': FormControl<String>()
///   'email': FormControl<String>()
/// })

///
/// Usage:
/// ```dart
/// ReactiveTextField(
///   formControlName: 'user.userName',
///   onSubmitted: (control) => formGroup.focus('user.email'),
/// )
/// `
/// We can avoid user.userName with no groups
class FormStaticData {
  // System Info
  static FormFieldGroup systemInfo = FormFieldGroup(key: 'systemInfo');
  static FormField<String> userName = FormField(
      key: 'userName',
      name: '${FormStaticData.systemInfo.name}.userName',
      control: FormControl(
          // validators: [
          //   Validators.required,
          //   Validators.minLength(3),
          // ],
          ),
      hintText: 'Enter username',
      labelText: 'Username');
  static FormField<String> email = FormField(
      key: 'email',
      name: '${FormStaticData.systemInfo.name}.email',
      control: FormControl<String>(
          // validators: [
          //   Validators.required,
          //   Validators.email,
          // ],
          // asyncValidators: [UniqueEmailAsyncValidator()],
          // asyncValidatorsDebounceTime: 1000,
          ),
      hintText: 'Enter email',
      labelText: 'Email');
  static FormField<String> password = FormField(
      key: 'password',
      name: '${FormStaticData.systemInfo.name}.password',
      control: FormControl<String>(
          // validators: [
          //   Validators.required,
          //   Validators.minLength(2),
          // ],
          ),
      hintText: 'Enter password',
      labelText: 'Password');
  static FormField<String> passwordConfirm = FormField(
      key: 'passwordConfirm',
      control: FormControl<String>(),
      name: '${FormStaticData.systemInfo.name}.passwordConfirm',
      hintText: 'Enter password again',
      labelText: 'Confirm Password');

  // Personal Info
  static FormFieldGroup personnelInfo = FormFieldGroup(key: 'personnelInfo');
  static FormField<Gender> gender = FormField(
      key: 'gender',
      name: '${FormStaticData.personnelInfo.name}.gender',
      control: FormControl<Gender>(
          // validators: [
          //   Validators.required,
          // ],
          ));
  static FormField<String> genderName = FormField(
      key: 'genderName',
      name: '${FormStaticData.personnelInfo.name}.genderName',
      control: FormControl<String>(
          // disabled: true,
          // validators: [
          //   Validators.required,
          // ],
          ),
      hintText: 'Enter Gender Name',
      labelText: 'Enter Gender Name');
  static FormField<DateTime> dateOfBirth = FormField(
      key: 'dateOfBirth',
      name: '${FormStaticData.personnelInfo.name}.dateOfBirth',
      control: FormControl<DateTime>(
          // validators: [
          //   Validators.required,
          // ],
          ),
      hintText: 'YYYY-MM-DD',
      labelText: 'Enter Date of Birth');
  static FormField<Country> currentCountry = FormField(
      key: 'currentCountry',
      name: '${FormStaticData.personnelInfo.name}.currentCountry',
      control: FormControl<Country>(
          // validators: [
          //   Validators.required,
          // ],
          ),
      hintText: 'Enter Current Country',
      labelText: 'Enter Current Country');
  static FormField<CountryState> currentState = FormField(
      key: 'currentState',
      name: '${FormStaticData.personnelInfo.name}.currentState',
      control: FormControl<CountryState>(
          // validators: [
          //   Validators.required,
          // ],
          ),
      hintText: 'Enter Current State',
      labelText: 'Enter Current State');
  static FormField<String> currentAddress1 = FormField(
      key: 'currentAddress1',
      name: '${FormStaticData.personnelInfo.name}.currentAddress1',
      control: FormControl<String>(),
      hintText: 'Enter Address Line 1',
      labelText: 'Enter Address Line 1');
  static FormField<String> currentAddress2 = FormField(
      key: 'currentAddress2',
      name: '${FormStaticData.personnelInfo.name}.currentAddress2',
      control: FormControl<String>(),
      hintText: 'Enter Address Line 2',
      labelText: 'Enter Address Line 2');
  static FormField<int> currentPincode = FormField(
      key: 'currentPincode',
      name: '${FormStaticData.personnelInfo.name}.currentPincode',
      control: FormControl<int>(),
      hintText: 'Enter current Pincode',
      labelText: 'Enter current Pincode');

  // Contact Info
  static FormFieldGroup contactInfo = FormFieldGroup(key: 'contactInfo');
  static FormField<String> emailOrPhone = FormField(
      key: 'emailOrPhone',
      name: '${FormStaticData.contactInfo.name}.emailOrPhone',
      control: FormControl<String>(
          // validators: [
          //   Validators.composeOR(
          //     [
          //       Validators.email,
          //       Validators.pattern(r'/\d/g'),
          //     ],
          //   )
          ),
      hintText: 'Enter alternate email or phone number',
      labelText: 'Enter alternate email or phone number');

  // Family Info
  static FormFieldGroup familyInfo = FormFieldGroup(key: 'familyInfo');

  // Final Check
  static FormFieldGroup finalCheck = FormFieldGroup(key: 'finalCheck');
  static FormField acceptTerms = FormField(
      key: 'acceptTerms',
      name: '${FormStaticData.finalCheck.name}.acceptTerms',
      control: FormControl<bool>(
          // validators: [Validators.required],
          ));
}

@riverpod
class FormData extends _$FormData {
  @override
  FormGroup build({String? email}) {
    // // Forced Delay to make sure the call happens. Shouldnt be a problem when
    // // we are dealing with actual data with Async Call
    if (email != null) {
      Future.delayed(
          const Duration(milliseconds: 1), () async => _loadData(email: email));
    }

    final Map<String, AbstractControl<dynamic>> testvar = {
      FormStaticData.userName.key: FormStaticData.userName.control
        ..patchValue(null)
    };
    return FormGroup(
      {
        FormStaticData.systemInfo.key: FormGroup({
          ...testvar,
          FormStaticData.email.key: FormStaticData.email.control,
          FormStaticData.password.key: FormStaticData.password.control,
          FormStaticData.passwordConfirm.key:
              FormStaticData.passwordConfirm.control,
        }),
        FormStaticData.personnelInfo.key: FormGroup({
          FormStaticData.gender.key: FormStaticData.gender.control,
          FormStaticData.genderName.key: FormStaticData.genderName.control,
          FormStaticData.dateOfBirth.key: FormStaticData.dateOfBirth.control,
          'date': FormControl<DateTime>(
              // validators: [
              //   Validators.required,
              // ],
              ),
          FormStaticData.currentCountry.key:
              FormStaticData.currentCountry.control,
          FormStaticData.currentState.key: FormStaticData.currentState.control,
          FormStaticData.currentAddress1.key:
              FormStaticData.currentAddress1.control,
          FormStaticData.currentAddress2.key:
              FormStaticData.currentAddress2.control,
          FormStaticData.currentPincode.key:
              FormStaticData.currentPincode.control,
        }),
        FormStaticData.contactInfo.key: FormGroup({
          FormStaticData.emailOrPhone.key: FormArray<String>(
              [FormStaticData.emailOrPhone.control..patchValue('a@g.cm')]),
        }),
        FormStaticData.finalCheck.key: FormGroup({
          FormStaticData.acceptTerms.key: FormStaticData.acceptTerms.control,
        }),
      },
      // validators: [
      //   Validators.mustMatch(FormStaticData.password.field,
      //       FormStaticData.passwordConfirm.field),
      // ],
    );
  }

  FutureOr<void> _loadData({String? email}) async {
    state = FormGroup({});
  }

  // void resetForm({String? email}) {
  //   _loadData(email:email);
  // }

  // FutureOr<void> submitForm() async {
  //   try {
  //     // TODO(AS): FINAL VALIDATION
  //     // Validate
  //     // if (false){
  //     // state = FormStateReady();
  //     // }
  // }
}
