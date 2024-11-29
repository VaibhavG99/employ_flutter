import 'package:flutter/material.dart';

void main() {
  runApp(EmployeeTrackerApp());
}

class EmployeeTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text('Employee Tracker'),
      backgroundColor: Colors.blue, // Add this line for custom AppBar color
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(icon: Icon(Icons.menu), onPressed: () => Scaffold.of(context).openDrawer(),);
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Employee Tracker',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.check_circle),
              title: Text('Attendance'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AttendancePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Activity'),
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Timesheet'),
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Report'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Jobsite'),
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Team'),
            ),
            ListTile(
              leading: Icon(Icons.beach_access),
              title: Text('Time Off'),
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: Text('Schedules'),
            ),
          ],
        ),
      ),
    

      body: SingleChildScrollView(
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 2),
        // Image Section
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1.0), // Optional: Rounded corners
            child: Image.asset(
              "assets/officebg.jpg", // Replace with your image path
              width: double.infinity, // Make it take full width
              height: 900.0, // Set a specific height
              fit: BoxFit.cover, // Ensures the image fits properly
            ),
          ),
        ),
            ],
          ),
        ),
      ),
    );
  }
}

class AttendancePage extends StatelessWidget {
  //Dummy data for members
    final List<Map<String, dynamic>> members = [
    {
      'name': 'Harshit Sehgal',
      'imagepath':'assets/HarshitSehgal.jpg',
      'travelHistory': [
        {'city': 'START: Faridabad', 'time': '8:00 AM'},
        {'city': 'BadarPur', 'time': '8:20 AM'},
        {'city': 'OKHLA','time': '8:35 AM'},
        {'city': 'Noida','time': '8:50 AM'},
        {'city': 'END : Max Square, Noida Expressway','time': '9:00 AM'},
      ],
    },
    {
      'name': 'Manoj Mishra',
      'imagepath':'assets/Manojmishra.jpg',
      'travelHistory': [
        {'city': 'START: Hauz Khas', 'time': '7:30 AM'},
        {'city': 'Lajpat Nagar', 'time': '7:50 AM'},
        {'city': 'Uttar Pradesh Border', 'time': '8:10 AM'},
        {'city': 'Noida Sector-128', 'time': '8:30 AM'},
        {'city': 'END : Max Square, Noida Expressway', 'time': '9:00 AM'},
      ],
    },
    {
      'name': 'Prakash Raj',
      'imagepath':'assets/Prakashraj.jpg',
      'travelHistory': [
        {'city': 'START: Sarita Vihar', 'time': '7:50 AM'},
        {'city': 'Atlantic Water World', 'time': '8:00 AM'},
        {'city': 'HCL Tech', 'time': '8:30 AM'},
        {'city': 'END : Max Square, Noida Expressway', 'time': '9:00 AM'},
      ],
    },
    {
      'name': 'Rakesh Goel',
      'imagepath':'assets/RakeshGoel.jpg',
      'travelHistory': [
        {'city': 'START: Mayur Vihar', 'time': '7:30 AM'},
        {'city': 'Delhi Expressway', 'time': '7:50 AM'},
        {'city': 'OKHLA', 'time': '8:20 AM'},
        {'city': 'Noida Sector-128', 'time': '8:40 AM'},
        {'city': 'END : Max Square, Noida Expressway', 'time': '9:00 AM'},
      ],
    },
    {
      'name': 'Sanket Joshi',
      'imagepath':'assets/sanketjoshi.jpg',
      'travelHistory': [
        {'city': 'Chhatarpur', 'time': '7:30 AM'},
        {'city': 'Saket', 'time': '7:50 AM'},
        {'city': 'Sarita Vihar', 'time': '8:20 AM'},
        {'city': 'END : Max Square, Noida Expressway', 'time': '9:00 AM'},
      ],
    },
    {
      'name': 'Shubham Kumar',
      'imagepath':'assets/ShubhamKumar.jpg',
      'travelHistory': [
        {'city': 'Bulandshehar', 'time': '7:30 AM'},
        {'city': 'Sikandrabad', 'time': '7:50 AM'},
        {'city': 'Greater Noida', 'time': '8:30 AM'},
        {'city': 'END : Max Square, Noida Expressway', 'time': '9:00 AM'},
      ],
    },
    // Add more members as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return GestureDetector(
            onTap: () {
              // Navigate to a detailed page for this member
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetailsPage(member: member),
                ),
              );
            },
            child: Card(
              elevation: 3,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                title: Text(member['name']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.location_on, color: Colors.blue),
                      onPressed: () {
                        // Show current location (dummy implementation)
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Current Location'),
                            content: Text('Current location of ${member['name']} is: Max Square, Noida Expressway, Uttar Pradesh'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.history, color: Colors.blue),
                      onPressed: () {
                        // Show travel history in a dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('${member['name']} Travel History'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: member['travelHistory'].map<Widget>((entry) {
                                return ListTile(
                                  leading: Icon(Icons.location_city),
                                  title: Text(entry['city']),
                                  subtitle: Text(entry['time']),
                                );
                              }).toList(),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MemberDetailsPage extends StatelessWidget {
  final Map<String, dynamic> member;

  MemberDetailsPage({required this.member});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${member['name']} Details'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 20),
              // Image Section
              Center(
              child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0), // Optional: Rounded corners
              child: Image.asset("${member['imagepath']}", // Replace with your image path
                      width: 900.0  ,//double.infinity, // Make it take full width
                      height: 500.0, // Set a specific height
                      fit: BoxFit.cover, // Ensures the image fits properly
                      ),
                ),
              ),
            // Text(
            //   'Name: ${member['name']}',
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 20),
            Text(
              'Travel History:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...member['travelHistory'].map<Widget>((entry) {
              return ListTile(
                leading: Icon(Icons.location_city),
                title: Text(entry['city']),
                subtitle: Text(entry['time']),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}

