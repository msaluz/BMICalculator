import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/data/repositories/bmi_repository.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiLoading());
  final BmiRepository repo = BmiRepository();

  Future<void> bmiResult(int height, int weight) async {
    final score = await repo.getBmiScore(weight, height);
    final rating = await repo.getBmiRating(weight, height);
    emit(BmiResult(height.toString(), weight.toString(), score, rating));
  }
}