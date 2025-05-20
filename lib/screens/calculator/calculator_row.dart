import 'package:blackholecalculator/providers/calculator/calculator_model.dart';
import 'package:blackholecalculator/screens/calculator/unit_wrapper.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter/material.dart';

class CalculatorRow<T extends Dimension> extends StatefulWidget {
  const CalculatorRow({
    super.key,
    required this.title,
    required this.measurement,
    required this.units,
    required this.onValueChanged,
    required this.onUnitChanged,
  });
  final String title;
  final Measurement<T> measurement;
  final List<Unit<T>> units;
  final void Function(String) onValueChanged;
  final void Function(Unit<T>) onUnitChanged;

  @override
  CalculatorRowState<T> createState() => CalculatorRowState<T>();
}
class CalculatorRowState<T extends Dimension> extends State<CalculatorRow<T>> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();


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
        widget.onValueChanged(_controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.measurement.defaultValueText != _controller.text) {
        _controller.text = widget.measurement.defaultValueText;
      }
    });

    return Row(
      spacing: 4,
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            onSubmitted: widget.onValueChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.title,
            ),
          ),
        ),
        DropdownMenu<UnitWrapper<T>>(
          initialSelection: UnitWrapper(widget.measurement.defaultUnit),
          width: 100,
          label: const Text('Unit'),
          dropdownMenuEntries:
              widget.units
                  .map(
                    (unit) => DropdownMenuEntry<UnitWrapper<T>>(
                      label: unit.toString(),
                      value: UnitWrapper(unit),
                    ),
                  )
                  .toList(),
          onSelected: (value) {
            if (value == null) return;
            widget.onUnitChanged(value.unit);
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
