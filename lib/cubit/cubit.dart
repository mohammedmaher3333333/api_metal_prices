import 'package:api_metal_prices/cubit/states.dart';
import 'package:api_metal_prices/network/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class MainCubit extends Cubit<States>{
  MainCubit():super(InitState());

  static MainCubit get(context)=> BlocProvider.of(context);
  double? goldD;
  int? goldI;
  getGoldPrice(){
    DioHelper.getData('XAU/USD/').then((value) {

        goldD=value.data['price'];
        goldI=goldD!.round();
        print(goldD);
        emit(GetGoldPriceState());
    }).catchError((onError){});
  }

  double? silverD;
  int? silverI;
  getSilverPrice(){
    DioHelper.getData('XAG/USD/').then((value) {

        silverD=value.data['price'];
        silverI=silverD!.round();
        print(silverD);
        emit(GetSilverPriceState());
    }).catchError((onError){});
  }
}