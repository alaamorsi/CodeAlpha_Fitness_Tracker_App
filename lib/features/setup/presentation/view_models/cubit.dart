import 'package:fitness_tracker_app/features/setup/presentation/view_models/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SetupCubit extends Cubit<SetupStates> {
  SetupCubit() : super(SetupInitialState());

  static SetupCubit get(context) => BlocProvider.of(context);

  bool isMan = true;

  void selectGender(String gender) {
    if (gender == 'man') {
      isMan = true;
    } else {
      isMan = false;
    }
    emit(SetupSelectSuccessState());
  }
}
