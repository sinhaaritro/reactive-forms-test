import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

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
              onPressed: () => onUpdateCurrentPageIndex(2),
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
