import 'package:blackholecalculator/calc/unit_lists.dart';
import 'package:blackholecalculator/providers/chart/edit_chart_settings_data.dart';
import 'package:blackholecalculator/widgets/bh_dropdown_menu.dart';
import 'package:blackholecalculator/widgets/bh_text_field.dart';
import 'package:fling_units/fling_units.dart';
import 'package:flutter/material.dart';

class EditChartSettingsDialog extends StatefulWidget {
  const EditChartSettingsDialog({
    super.key,
    required this.editChartSettingsData,
    required this.onSettingsSelected,
  });

  final EditChartSettingsData editChartSettingsData;
  final void Function(EditChartSettingsData) onSettingsSelected;

  @override
  State<StatefulWidget> createState() => _EditChartSettingsDialogState();
}

class _EditChartSettingsDialogState extends State<EditChartSettingsDialog> {
  final startValueController = TextEditingController();
  final endValueController = TextEditingController();
  Unit<Mass>? massUnit;
  Unit<Distance>? schwarzschildRadiusUnit;

  @override
  Widget build(BuildContext context) {
    startValueController.text = widget.editChartSettingsData.startValue;
    endValueController.text = widget.editChartSettingsData.endValue;
    massUnit = widget.editChartSettingsData.massUnit;
    schwarzschildRadiusUnit =
        widget.editChartSettingsData.schwarzschildRadiusUnit;

    return AlertDialog(
      title: Text('Chart Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12,
        children: [
          BHTextField(title: 'Start Mass', controller: startValueController),
          BHTextField(title: 'End Mass', controller: endValueController),
          BhDropdownMenu<Mass>(
            unitsList: massUnitsList,
            initialSelection: massUnit ?? massUnitsList.first,
            title: 'Mass Unit',
            onUnitChanged: (newUnit) {
              massUnit = newUnit;
            },
            width: double.infinity,
          ),
          SizedBox(
            height: 12,
          ),
          BhDropdownMenu(
            unitsList: distanceUnitsList,
            initialSelection:
                schwarzschildRadiusUnit ?? distanceUnitsList.first,
            title: 'Schwarzschild Radius Unit',
            onUnitChanged: (newUnit) {
              schwarzschildRadiusUnit = newUnit;
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
            widget.onSettingsSelected(
              EditChartSettingsData(
                startValue: startValueController.text,
                endValue: endValueController.text,
                massUnit: massUnit ?? widget.editChartSettingsData.massUnit,
                schwarzschildRadiusUnit:
                    schwarzschildRadiusUnit ??
                    widget.editChartSettingsData.schwarzschildRadiusUnit,
              ),
            );
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
