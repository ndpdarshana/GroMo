import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/babyDetails.dart';
import '../screens/growth_monitoring_screen.dart';

import '../widgets/customFormFields.dart';

class SearchScreen extends StatelessWidget {
  static const routeName = '/search';

  List<BabyDetails> babies = [
    BabyDetails(
      name: 'Thilini Amodhya',
      nik: '2929771',
      address: '123/2 kohilawatta, Nottonbridge',
      dob: DateTime.now(),
      parentName: 'Pushpalatha kumarani',
      parentNik: '1994982982',
      contact: '123456789',
    ),
    BabyDetails(
      name: 'Thejan Makumbura',
      nik: '8795612',
      address: '78 Kutipigedara, Narahenpita',
      dob: DateTime.now(),
      parentName: 'Dharmasena Pathiraja',
      parentNik: '584622542',
      contact: '85643127',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Growth Monitor'),
      ),
      body: Container(
        height: 300,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    labelText: 'Name',
                    onSaved: null,
                  ),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.lightBlue,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search_rounded),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: babies.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(GrowthMonitoringScreen.routeName);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(babies[index].name),
                      subtitle:
                          Text(DateFormat.yMMMMd().format(babies[index].dob)),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
