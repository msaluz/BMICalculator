import 'package:bloc/bloc.dart';

import '../../data/repositories/bmi_repository.dart';

part 'overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  OverviewCubit() : super(OverviewLoading());

  final BmiRepository repo = BmiRepository();

  Future<void> bmiOverview() async {
    final descriptions = await repo.getBmiDescription();
    emit(BmiDescriptionLoaded(descriptions));
  }
}
