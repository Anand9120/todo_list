import 'package:flutter/material.dart';

void main() {
  runApp(UserListApp());
}

class UserListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Email: ${users[index].email}'),
            subtitle: Text('Number: ${users[index].number}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addUserDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addUserDialog(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController numberController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: numberController,
                decoration: const InputDecoration(labelText: 'Number'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  users.add(User(
                    email: emailController.text,
                    number: numberController.text,
                  ));
                  Navigator.of(context).pop();
                });
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class User {
  final String email;
  final String number;

  User({required this.email, required this.number});
}
