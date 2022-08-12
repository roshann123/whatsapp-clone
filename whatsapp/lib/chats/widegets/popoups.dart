import 'package:flutter/material.dart';

class PopupBox extends StatelessWidget {
  const PopupBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Card(
          // margin: EdgeInsets.all(15),
          child: Column(
            
            children: [
              SizedBox(height:15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  iconWidget(
                    icon: Icon(Icons.insert_drive_file),
                    color: Colors.purple,
                    name: 'Document'
                  ),
                  iconWidget(
                    icon: Icon(Icons.camera),
                    color: Colors.red,
                    name: 'Camera'
                  ),
                  iconWidget(
                    icon: Icon(Icons.insert_photo),
                    color: Colors.purple,
                    name: 'Gallery'
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget(
                    icon: Icon(Icons.headphones),
                    color: Colors.orange,
                    name: 'Audio'
                  ),
                  iconWidget(
                    icon: Icon(Icons.currency_rupee),
                    color: Colors.greenAccent,
                    name: 'Payment'

                  ),
                  iconWidget(
                    icon: Icon(Icons.location_on),
                    color: Colors.greenAccent,
                    name: "Location"
                  )


                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(width: 30,),
                iconWidget(
                  icon: Icon(Icons.person),
                  color: Colors.blueAccent,
                  name: 'Contacts'
                )
              ],)
            ],
          ),
        ),
      ),
    );
  }

  
  Widget iconWidget({Icon? icon , Color? color, String? name}) {
  return Column(
    children: [
      CircleAvatar(
        
        backgroundColor: color,
        radius: 30,
        child: icon,
      ),
      const SizedBox(
        height: 10,
        
      ),
      Text(name!)
    ],
  );
  }
}




