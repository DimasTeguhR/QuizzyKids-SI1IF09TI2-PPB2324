// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepo{
  final _auth = FirebaseAuth.instance;

  Future<void> login(
    {required String email, required String password}
  ) async {
    try{
      final user = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    }on FirebaseAuthException catch (e){
      print(e.message ?? 'Something wrong!');
      e.message ?? 'Something wrong!';
    }catch (e){
      rethrow;
    }
  }

  Future<void> register(
    {required String email, required String password} 
  ) async {
    try{
      final user = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password
      );
    }on FirebaseException catch (e){
      throw e.message ?? 'Something wrong!';
    } catch (e){
      rethrow;
    }
  }
}