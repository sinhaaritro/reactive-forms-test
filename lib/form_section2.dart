import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/data/location.dart';
import 'package:test_reactive_forms/data/user.dart';
import 'package:test_reactive_forms/form/date_time_value_accessor.dart';
import 'package:test_reactive_forms/form/form_data.dart';
import 'package:test_reactive_forms/form/pincode_formatter.dart';
import 'package:test_reactive_forms/form/pindoce_value_accessor.dart';

class FormSection2 extends ConsumerStatefulWidget {
  const FormSection2({
    super.key,
    required this.formGroup,
    required this.onUpdateCurrentPageIndex,
  });

  final FormGroup formGroup;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormSection2State();
}

class _FormSection2State extends ConsumerState<FormSection2> {
  FormGroup get formGroup => widget.formGroup;
  void Function(int) get onUpdateCurrentPageIndex =>
      widget.onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ReactiveRadioListTile<Gender>(
          key: Key(Gender.male.name),
          title: Text(Gender.male.humanReadableName),
          value: Gender.male,
          formControlName: FormStaticData.gender.field,
          onChanged: (control) => formGroup
              .control(FormStaticData.genderName.field)
              .markAsDisabled(),
        ),
        ReactiveRadioListTile<Gender>(
          key: Key(Gender.female.name),
          title: Text(Gender.female.humanReadableName),
          value: Gender.female,
          formControlName: FormStaticData.gender.field,
          onChanged: (control) => formGroup
              .control(FormStaticData.genderName.field)
              .markAsDisabled(),
        ),
        ReactiveRadioListTile<Gender>(
          key: Key(Gender.others.name),
          title: Text(Gender.others.humanReadableName),
          value: Gender.others,
          formControlName: FormStaticData.gender.field,
          onChanged: (control) => formGroup
              .control(FormStaticData.genderName.field)
              .markAsEnabled(),
        ),
        const SizedBox(height: 8),
        ReactiveTextField(
            key: Key(FormStaticData.genderName.key),
            formControlName: FormStaticData.genderName.field,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: FormStaticData.genderName.labelText,
              hintText: FormStaticData.genderName.hintText,
              helperText: ' ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validationMessages: {
              ValidationMessage.required: (error) =>
                  'If other is selected then the gender must not be empty',
            }),
        const SizedBox(height: 8),
        ReactiveTextField(
          formControlName: FormStaticData.dateOfBirth.field,
          valueAccessor: DateTimeValueAccessorCustom(),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: ReactiveDatePicker(
              formControlName: FormStaticData.dateOfBirth.field,
              firstDate: DateTime(1985),
              lastDate: DateTime.now(),
              builder: (context, picker, child) {
                return IconButton(
                  onPressed: picker.showPicker,
                  icon: const Icon(Icons.access_time),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        ReactiveDatePicker<DateTime>(
          formControlName: 'personnelInfo.date',
          firstDate: DateTime(1985),
          lastDate: DateTime(2030),
          builder: (context, picker, child) {
            Widget suffix = InkWell(
              onTap: () => picker.control.value = null,
              child: const Icon(Icons.clear),
            );

            if (picker.value == null) {
              suffix = const Icon(Icons.calendar_today);
            }

            return ReactiveTextField(
              onTap: (value) => picker.showPicker(),
              valueAccessor: DateTimeValueAccessor(),
              formControlName: 'personnelInfo.date',
              readOnly: true,
              validationMessages: {
                ValidationMessage.required: (error) =>
                    'If Date of Birth must be present',
              },
              decoration: InputDecoration(
                labelText: FormStaticData.dateOfBirth.labelText,
                hintText: FormStaticData.dateOfBirth.hintText,
                helperText: ' ',
                suffixIcon: suffix,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 8.0),
        ReactiveDropdownField<Country>(
          formControlName: FormStaticData.currentCountry.field,
          decoration: InputDecoration(
            labelText: FormStaticData.currentCountry.labelText,
            hintText: FormStaticData.currentCountry.hintText,
            helperText: ' ',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          items: countries
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
          onChanged: (control) => setState(() => formGroup
              .control(FormStaticData.currentState.field)
              .value = null),
        ),
        const SizedBox(height: 8.0),
        ReactiveDropdownField<CountryState>(
          formControlName: FormStaticData.currentState.field,
          decoration: InputDecoration(
            labelText: FormStaticData.currentState.labelText,
            hintText: FormStaticData.currentState.hintText,
            helperText: ' ',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          items: states
              .where((e) {
                Country? selectedCountry = formGroup
                    .control(FormStaticData.currentCountry.field)
                    .value as Country?;
                return selectedCountry == null || e.country == selectedCountry;
              })
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
        ),
        const SizedBox(height: 8.0),
        ReactiveTextField(
            key: Key(FormStaticData.currentAddress1.key),
            formControlName: FormStaticData.currentAddress1.field,
            textInputAction: TextInputAction.next,
            onSubmitted: (control) =>
                formGroup.focus(FormStaticData.currentAddress2.field),
            decoration: InputDecoration(
              labelText: FormStaticData.currentAddress1.labelText,
              hintText: FormStaticData.currentAddress1.hintText,
              helperText: ' ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            )),
        const SizedBox(height: 8.0),
        ReactiveTextField(
            key: Key(FormStaticData.currentAddress2.key),
            formControlName: FormStaticData.currentAddress2.field,
            textInputAction: TextInputAction.next,
            onSubmitted: (control) =>
                formGroup.focus(FormStaticData.currentPincode.field),
            decoration: InputDecoration(
              labelText: FormStaticData.currentAddress2.labelText,
              hintText: FormStaticData.currentAddress2.hintText,
              helperText: ' ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            )),
        const SizedBox(height: 8.0),
        ReactiveTextField(
            key: Key(FormStaticData.currentPincode.key),
            formControlName: FormStaticData.currentPincode.field,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            valueAccessor: PincodeValueAccessor(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(6 + (1 * 1)),
              PinCodeFormatter(separator: ' '),
            ],
            decoration: InputDecoration(
              labelText: FormStaticData.currentPincode.labelText,
              hintText: FormStaticData.currentPincode.hintText,
              helperText: ' ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            )),
        const SizedBox(height: 8.0),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: () => onUpdateCurrentPageIndex(2),
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
