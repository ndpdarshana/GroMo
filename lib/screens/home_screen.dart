import 'package:flutter/material.dart';
import 'package:growMo/screens/growth_monitoring_screen.dart';
import 'package:growMo/screens/search_screen.dart';
import 'edit_record_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GrowMo'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: [
          GridTile(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(EditRecordScreen.routeName);
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/new-born.png',
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 300,
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          'New Baby Record',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                )),
          ),
          GridTile(
            child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Mobile-Tablet-form.jpg',
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 300,
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          'F1 Form',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                )),
          ),
          GridTile(
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SearchScreen.routeName);
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/childs-weight.jpeg',
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 300,
                        color: Colors.black54,
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          'Growth Monitor',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
