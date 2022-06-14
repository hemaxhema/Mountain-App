import 'package:flutter/material.dart';
import 'package:mountain_app/misc/colors.dart';
import 'package:provider/provider.dart';

import '../Provider.dart';

class NumberOfGroupWidget extends StatefulWidget {
  final int index;
  const NumberOfGroupWidget({Key? key, required this.index}) : super(key: key);
  @override
  _NumberOfGroupWidgetState createState() => _NumberOfGroupWidgetState();
}

class _NumberOfGroupWidgetState extends State<NumberOfGroupWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(
      builder: (context, provider, _) {
        return InkWell(
          onTap: () {
            provider.ChangeNumber(widget.index + 1);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 7.0, top: 7),
            child: Container(
              child: Center(
                child: Text(
                  "${widget.index + 1}",
                  style: TextStyle(
                      fontSize: 18,
                      color: provider.NumperOfGroubSelected - 1 == widget.index
                          ? Colors.white
                          : Colors.black),
                ),
              ),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: provider.NumperOfGroubSelected - 1 == widget.index
                    ? Colors.black
                    : AppColors.buttonBackground,
              ),
            ),
          ),
        );
      },
    );
  }
}
