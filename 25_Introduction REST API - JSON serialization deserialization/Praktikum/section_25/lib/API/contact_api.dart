import 'package:dio/dio.dart';

class Contacts {
  int? id;
  String? name;
  String? phone;

  Contacts({this.id, this.name, this.phone});

  Contacts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    return data;
  }
}

class ContactsAPI{
  static Future<List<Contacts>> getContacts() async {
    final Response response = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts/2',
      options: Options(
        validateStatus: (_) => true,
      )
    );
   List<Contacts> kontak = List<Contacts>.from(response.data.map((model) => Contacts.fromJson(model)));
    return kontak;
  }
}
