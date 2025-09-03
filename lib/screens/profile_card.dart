import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    //user name and job role in variable
    String name = 'Sophie Bennett';
    String role = 'Product Designer who focuses on simplicity & usability.';
    //SafeArea-avoid content overlap with mobile status bar(battery status)
    return SafeArea(
      child: Scaffold(
        //set white color for whole app background color
        backgroundColor: Colors.white,
        body: Column(
          children: [
            //beginning of the page i want space so i used sizedbox()
            SizedBox(height: 10),
            //to mention space include padding for card 
            Padding(
              padding: const EdgeInsets.all(8.0),
              //card-
              child: Card(
                //color-set color for card
                color: const Color.fromARGB(255, 255, 253, 253),
                //add space btw card and content
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 15, bottom: 25),
                 //multi-line content so use column widget
                  child: Column(
                    //display content from left 
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //image widget doesn't has default border style 
                      //use clipRRect()-change the border shape
                      ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          //image.asset()-display the image
                          child: Image.asset('assets/images/profile.png')),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        //display name,icon in single line use row()-display multi widget in single line
                        child: Row(
                          children: [
                          //text()-display name
                            Text(name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(width: 10),
                            //we aren't going to use the flutter icon-so download the image from external website and include that using image.asset()
                            Image.asset('assets/images/check.png',
                                width: 25, height: 25),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        //mention the role using text()
                        child: Text(role,
                            style: TextStyle(
                                color: const Color.fromARGB(255, 135, 132, 132),
                                fontSize: 16)),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //we need icon and count number-so i created custom widget
                            //include the custom widget-pass icon and count value
                            IconWithNumber(icon: Icons.person, count: '312'),
                            //add space horizontally using sizedbox(width:15)
                            SizedBox(width: 15),
                            IconWithNumber(
                                icon: Icons.check_box_outlined, count: '48'),
                            SizedBox(width: 40),
                           //create elevatedbutton with text and icon
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 231, 229, 229),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 11)),
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text('Follow',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18)),
                                      SizedBox(width: 4),
                                      Icon(Icons.add,
                                          color: Colors.black, size: 24),
                                    ]),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//custom widget-to create reusable code-create widget that require 2 paramerts-icon,count
class IconWithNumber extends StatelessWidget {
  final IconData icon;
  final String count;
  const IconWithNumber({
    super.key,
    required this.icon,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    //style icon,text by size,color.
    return Row(
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.grey,
        ),
        SizedBox(width: 5),
        Text(count,
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
