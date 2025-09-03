import 'package:flutter/material.dart';

class TaskManagementCard extends StatelessWidget {
  const TaskManagementCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BarIcon(),
              //Icon(Icons.bar_chart),
              Text('Build Application using Flutter'),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 3, height: 18, color: Colors.grey),
                  SizedBox(width: 4),
                  Container(width: 3, height: 18, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BarIcon extends StatelessWidget {
  const BarIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildBar(totalHeight: 15, color: Colors.amber),
        SizedBox(width: 3),
        _buildBar(totalHeight: 20, color: Colors.amber),
        SizedBox(width: 3),
        _buildBar(
            totalHeight: 25, color: const Color.fromARGB(255, 206, 206, 206)),
      ],
    );
  }

  Widget _buildBar({required double totalHeight, required Color color}) {
    return Container(
      width: 5,
      height: totalHeight,
      decoration: BoxDecoration(
        color: color,
        //Colors.amber, // background bar
        borderRadius: BorderRadius.circular(2),
      ),
      /*child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: filledHeight,
          decoration: BoxDecoration(
            color: Colors.amber, // filled part
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    */
    );
  }
}
