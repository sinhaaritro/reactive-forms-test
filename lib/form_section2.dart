import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/form_data.dart';
import 'package:test_reactive_forms/user.dart';

class FormSection2 extends ConsumerWidget {
  const FormSection2({
    super.key,
    required this.formGroup,
    required this.onUpdateCurrentPageIndex,
  });

  final FormGroup formGroup;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ReactiveRadioListTile<Gender>(
          key: Key(Gender.male.name),
          title: Text(Gender.male.name),
          value: Gender.male,
          formControlName: FormStaticData.gender.field,
          onChanged: (control) => formGroup
              .control(FormStaticData.genderName.field)
              .markAsDisabled(),
        ),
        ReactiveRadioListTile<Gender>(
          key: Key(Gender.female.name),
          title: Text(Gender.female.name),
          value: Gender.female,
          formControlName: FormStaticData.gender.field,
          onChanged: (control) => formGroup
              .control(FormStaticData.genderName.field)
              .markAsDisabled(),
        ),
        ReactiveRadioListTile<Gender>(
          key: Key(Gender.others.name),
          title: Text(Gender.others.name),
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
        // ReactiveTextField(
        //   formControlName: 'dateOfBirth',
        //   valueAccessor: DateTimeValueAccessor(),
        //   decoration: InputDecoration(
        //     border: InputBorder.none,
        //     suffixIcon: ReactiveDatePicker(
        //       formControlName: 'dateOfBirth',
        //       firstDate: DateTime(1985),
        //       lastDate: DateTime.now(),
        //       builder: (context, picker, child) {
        //         return IconButton(
        //           onPressed: picker.showPicker,
        //           icon: const Icon(Icons.access_time),
        //         );
        //       },
        //     ),
        //   ),
        // ),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: () {
                print(formGroup.valid);
                print(formGroup.value);
                // onUpdateCurrentPageIndex(2);
              },
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
