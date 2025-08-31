import 'package:flutter/material.dart';

//Infocard contains card information
class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    //Include necessery widgets in Scaffold
    return Scaffold(
      //set background color and spacing around the page include container
      body:Container(
        padding: const EdgeInsets.only(left:12.0,right:12,bottom:8,top:15),
       color: Color.fromARGB(255, 73, 80, 109),
       //column widget used to store list of widget
       //we want to display the content in line by line so use column widget 
        child: Column(
          //CrossAxisAlignment.start used to display content begining of the page(left)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //add space vertically in page
            SizedBox(height:40),
            //to display icon on right side use row widget
                Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              //bg color and shape of the circle
              color: Color.fromARGB(255, 197, 197, 201),
              shape: BoxShape.circle,
            ),
            //inkewell make widgets clikcable and navigate
            child: InkWell(onTap: (){},
            //mention color,size as per our need
              child: Icon(Icons.bookmark_border_rounded,size: 13.5,color: Colors.white,)),
          ),
        ],
                ),
          SizedBox(height:35),
          //display heading and its category
          //ContainerButton()-custom widget - to display the text as button i created button in containerbutton widget.
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('Simple Flutter Design',
            //style the text-mention color,font size,weight of the text
            style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 18)),
            //to reuse the button-i created widget with button name parameter to set text for button
           ContainerButton(buttonName:'basic',),
           ],),
           SizedBox(height:7),
           Text('In this design we are going to use container,row,padding,text widgets.',style:TextStyle(color:Color.fromARGB(255, 190, 192, 198))),
           SizedBox(height:12),
           Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            //call the containerbutton widget
            //SizedBox(width:10)- used to add horizontal space between the buttons
            ContainerButton(buttonName:'flutter design'),
            SizedBox(width:10),
            ContainerButton(buttonName:'simple'),
             SizedBox(width:10),
            ContainerButton(buttonName: 'easy'),
           ],),
           SizedBox(height: 30,), 
          Padding(
             padding: const EdgeInsets.all(8.0),
             //if mention in row it occupy all the space in single line 
             child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
               children: [
                //occupy more space on both side -used expanded
                 Expanded(
                  //default shape and space is included in elevatedbutton-just use the built-in button instead of creating new design
                   child: ElevatedButton(onPressed: () {  }, style: ElevatedButton.styleFrom(
        //to customize button-that is remove space and size change the default value
        minimumSize: Size.zero, // removes default min size
        padding: EdgeInsets.all(12),),
        //buttton name
                   child: Text('Read now',style: TextStyle(color: Colors.black,fontWeight:FontWeight.w600))),
                 ),
               ],
             ),
           ),
          ],
        ),
      )
    );
  }
}

//show container as button appearance
class ContainerButton extends StatelessWidget {
  //create buttonName variable
  final String buttonName;
  const ContainerButton({super.key,
required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7.5,vertical:2),
                decoration: BoxDecoration(
                  //shape of the border,background color of the container
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 124, 134, 173),
                ),
                child:Text(buttonName,style:TextStyle(color:Colors.white,
                fontWeight:FontWeight.w500,fontSize: 12),),
                );
  }
}

 