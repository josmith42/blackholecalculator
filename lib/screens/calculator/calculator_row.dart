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
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  CalculatorNotifier get _calculatorNotifier =>
      ref.read(calculatorProvider.notifier);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        _controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _controller.text.characters.length,
        );
      } else {
        _calculatorNotifier.setMassValue(_controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(calculatorProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (state.massValue != _controller.text) {
        _controller.text = state.massValue;
      }
    });

    return Row(
      spacing: 4,
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
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
          label: const Text('Unit'),
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
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
