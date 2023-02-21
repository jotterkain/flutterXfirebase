import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'customer.dart';

class CustomerAPI {

  static Customer? customer;

  static Dio dio = Dio()
  ..options.baseUrl="https://localhost:8080/";

  void createUser() async {
    try{
      await dio.post("customers",data: customer!.toJson());
    }catch(e){
      log(e.toString());
    }
  }

  static Future<Customer?> initCustomer() async {
    try{
       customer = await dio.get("customers/${FirebaseAuth.instance.currentUser?.uid}").then((value) {
        return Customer.fromJson(value.data);
      });
       log("user nic: ${customer?.nicId}");
      return customer;
    }catch (e){
      log(e.toString());
      rethrow;
    }
  }
}