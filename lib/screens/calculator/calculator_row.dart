import 'package:blackholecalculator/providers/calculator/calculator_model.dart';
import 'package:blackholecalculator/widgets/bh_dropdown_menu.dart';
import 'package:blackholecalculator/widgets/bh_text_field.dart';
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
          child: BHTextField(
            title: widget.title,
            controller: _controller,
            onValueChanged: (value) {
              widget.onValueChanged(value);
            },
          ),
        ),
        BhDropdownMenu(
          unitsList: widget.units,
          initialSelection: widget.measurement.defaultUnit,
          width: 100,
          onUnitChanged: (unit) {
            widget.onUnitChanged(unit);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}