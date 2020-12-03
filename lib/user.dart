//import 'package:flutter/material.dart';

class UserAdmin{
  String adminID;
  String userUSERNAME;
  String userPASSWORD;
  String branch;

  UserAdmin({this.adminID, this.userUSERNAME, this.userPASSWORD,
                this.branch});

  UserAdmin.fromJson(Map<String,dynamic> json){
      adminID = json['adminID'];
      userUSERNAME = json['userUSERNAME'];
      userPASSWORD = json['userPASSWORD'];
      branch = json['branch'];
  }
    
}