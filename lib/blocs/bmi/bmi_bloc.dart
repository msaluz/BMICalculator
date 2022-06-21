import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/data/repositories/BmiRepository.dart';
import 'package:meta/meta.dart';

part 'bmi_event.dart';
part 'bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(const BmiState(bmi: "", bmiResult: ""));

  final BmiRepository repo = BmiRepository();

  Stream<BmiState> mapEventToState(
      BmiEvent event,
  ) async* {
    if (event is BmiCalculate) {
      final results = await repo.getBmiResult(event.weight, event.height);
      yield BmiState(bmi: results['BMI']!, bmiResult: results['rating']!);
    }
  }
}
