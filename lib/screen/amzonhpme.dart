import 'package:flutter/material.dart';
import 'package:product/services/amzonservice.dart';

class amzon extends StatelessWidget {
  const amzon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text("Product"),

          FutureBuilder(
            future: getproductRepo(),
            builder: (context, snapshot) {
              if(snapshot.connectionState==ConnectionState.done)
              {
                if(snapshot.hasData)
                {
return  Expanded(
              child: GridView.builder(
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    height: 265,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ]),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset('assets/images/cheesecake.jpg',
                                cacheHeight: 250),
                          ),
                          Container(
                            // color: Colors.white30,
                            child: Column(
                              children: [
                                Text("data"),
                                Text('data'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                
              ),
            ),
                  
                }
              }
            },
            
          )
        ],
      ),
    );
  }

  static fromJson(Map<String, dynamic> decoded) {}
}
