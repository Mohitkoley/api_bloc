import 'package:api_bloc/bloc/home_bloc.dart';
import 'package:api_bloc/services/bored_services.dart';
import 'package:api_bloc/services/connectivityservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          RepositoryProvider.of<BoredServices>(context),
          RepositoryProvider.of<ConnectivityService>(context)),
      child: Scaffold(
        appBar: AppBar(title: const Text("Api Bloc")),
        body: Center(
          child: BlocBuilder<HomeBloc, HomeState>(builder: ((context, state) {
            if (state is HomeLoadingState) {
              return const CircularProgressIndicator(
                color: Colors.blue,
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.activityName),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.activityType),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(state.participants.toString()),
                  )
                ],
              );
            }
            return const Text("No Internet");
          })),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<HomeBloc>(context).add(LoadingApiEvent()),
            child: const Icon(Icons.refresh)),
      ),
    );
  }
}
