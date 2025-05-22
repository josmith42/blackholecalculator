import 'package:blackholecalculator/widgets/bh_dropdown_menu.dart';
import 'package:blackholecalculator/widgets/bh_text_field.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter/material.dart';

void showEditChartSettingsDialog<T extends Dimension>(
  BuildContext context,
  Measurement<T> startMass,
  Measurement<T> endMass,
  List<Unit<T>> unitsList,
) async {
  await showDialog(
    context: context,
    builder: (context) => EditChartSettingsDialog(startValue: startMass, endValue: endMass, unitsList: unitsList),
  );

  // startMassController.dispose();
  // endMassController.dispose();
}

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
  State<StatefulWidget> createState() => _EditChartSettingsDialogState();
}

class _EditChartSettingsDialogState extends State<EditChartSettingsDialog> {
  final startValueController = TextEditingController();
  final endValueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    startValueController.text = widget.startValue.defaultValue.toString();
    endValueController.text = widget.endValue.defaultValue.toString();

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
            onUnitChanged: (_) {},
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
            Navigator.of(context).pop();
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
