import 'package:api_metal_prices/cubit/cubit.dart';
import 'package:api_metal_prices/cubit/states.dart';
import 'package:api_metal_prices/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit()
        ..getGoldPrice()
        ..getSilverPrice(),
      child: BlocConsumer<MainCubit, States>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.grey[800],
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TODAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1, 1),
                            blurRadius: 5),
                      ],
                    ),
                  ),
                  Text(
                    ' PRICE',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                            color: Colors.orange,
                            offset: Offset(1, 1),
                            blurRadius: 5),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
              padding: const EdgeInsets.only(
                  top: 50, right: 10, bottom: 10, left: 10),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/gold.png',
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'GOLD',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: MediaQuery.of(context).size.width / 8,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                                color: Colors.orange[500]!,
                                offset: const Offset(2, 2),
                                blurRadius: 5)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${MainCubit.get(context).goldI}💲',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            BoxShadow(
                                color: Colors.orange,
                                offset: Offset(2, 2),
                                blurRadius: 5)
                          ],
                        ),
                      ),
                    ],
                  ),
//Column two the silver prices
                  Column(
                    children: [
                      Image.asset(
                        'assets/silver.png',
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 2.5,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'silver',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 8,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                                color: Colors.grey[500]!,
                                offset: const Offset(2, 2),
                                blurRadius: 5)
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${MainCubit.get(context).silverI}💲',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 18,
                          fontWeight: FontWeight.bold,
                          shadows: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(2, 2),
                                blurRadius: 5)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
