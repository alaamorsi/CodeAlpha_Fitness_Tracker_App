abstract class AuthenticationStates {}

class AuthenticationInitialState extends AuthenticationStates {}

// Sign in with Google
class AuthenticationLoginWithGoogleLoadingState extends AuthenticationStates {}

class AuthenticationLoginWithGoogleSuccessState extends AuthenticationStates {
  final String uId;

  AuthenticationLoginWithGoogleSuccessState({required this.uId});
}

class AuthenticationLoginWithGoogleErrorState extends AuthenticationStates {}

// Register with email and password
class AuthenticationRegisterLoadingState extends AuthenticationStates {}

class AuthenticationRegisterSuccessState extends AuthenticationStates {}

class AuthenticationRegisterErrorState extends AuthenticationStates {}

// Sign in with email and password
class AuthenticationLoginLoadingState extends AuthenticationStates {}

class AuthenticationLoginSuccessState extends AuthenticationStates {
  final String uId;

  AuthenticationLoginSuccessState({required this.uId});
}

class AuthenticationLoginErrorState extends AuthenticationStates {
  final String error;

  AuthenticationLoginErrorState({required this.error});
}

class AuthenticationLoginEmailNotVerifiedErrorState
    extends AuthenticationStates {}

//Send password reset code for Forgot password
class AuthenticationSendResetPasswordLoadingState
    extends AuthenticationStates {}

class AuthenticationSendResetPasswordSuccessState
    extends AuthenticationStates {}

class AuthenticationSendResetPasswordErrorState extends AuthenticationStates {}

// Create user in firestore
class AuthenticationCreateUserSuccessState extends AuthenticationStates {}

class AuthenticationCreateUserErrorState extends AuthenticationStates {}

// Get user data
class AuthenticationGetUserDataLoadingState extends AuthenticationStates {}

class AuthenticationGetUserDataSuccessState extends AuthenticationStates {}

class AuthenticationGetUserDataErrorState extends AuthenticationStates {}

class AuthenticationLogOutLoadingState extends AuthenticationStates {}
class AuthenticationLogOutSuccessState extends AuthenticationStates {}
