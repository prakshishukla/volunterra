// announcement.dart
class Announcement {
  final String title;
  final String organizationName;
  final String description;

  Announcement({
    required this.title,
    required this.organizationName,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'organizationName': organizationName,
      'description': description,
    };
  }

  factory Announcement.fromMap(Map<String, dynamic> map) {
    return Announcement(
      title: map['title'] ?? 'No Title', // Default value if null
      organizationName: map['organizationName'] ?? 'Unknown Organization', // Default value if null
      description: map['description'] ?? 'No Description', // Default value if null
    );
  }
}
