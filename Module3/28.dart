import 'package:flutter/material.dart';

class listView extends StatefulWidget {
  const listView({super.key});

  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Image.network(
                      "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcRSmJobvogMUfkcyzgEHF_w6hAijuYnE-XQ2ywyXOUJAQJ0zJR15pyllXWrBDuR0uoaFJLdu9iNjJDTaUTjgHQl661X4_hM",
                    ),
                    title: Text("Wireless HeadPhones"),
                    subtitle: Text("1999"),
                  ),
                  SizedBox(height: 70,),
                  ListTile(
                    leading: Image.network(
                      "https://m.media-amazon.com/images/I/41g06cAmgkL._SY300_SX300_QL70_FMwebp_.jpg",
                    ),
                    title: Text("Smart Watch"),
                    subtitle: Text("2999"),
                  ),
                  SizedBox(height: 70,),
                  ListTile(
                    leading: Image.network(
                      "https://files.vplak.com/images/jbl/PARTYBOX-ENCORE-ESSENTIAL/black/image-1.jpg",
                    ),
                    title: Text("Bluetooth Speaker"),
                    subtitle: Text("1499"),
                  ),
                  SizedBox(height: 70,),
                  ListTile(
                    leading: Image.network(
                      "https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcSe5-9yhLXbEBRnnjlqONJ9bupkeraSf1WhtNKivFidMcMTBuKxPPxebu44qSdP-yT4qWuMgXQLSGUZ6nQo7URLTRq6AEZrV6VjSojADytWHB7e5Hl2zudSNDRZ1bhfBOJOPHycwg&usqp=CAc",
                    ),
                    title: Text("Gaming Mouse"),
                    subtitle: Text("799"),
                  ),
                  SizedBox(height: 70,),
                  ListTile(
                    leading: Image.network(
                      "https://encrypted-tbn2.gstatic.com/shopping?q=tbn:ANd9GcT-zzeage3kkuNNeb23t-ceNMOqQN8HZrFDXzqYeoKCKGvkkhED12CCo9zAXOKozoJFdmUWmv_Kiu1kQLQ4XA35_-3Nwnend7k7Se1TvR9TYTLVehxhPX6xQzUd_hKKgtqsYCdzZqY&usqp=CAc",
                    ),
                    title: Text("Laptop Stand"),
                    subtitle: Text("599"),
                  ),
                  SizedBox(height: 70,),
                  ListTile(
                    leading: Image.network(
                      "https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTZYBQfwxQejLuD89IuCk8ZAqxQyc-_sSOkAwT4eersCJ9cqVvX07tRGE3JaykuljAB56ChufRtk3MI66FcPEfwRP4-8OdMD-t8EPSvhtTuo6nn32C3T9g0lWMdRj2afMOxZoy_o_O_gHA&usqp=CAc",
                    ),
                    title: Text("Power Bank"),
                    subtitle: Text("1099"),
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
