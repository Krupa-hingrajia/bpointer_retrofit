import 'package:flutter/material.dart';
import 'package:retrofit_bpointer/core/model.dart';

class CardScreen extends StatefulWidget {
  List<User>? cardList;
   CardScreen({super.key, required this.cardList});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardList"),
      ),
      body: _buildListView(),
    );
  }

  _buildListView() {
    return ListView.builder(
        itemCount: widget.cardList!.length,
        itemBuilder: (context, index) {
          final item = widget.cardList![index].title;
         return Dismissible(
           key: Key(item!),
           onDismissed: (direction) {
              setState(() {
                widget.cardList!.removeAt(index);
              });
           },
           background: Container(color: Colors.red,),
           child: ListTile(
             title: Text(widget.cardList![index].title.toString() ?? ''),
           ),
         );
    });
  }
}
