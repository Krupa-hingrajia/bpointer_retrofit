import 'package:flutter/material.dart';
import 'package:retrofit_bpointer/ui/card_screen.dart';

import '../core/model.dart';

class DataScreen extends StatefulWidget {
  List<User>? post;
   DataScreen({super.key, required this.post});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
   List<User> cardList= [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Screen"),
      ),
      body: _buildListview(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardScreen(
                    cardList: cardList,
                  )));
        },
        child: const Text("SHOW"),
      ),
    );
  }
 ListView  _buildListview(){
     return ListView.builder(
       itemCount: widget.post!.length,
       itemBuilder: (context, index) {
         return ListTile(
           title: Text(widget.post![index].title.toString()),
           leading:  InkWell(
               onTap: () {
                 cardList.add(widget.post![index]);
                 print("********************${cardList}");
               },
               child: const Icon(Icons.add)),
         );
       },
     );
  }
}
