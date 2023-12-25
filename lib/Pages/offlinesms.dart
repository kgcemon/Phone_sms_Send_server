import 'package:flutter/material.dart';

class NosendSms extends StatelessWidget {
  List offlineList;

  NosendSms({super.key, required this.offlineList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: offlineList.isEmpty? const Center(child: Text("কিছু পাওয়া যায়নি")) : ListView.builder(
        itemCount: offlineList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () => offlineList.removeAt(index),
            title:  Text(offlineList[0]['sender']),
            trailing: const Icon(Icons.delete),
          );
        },
      ),
    );
  }
}
