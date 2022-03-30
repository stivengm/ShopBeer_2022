import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopbeer/data/models/methos_pay_model.dart';
import 'package:http/http.dart' as http;
// import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super( const HomeState() ) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetMethodsPay>((event, emit) {
      emit(state.copyWith(methodsPay: event.methodsPay));
    });

    getMethodsPay();

  }

  getMethodsPay() async {
    var url = Uri.https('shop-beer-default-rtdb.firebaseio.com', '/medios_pago.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonLeagueModel = jsonDecode(response.body);
      final List<MethodsPayModel> leagueModel = jsonLeagueModel.map<MethodsPayModel>((m) => MethodsPayModel.fromJson(Map<String, dynamic>.from(m))).toList();
      add( GetMethodsPay(leagueModel) );
    }
  }

}
