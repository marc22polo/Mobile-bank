import 'package:flutter/material.dart';

class SelectionWindow extends StatefulWidget {
  final String title;
  final List<String> values;
  final int selectedValue;

  const SelectionWindow({
    super.key,
    required this.title,
    required this.values,
    this.selectedValue = 0,
  });

  @override
  State<SelectionWindow> createState() => _SelectionWindowState();
}

class _SelectionWindowState extends State<SelectionWindow> {
  int currSelectedValue = 0;

  @override
  Widget build(BuildContext context) {
    if (currSelectedValue == 0) {
      currSelectedValue = widget.selectedValue;
    }

    return AlertDialog.adaptive(
      title: Text(widget.title),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      actions: <Widget>[
        TextButton(
          child: Text(
            'CANCEL',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text(
            'OK',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onPressed: () => Navigator.pop(context, currSelectedValue),
        ),
      ],
      content: StatefulBuilder(builder: (context, setState) {
        return SingleChildScrollView(
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Divider(),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.values.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RadioListTile(
                            title: Text(widget.values[index]),
                            value: index,
                            groupValue: currSelectedValue,
                            onChanged: (value) {
                              currSelectedValue = index;
                              setState(() {
                                currSelectedValue;
                              });
                            });
                      }),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
