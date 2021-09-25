
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class chatScreen extends StatefulWidget {
  const chatScreen({Key? key}) : super(key: key);

  @override
  _chatScreenState createState() => _chatScreenState();
}

class _chatScreenState extends State<chatScreen> {

  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Messages',style: TextStyle(fontSize: 28)),
          backgroundColor: Colors.black,
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.add_road_sharp, color: Colors.white,))
          ],
        ),
      body: Container(
        color: Colors.black,
        child: Column(
            mainAxisAlignment:  MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                color: Colors.grey,
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)
                ),
                margin: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search'
                      ),
                  ),
                ),
              ),
              SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('New Matches',style: TextStyle(fontSize: 22, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: card(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Conversations',style: TextStyle(fontSize: 22, color: Colors.white)),
                    ),


                    Expanded(
                      child: ListView.builder(
                        itemCount: 200,
                        itemBuilder: (context, index){
                          return customCard(context);
                        },
                      )
                      ,)
                  ],
                ),

        ),
    );
  }

Widget card(BuildContext context)
{
  double width = MediaQuery.of(context).size.width / 2.9;
  return Container(
    height: 180,
    child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        separatorBuilder: (context, index) => SizedBox(width: 15,)
        , itemBuilder: (context, index) =>
        ClipRRect(

          borderRadius: BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: width,
            height: 180,
            color:  Colors.green,
            child: Stack(
              children : [
                Container(
                  width: width,
                  height: 180,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                  width: width,
                    height: 40,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.yellow,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('name',style: TextStyle(fontWeight: FontWeight.bold),),
                        Text('gender')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    ),
  );
}

Widget cardList(BuildContext context)
{
  return Container(
    child: SingleChildScrollView(
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          itemCount: 100,
          separatorBuilder: (context, index) => SizedBox(height: 15.0,)
          , itemBuilder: (context, index) {
        return customCard(context);
      }
      ),
    )
  );
}

Widget customCard(BuildContext context)
{
  return Card(

    elevation: 1,
    color: Colors.grey[800],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    child: ListTile(

      title: Text("Username",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      subtitle: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Text(" Message Text",style: TextStyle(color: Colors.white)),
        ],
      ),
      leading:
         Container(
          width: 50,
          height: 50,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.fromBorderSide(BorderSide(color: Colors.blue, width: 3.0)),
            color: Colors.yellow,
          ),


      ),
      trailing: SizedBox(
        width: 75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[

                  Spacer(),
                  Text(
                    "Time",
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Center(child: Text('5', style: TextStyle(color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    ),
  );

}
}
