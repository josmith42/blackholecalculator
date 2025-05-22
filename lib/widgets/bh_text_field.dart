import 'package:flutter/material.dart';

class BHTextField extends StatefulWidget {
  BHTextField({
    super.key,
    required this.title,
    this.onValueChanged,
    controller,
  }) : _controller = controller ?? TextEditingController(),
       controllerOwned = controller == null;

  final String title;
  final TextEditingController _controller;
  final void Function(String)? onValueChanged;
  final bool controllerOwned;

  @override
  State<BHTextField> createState() => _BHTextFieldState();
}

class _BHTextFieldState extends State<BHTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        widget._controller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: widget._controller.text.characters.length,
        );
      } else {
        widget.onValueChanged??(widget._controller.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._controller,
      focusNode: _focusNode,
      onSubmitted: widget.onValueChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: widget.title,
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controllerOwned) {
      widget._controller.dispose();
    }
    super.dispose();
  }
}
