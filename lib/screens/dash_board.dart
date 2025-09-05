//dashboard design
import 'package:flutter/material.dart';

//we are going to show different widgets so i used statefulwidget
class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  //store icon,text 
   List<Map<String,dynamic>> itemInfo=[{'image':Icons.add_circle,'iconText':'Add Users'},
    {'image':Icons.add_circle,'iconText':'Check Purchase'},
    {'image':Icons.add_circle,'iconText':'Check History'},
    {'image':Icons.add_circle,'iconText':'Check Sales'},
    ];
    List<Map<String,String>> buttonInfo=[
      {'buttonName':'Recent Activity'},
      {'buttonName':'Order Tracking'},
      {'buttonName':'Reports'},
      {'buttonName':'Sales History'},
    ];
    //to manage button status
    bool isClicked=false;
  @override
  Widget build(BuildContext context) {
    //safearea-to avoid overlap with status bar
    return SafeArea(
      child: Scaffold(
        //show icon,title
        appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Icon(Icons.menu,size:20),
             SizedBox(width:7),
              Text('Supply and Purchase',style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
        ],),
          //need icon in right side so mentioned inside actions
          actions: [
        
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: Icon(Icons.notifications,color: Colors.amber,),
                    ),
          ],
        ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        //SingleChildScrollView()-make scrollable page
        child: SingleChildScrollView(
          //column-vertically display list of widgets 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dashboard',style:TextStyle(fontSize: 13.5,fontWeight: FontWeight.bold)),
              //add vertical space
              SizedBox(height:5),
              //We can't style the column content directly so i used decoratedbox()
                DecoratedBox(
                  decoration: BoxDecoration(
              //set background color
              color: Colors.deepPurpleAccent,
              //show border and change its color
              border: Border.all(color: Colors.white, width: 2),
              //change shape of border 
              borderRadius: BorderRadius.circular(10),
            ),
                //add space around the column widget
                child: Padding(
                   padding:EdgeInsets.symmetric(horizontal: 8,vertical: 14),
                  child: Column(children: [
                    //add space around row widget
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    //row()-show content horizontally
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        //need to show multi line content used column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //display text
                            Text('Quick actions',style:TextStyle(color:Color.fromARGB(255, 178, 145, 236),fontWeight: FontWeight.w500,fontSize:11)),
                            Padding(
                              padding: const EdgeInsets.only(top:2.0),
                              child: Text('Purchase Indent',style:TextStyle(color:Colors.white,fontWeight: FontWeight.w600,fontSize:13)),
                            ),
                          ],
                        ),
                      //Inkwell-used to create clickable circle avatar icon
                      InkWell(
                        onTap: (){
                          // setState-change state of the icon 
                          //we need variable to track the button status
                          //intially button is not clicked so button status->not clicked->isClicked=false 
                          //button clicked->isClicked=true
                          //if used true and false it works only one time properly ->so change (!isClicked) the button statue ie if true then change to false and vice vera.
                          setState(() {
                            isClicked=!isClicked;
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor:const Color.fromARGB(255, 178, 145, 236),
                          radius: 15,
                        child:
                        //intially need to show down arrow when icon is clicked then show uo arrow
                        Icon(isClicked?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,color:Colors.white,size:18)),
                      )
                      ],),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    //divider-horizontal line
                    child: Divider(
                      //size,color of line
                      thickness:0.2,
                           color:Colors.white,
                    ),
                  ),
                    //if button is not clicked nothing show otherwise show column
                     !isClicked?SizedBox()
                      :Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            //layout shows more than one item in a line → then it’s a grid (rows & columns).
                            //gridview.builder()->used to display a dynamic list of values->i.e when list is large or unknown number of items.
                            child: GridView.builder(
                              //tells the GridView to take only as much height as needed for its children, instead of expanding infinitely.
                               shrinkWrap: true, 
                               //disables the scrolling ability of this GridView.
                               //we need whole app is scrollable.we don't want grid content alone scrollable
                               physics: NeverScrollableScrollPhysics(), 
                               //define how many items to build in the grid.
                               //item count is not fixed one it is based on list value,so get the items in list by finding length of the list.
                                           itemCount:itemInfo.length ,
                                //Controls how the grid need to display (rows, columns, spacing, etc).
                                           gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                                //number of items need to display in row(e.g.2->item1,item2)
                                           crossAxisCount:2,
                                //add space between items in row(item1->space->item2)
                                           crossAxisSpacing:3,
                                //add space between 2 rows(
                                //item1,item2
                                //  | space
                                //item3,item4
                                           mainAxisSpacing:3,
                                //Ratio = width / height of each item.
                                // 1.0 → square (width = height)-> perfect square->look like ■
                                // > 1 → wider than tall (landscape shape)->width is stretched (item looks wider than tall)-> look like  ▭ 
                                // < 1 → taller than wide (portrait shape)->height is stretched (item looks taller than wide)->look like ▯ 
                                           childAspectRatio: 1.5,
                                           ), 
                               //itembuilder()->it builds each grid item one by one.
                               //starts display index from 0 → itemCount-1
                               //itemInfo[index] to display data for grid cell.
                                           itemBuilder:(context,index){
                                            //get the value from list of map
                                             final data=itemInfo[index];
                                             //fetch image from map
                                             final image=data['image'];
                                             //fetch text from map
                                             String info=data['iconText'];
                                             //need card shape used card()
                                           return Card(
                                            //change the shape of the card
                                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),),
                                //based on childaspectratio grid cell(item) vaiue card takes default space
                                //so column child-image,text take whole card space->i.e even text,image are placed on top of the code,there is space below those content
                                //use MainAxisSize.min to avoid extra space
                                             child:Column(
                                               mainAxisSize: MainAxisSize.min,
                                // In a Column:mainAxisAlignment aligns content from top → center (vertical movement).
                                //crossAxisAlignment aligns content from left → center (horizontal movement).
                                               mainAxisAlignment: MainAxisAlignment.center ,
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                               Icon(image),
                                               Padding(
                                                //only add padding for top of the text
                                                 padding: const EdgeInsets.only(top:6.0),
                                                 child: Text(info,style:TextStyle(fontSize:13),),
                                               ),
                                             ],),
                                           );
                             }
                             ),
                          ),
                          //again need to show a list of items in a grid format (rows × columns),so use GridView.builder()
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: GridView.builder(
                          shrinkWrap:true,
                          physics:NeverScrollableScrollPhysics(),
                          itemCount:buttonInfo.length,
                          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:2,
                            mainAxisSpacing: 9,
                            crossAxisSpacing: 9,
                            childAspectRatio: 3.2,
                            ),
                          itemBuilder:(context,index){
                            final buttonData=buttonInfo[index];
                            final buttonText=buttonData['buttonName'];
                            //display the custom widget
                            return TextBtn(name: buttonText!);
                          }
                                              ),
                                            ),
                        ],
                      ),
                  
                  ],),
                ),
              )
            ],
           ),
        ),
      ),
      ),
    );
  }
}
//custom widget-display text button with name parameter
class TextBtn extends StatelessWidget {
  final String name;
  const TextBtn({super.key,
   required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {  }, 
      style:TextButton.styleFrom(backgroundColor: const Color.fromARGB(255, 106, 69, 209),
      //change the shape of the text button border
    shape:RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),),
      child:Text(name,style:TextStyle(color:Colors.white,fontSize:13,fontWeight:FontWeight.w600)),
    
    );
  }

}