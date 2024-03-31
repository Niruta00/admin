import 'package:adminapp/view/question_list.dart';
import 'package:flutter/material.dart';

import 'question_form.dart';

class SetListScreen extends StatefulWidget {
  @override
  _SetListScreenState createState() => _SetListScreenState();
}

class _SetListScreenState extends State<SetListScreen> {
  List<int> sets = [];

  TextEditingController newSetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set List'),
      ),
      body: ListView.builder(
        itemCount: sets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Set ${sets[index]}'),
            onTap: () {
              // Show options for the selected set
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: Icon(Icons.info),
                          title: Text('View Details'),
                          onTap: () {
                            // Close modal and navigate to details screen
                            Navigator.pop(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => QuestionListScreen(setNumber: sets[index], question: '',),
                            //   ),
                            // );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.admin_panel_settings),
                          title: Text('Admin Screen'),
                          onTap: () {
                            // Close modal and navigate to admin screen
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AdminScreen(setNumber: sets[index]),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open dialog to add new set
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add New Set'),
              content: TextField(
                controller: newSetController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Set Number'),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add new set
                    setState(() {
                      int newSetNumber = int.tryParse(newSetController.text) ?? 0;
                      if (newSetNumber != 0 && !sets.contains(newSetNumber)) {
                        sets.add(newSetNumber);
                        sets.sort(); // Sort sets
                      }
                    });
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
