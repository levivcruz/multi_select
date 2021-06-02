import 'package:flutter/material.dart';
import 'custom_dropdown.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<TagModel> labelOptions = [
      TagModel(label: 'Field 1'),
      TagModel(label: 'Field 2'),
      TagModel(label: 'Field 3'),
      TagModel(label: 'Field 4'),
      TagModel(label: 'Field 5'),
      TagModel(label: 'Field 6'),
      TagModel(label: 'Field 7'),
      TagModel(label: 'Field 8'),
      TagModel(label: 'Field 9'),
      TagModel(label: 'Field 10'),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDown(labelText: 'Label', tagList: labelOptions),
            SizedBox(height: 20),
            CustomDropDown(labelText: 'Label', tagList: labelOptions),
            ElevatedButton(
              onPressed: () {
                print(
                  labelOptions.where((element) => element.selected == true),
                );
              },
              child: Text("teste"),
            )
          ],
        ),
      ),
    );
  }
}
