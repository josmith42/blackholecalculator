import 'package:blackholecalculator/screens/calculator/unit_label.dart';
import 'package:flutter/material.dart';

class CalculatorRow extends StatefulWidget {
  const CalculatorRow({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return CalculatorRowState();
  }
}

class CalculatorRowState extends State<CalculatorRow> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 4,
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.title,
            ),
          ),
        ),
        DropdownMenu<UnitLabel>(
          initialSelection: UnitLabel.meters,
          width: 100,
          dropdownMenuEntries: UnitLabel.values
              .map((label) => DropdownMenuEntry<UnitLabel>(
                    label: label.label,
                    value: label,
                  ))
              .toList(),
          onSelected: (value) {
            // Handle unit selection
          },
        ),
      ],
    );
  }
}
