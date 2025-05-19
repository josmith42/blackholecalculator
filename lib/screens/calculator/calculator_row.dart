import 'package:blackholecalculator/providers/calculator/calculator_provider.dart';
import 'package:blackholecalculator/screens/calculator/mass_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalculatorRow extends ConsumerStatefulWidget {
  const CalculatorRow({super.key, required this.title});

  final String title;

  @override
  ConsumerState<CalculatorRow> createState() => CalculatorRowState();
}

class CalculatorRowState extends ConsumerState<CalculatorRow> {
  final TextEditingController controller = TextEditingController();

  CalculatorNotifier get _calculatorNotifier => ref.read(calculatorProvider.notifier);

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(calculatorProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.massValue != controller.text) {
        controller.text = state.massValue;
      }
    });

    return Row(
      spacing: 4,
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onSubmitted: (value) {
              _calculatorNotifier.setMassValue(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.title,
            ),
          ),
        ),
        DropdownMenu<MassLabel>(
          initialSelection: MassLabel.from(state.mass.defaultUnit),
          width: 100,
          dropdownMenuEntries:
              MassLabel.values
                  .map(
                    (label) => DropdownMenuEntry<MassLabel>(
                      label: label.label,
                      value: label,
                    ),
                  )
                  .toList(),
          onSelected: (value) {
            _calculatorNotifier.setMassUnit(value?.unit);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
