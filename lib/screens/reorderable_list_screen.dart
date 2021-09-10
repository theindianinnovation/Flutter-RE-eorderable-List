import 'package:flutter/material.dart';

class ReorderableViewPage extends StatefulWidget {
  List<String> items = ["Clients","Designer","Developer","Director",
    "Employee", "Manager", "Worker","Owner"];
  @override
  _ReorderableViewPageState createState() => _ReorderableViewPageState();
}

class _ReorderableViewPageState extends State<ReorderableViewPage> {

  void reorderData(int oldindex, int newindex){
    setState(() {
      if(newindex>oldindex){
        newindex-=1;
      }
      final item =widget.items.removeAt(oldindex);
      widget.items.insert(newindex, item);
    });
  }

  void sorting(){
    setState(() {
      widget.items.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Reorderable ListView In Flutter",

        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.sort_by_alpha),
              tooltip:"Sort",
              onPressed: sorting
          ),
        ],
      ),
      body: ReorderableListView(
        children: <Widget>[
          for(final item in widget.items)
            Card(
              key: ValueKey(item),
              elevation: 2,
              child: ListTile(
                title: Text(item,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                leading: Icon(Icons.work,color: Colors.redAccent,),
              ),
            ),
        ],
        onReorder: reorderData,
      ),
    );
  }
}