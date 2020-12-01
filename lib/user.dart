

class User {
  final String adminID;
  final String userUSERNAME, branch;

  User({
    this.adminID,
    this.userUSERNAME,
    this.branch
  
  });

  factory User.fromJson(Map<String, dynamic> jsonData) {
    return User(
      adminID: jsonData['adminID'],
      userUSERNAME: jsonData['userUSERNAME'],
      
    );
  }
}