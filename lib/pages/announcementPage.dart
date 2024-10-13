import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'announcement.dart'; // Import your announcement model

class AnnouncementsPage extends StatelessWidget {
  final CollectionReference _announcementsCollection =
      FirebaseFirestore.instance.collection('announcements');

  Future<void> _addAnnouncement(BuildContext context) async {
    final titleController = TextEditingController();
    final organizationController = TextEditingController();
    final descriptionController = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: organizationController,
                decoration: InputDecoration(labelText: 'Organization Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Save the announcement
                  if (titleController.text.isNotEmpty &&
                      organizationController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty) {
                    final newAnnouncement = Announcement(
                      title: titleController.text,
                      organizationName: organizationController.text,
                      description: descriptionController.text,
                    );

                    await _announcementsCollection.add(newAnnouncement.toMap());
                    Navigator.pop(context); // Close the modal
                  }
                },
                child: Text('Add Announcement'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
        ThemeData(primarySwatch: Colors.green,);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Announcements"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _announcementsCollection.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No announcements available.'));
          }

          final announcements = snapshot.data!.docs
    .map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data); // Log the data to see what's being fetched
      return Announcement.fromMap(data);
    })
    .toList();


          return ListView.builder(
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              final announcement = announcements[index];
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(announcement.title),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Organization: ${announcement.organizationName}'),
                      SizedBox(height: 4),
                      Text(announcement.description),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addAnnouncement(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
