part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeLoading extends HomeState {

}

class HomeLoaded extends HomeState {
  final WeatherModel weatherModel;
  HomeLoaded(this.weatherModel);
}
class HomeSearch extends HomeState{
}
class ErrorState extends HomeState{
final String errorText;
ErrorState(this.errorText);
}
