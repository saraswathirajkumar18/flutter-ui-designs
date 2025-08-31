import 'package:flutter/material.dart';
import 'package:flutter_ui_designs/screens/info_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,dynamic>> designInfo=[
// if create 'page': InfoCard()
// → Widget is created immediately when the list is built
// → The SAME widget instance is reused every time you navigate
// → Risk: Flutter doesn’t like reusing widget objects across the widget tree

// if create 'page': () => InfoCard()
// → No widget is created yet (just a function stored)
// → Widget is only created when you press/call it
// → Every tap creates a brand-new InfoCard widget instance (safe and clean)
      {'image':'assets/images/info.png','title':'Info Card','page':()=>InfoCard()},
      {'image':'assets/images/img2.png','title':'Info Card1','page':()=>InfoCard()},
      {'image':'assets/images/img2.png','title':'Info Card1','page':()=>InfoCard()},
    ];
    return Scaffold(
      appBar: AppBar(
        title:Text('UI Designs',style:TextStyle(fontWeight:FontWeight.bold,fontSize: 23,color:Colors.white)),
        centerTitle: true,
        backgroundColor:Colors.blueGrey,
        ),
      body:Padding(
        padding: const EdgeInsets.only(top:25,left:8,right:8,bottom:8),
        child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:3,
          crossAxisSpacing:8,
          mainAxisSpacing:8,
          childAspectRatio: 0.8,
        ),
        //ListView.builder(
          itemCount:designInfo.length,
          itemBuilder:(context,index){
            final data=designInfo[index];
            String text=data['title'];
            String image=data['image'];
            final page=data['page'];
          return Card(
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11), // corner radius
          side: BorderSide(
        color: const Color.fromARGB(255, 158, 201, 223),
        //const Color.fromARGB(255, 195, 194, 194),
        width:0.5,
            ),
          ), 
            child:InkWell(
              onTap:(){
                //page()-call the class-create page widget
                //page-just mention the class name
                Navigator.push(context,MaterialPageRoute(builder: (context)=>page()));
              },
              child: Column(
               mainAxisSize: MainAxisSize.min,
                children:[
                  Image.asset(image,width:75,height:75, fit: BoxFit.cover,),
                 SizedBox(height: 3,),
              Text(text,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.blue)),
                ]
              ),
            ),
          ) ;
        
        
        }),
      ),
    );
  }
}