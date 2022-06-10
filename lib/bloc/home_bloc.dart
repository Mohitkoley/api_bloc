import 'package:api_bloc/services/bored_services.dart';
import 'package:api_bloc/services/connectivityservices.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import "package:bloc/bloc.dart";
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BoredServices _boredServices;
  final ConnectivityService _connectivityService;
  HomeBloc(this._boredServices, this._connectivityService)
      : super(HomeLoadingState()) {
    on<LoadingApiEvent>((event, emit) async {
      _connectivityService.connectivityStream.stream.listen((event) {
        if (event == ConnectivityResult.none) {
          add(NoInternetEvent());
        } else {
          add(LoadingApiEvent());
        }
      });

      final activity = await _boredServices.getBoredActivity();
      emit(HomeLoadedState(
        activityName: activity.activity,
        activityType: activity.type,
        participants: activity.participants,
      ));
    });
  }
}
