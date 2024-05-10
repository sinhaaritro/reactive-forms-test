import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormSection3 extends ConsumerWidget {
  const FormSection3({super.key, required this.formGroup});

  final FormGroup formGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        
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
              onPressed: () {},
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
