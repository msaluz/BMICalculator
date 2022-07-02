import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/data/repositories/bmi_repository.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiLoading());
  final BmiRepository repo = BmiRepository();

  Future<void> bmiCalculate(double height, double weight) async {
    final result = await repo.getBmiScore(weight, height);
    emit(BmiCalculated(bmiScore: result));
  }

  Future<void> bmiGetRating(double height, double weight) async {
    final result = await repo.getBmiRating(weight, height);
    emit(BmiRating(bmiRating: result));
  }

  void setBmiValues(String height, String weight) => emit(BmiValues(height: height, weight: weight));
}
