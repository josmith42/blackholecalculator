import 'package:blackholecalculator/providers/chart/edit_chart_settings_data.dart';
import 'package:blackholecalculator/widgets/bh_dropdown_menu.dart';
import 'package:blackholecalculator/widgets/bh_text_field.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter/material.dart';

class EditChartSettingsDialog<T extends Dimension> extends StatefulWidget {
  const EditChartSettingsDialog({
    super.key,
    required this.startValue,
    required this.endValue,
    required this.unitsList,
  });

  final Measurement<T> startValue;
  final Measurement<T> endValue;
  final List<Unit<T>> unitsList;

  @override
  State<StatefulWidget> createState() => _EditChartSettingsDialogState<T>();
}

class _EditChartSettingsDialogState<T extends Dimension>
    extends State<EditChartSettingsDialog<T>> {
  final startValueController = TextEditingController();
  final endValueController = TextEditingController();
  Unit<T>? unit;

  @override
  Widget build(BuildContext context) {
    startValueController.text = widget.startValue.defaultValue.toString();
    endValueController.text = widget.endValue.defaultValue.toString();
    unit = widget.startValue.defaultUnit;

    return AlertDialog(
      title: Text('Chart Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          BHTextField(title: 'Start Mass', controller: startValueController),
          BHTextField(title: 'End Mass', controller: endValueController),
          BhDropdownMenu(
            unitsList: widget.unitsList,
            initialSelection: widget.startValue.defaultUnit,
            onUnitChanged: (newUnit) {
              unit = newUnit;
            },
            width: double.infinity,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(
              EditChartSettingsData<T>(
                startValue: startValueController.text,
                endValue: endValueController.text,
                unit: unit ?? widget.startValue.defaultUnit,
              ),
            );
          },
          child: Text('OK'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    startValueController.dispose();
    endValueController.dispose();
    super.dispose();
  }
}
