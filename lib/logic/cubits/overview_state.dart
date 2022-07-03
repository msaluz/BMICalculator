part of 'overview_cubit.dart';


abstract class OverviewState {}

class OverviewLoading extends OverviewState {}

class BmiDescriptionLoaded extends OverviewState {
  final List<String> bmiDesc;

  BmiDescriptionLoaded(this.bmiDesc);

}