import 'package:fitness_tracker_app/core/constants/variables.dart';
import 'package:fitness_tracker_app/core/services/cache_helper.dart';
import 'package:fitness_tracker_app/features/auth/data/models/user_model.dart';
import 'package:fitness_tracker_app/features/auth/presentation/view_models/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit() : super(AuthenticationInitialState());

  static AuthenticationCubit get(context) => BlocProvider.of(context);

  // Sign in with Google
  Future<UserCredential> signInWithGoogle() async {
    emit(AuthenticationLoginWithGoogleLoadingState());
    try {
      final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      // Create a credential using the Google authentication tokens
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Sign in with the credential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Check if the user is already registered in Firestore
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!userDoc.exists) {
        // User not registered, create a new user in Firestore
        userCreate(
          name: gUser.displayName ?? '~', // Use displayName or default to '~'
          email: gUser.email,
          uId: userCredential.user!.uid,
          image: gUser.photoUrl ??
              '', // Save the user's profile picture if available
        );
      }
      emit(AuthenticationLoginWithGoogleSuccessState(
          uId: userCredential.user!.uid));
      return userCredential;
    } catch (error) {
      emit(AuthenticationLoginWithGoogleErrorState());
      rethrow;
    }
  }

  // Register with email and password
  void userRegister({
    required String email,
    required String password,
    required String name,
  }) {
    emit(AuthenticationRegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      userCreate(name: name, email: email, uId: value.user!.uid);
    }).catchError((error) {
      emit(AuthenticationRegisterErrorState());
    });
  }

  // Sign in with email and password

  Future<void> userLogin({
    required String email,
    required String password,
  }) async {
    emit(AuthenticationLoginLoadingState());
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        await CacheHelper.saveData(key: 'uId', value: value.user!.uid);
        emit(AuthenticationLoginSuccessState(uId: value.user!.uid));
      } else {
        emit(AuthenticationLoginEmailNotVerifiedErrorState());
      }
    }).catchError((error) {
      print(error.toString());
      emit(AuthenticationLoginErrorState(error: error.toString()));
    });
  }

  //Send password reset code for Forgot password
  Future<void> sendPasswordResetEmail(String email) async {
    emit(AuthenticationSendResetPasswordLoadingState());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('Password reset email sent');
      emit(AuthenticationSendResetPasswordSuccessState());
    } catch (e) {
      print('Failed to send password reset email: $e');
      emit(AuthenticationSendResetPasswordErrorState());
    }
  }

  // User create in firestore
  void userCreate({
    required String name,
    required String email,
    String image = '',
    required String uId,
  }) {
    UserDataModel userDataModel = UserDataModel(
      name: name,
      email: email,
      image: image,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userDataModel.toMap())
        .then((value) {
      emit(AuthenticationCreateUserSuccessState());
    }).catchError((error) {
      emit(AuthenticationCreateUserErrorState());
    });
  }

  //Get user data
  UserDataModel? userDataModel;

  Future<void> getUserData() async {
    emit(AuthenticationGetUserDataLoadingState());

    try {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(CacheHelper.getData(key: 'uId'))
          .get();

      // Check if the document has data
      if (userDoc.data() != null) {
        userDataModel = UserDataModel.fromJson(userDoc.data()!);
        emit(AuthenticationGetUserDataSuccessState());
      } else {
        emit(AuthenticationGetUserDataErrorState());
      }
    } catch (error) {
      print('################################################');
      print(error);
      print('################################################');
      emit(AuthenticationGetUserDataErrorState());
    }
  }

  void logOut() {
    emit(AuthenticationLogOutLoadingState());
    CacheHelper.removeData(key: 'uId');
    uId = '';
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    emit(AuthenticationLogOutSuccessState());
  }
}
