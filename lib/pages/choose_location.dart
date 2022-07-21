import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
   const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(location: 'Egypt', flag: 'egypt.png', url: 'Africa/Cairo'),
    WorldTime(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos'),
    WorldTime(location: 'Asia', flag: 'asia1.png', url: 'Asia/Aqtobe'),
    WorldTime(location: 'Lord_Howe', flag: 'australia.png', url: 'Australia/Lord_Howe'),
    WorldTime(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos'),
    WorldTime(location: 'Accra', flag: 'accra.jpg', url: 'Africa/Accra'),
    WorldTime(location: 'Asia', flag: 'asia1.png', url: 'Asia/Aqtobe'),
    WorldTime(location: 'Lord_Howe', flag: 'australia.png', url: 'Australia/Lord_Howe'),
    WorldTime(location: 'Lagos', flag: 'nigeria.png', url: 'Africa/Lagos'),
    WorldTime(location: 'Accra', flag: 'accra.jpg', url: 'Africa/Accra'),
    WorldTime(location: 'Asia', flag: 'asia1.png', url: 'Asia/Aqtobe'),
    WorldTime(location: 'Lord_Howe', flag: 'australia.png', url: 'Australia/Lord_Howe'),
  ];

  void updateTime (index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime,
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.amber[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                    print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'
                    ),
                  ),
                ),
              ),
            );
    }
    ),
    );
  }
}
