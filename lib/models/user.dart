// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

class User {
    User({
        this.id,
        this.firstName,
        this.middleName,
        this.surname,
        this.lastName,
        this.username,
        this.sex,
        this.email,
        this.phoneNumber,
        this.birthdate,
        this.department,
        this.city,
        this.emailVerified,
        this.isBlocked,
        this.isRestricted,
        this.createdAt,
        this.updatedAt,
        this.token,
    });

    String? id;
    String? firstName;
    String? middleName;
    String? surname;
    String? lastName;
    String? username;
    String? sex;
    String? email;
    String? phoneNumber;
    String? birthdate;
    String? department;
    String? city;
    String? emailVerified;
    String? isBlocked;
    String? isRestricted;
    String? createdAt;
    String? updatedAt;
    String? token;

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_Name"],
        middleName: json["middle_Name"],
        surname: json["surname"],
        lastName: json["last_Name"],
        username: json["username"],
        sex: json["sex"],
        email: json["email"],
        phoneNumber: json["phone_Number"],
        birthdate: json["birthdate"],
        department: json["department"],
        city: json["city"],
        emailVerified: json["email_Verified"],
        isBlocked: json["is_Blocked"],
        isRestricted: json["is_Restricted"],
        createdAt: json["created_At"],
        updatedAt: json["updated_At"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "first_Name": firstName,
        "middle_Name": middleName,
        "surname": surname,
        "last_Name": lastName,
        "username": username,
        "sex": sex,
        "email": email,
        "phone_Number": phoneNumber,
        "birthdate": birthdate,
        "department": department,
        "city": city,
        "email_Verified": emailVerified,
        "is_Blocked": isBlocked,
        "is_Restricted": isRestricted,
        "created_At": createdAt,
        "updated_At": updatedAt,
        "token": token,
    };
}
