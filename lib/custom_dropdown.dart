import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<TagModel> tagList;
  final String labelText;

  const CustomDropDown({
    Key? key,
    required this.tagList,
    this.labelText = 'Label',
  }) : super(key: key);

  @override
  _CustomDropDownState createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  ExpandableController? controller;

  List<TagModel> get tagModelListSelected =>
      widget.tagList.where((e) => e.selected == true).toList();

  @override
  void initState() {
    controller = ExpandableController(initialExpanded: false);
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      controller: controller,
      child: ScrollOnExpand(
        child: PhysicalModel(
          color: Colors.white,
          child: Expandable(
            ///collapsed
            collapsed: Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.labelText,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Wrap(
                          children: List.generate(
                            tagModelListSelected.length,
                            (index) => InputChip(
                              label: Text(tagModelListSelected[index].label!),
                              onPressed: () {
                                setState(() {
                                  tagModelListSelected[index].selected =
                                      !tagModelListSelected[index].selected;
                                });
                              },
                              onDeleted: () {},
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller!.toggle();
                        },
                        icon: Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Color.fromRGBO(0, 106, 106, 1),
                  ),
                ],
              ),
            ),

            ///expanded
            expanded: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.labelText),
                      Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              children: List.generate(
                                tagModelListSelected.length,
                                (index) => InputChip(
                                  label:
                                      Text(tagModelListSelected[index].label!),
                                  onPressed: () {
                                    setState(() {
                                      tagModelListSelected[index].selected =
                                          !tagModelListSelected[index].selected;
                                    });
                                  },
                                  onDeleted: () {},
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              controller!.toggle();
                            },
                            icon: Icon(Icons.keyboard_arrow_down),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Color.fromRGBO(0, 106, 106, 1),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: List.generate(
                    widget.tagList.length,
                    (index) => FlatButton(
                      color: widget.tagList[index].selected
                          ? Colors.grey[200]
                          : Colors.transparent,
                      onPressed: () {
                        setState(() {
                          widget.tagList[index].selected =
                              !widget.tagList[index].selected;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          widget.tagList[index].label!,
                          style: TextStyle(
                            color: widget.tagList[index].selected
                                ? Colors.black
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TagModel {
  int? id;
  String? label;
  bool selected;

  TagModel({
    this.id,
    this.label,
    this.selected = false,
  });

  @override
  String toString() {
    return 'TagModel{$label, selected: $selected}';
  }
}
