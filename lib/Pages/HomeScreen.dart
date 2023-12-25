import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sms/Pages/offlinesms.dart';
import 'package:sms/Pages/online.dart';
import '../Provider/sms_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sms = Provider.of<SmsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sms Sender'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            MyGridView()
          ],
        ),
      ),
    );
  }
}

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List mydata = [
      {"name": "Online"},
      {"name": "Offline"}
    ];
    return GridView.builder(
      shrinkWrap: true,
      itemCount: mydata.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 90,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
        if(mydata[index]['name'] == 'Online'){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SmsOnline(),
              ));
        }
        if(mydata[index]['name'] == 'Offline'){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NosendSms(
                    offlineList:
                    Provider.of<SmsProvider>(context, listen: false)
                        .offlineList),
              ));
        }
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.message, color: Colors.red),
                  Text(mydata[index]['name'])
                ]),
          ),
        );
      },
    );
  }
}
