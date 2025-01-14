import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/helpers/show_message.dart';
import 'package:nursery_app/core/models/patient.dart';
import 'package:nursery_app/core/models/readings.dart';
import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/core/widgets/circle_widget.dart';
import 'package:nursery_app/core/widgets/custom_app_bar.dart';
import 'package:nursery_app/features/home/cubits/cubit/fetch_cubit.dart';
import 'package:nursery_app/features/home/views/widgets/content_data.dart';
import 'package:nursery_app/features/start/presentation/views/cubits/cubit/predict_cubit.dart';
import 'package:nursery_app/features/start/presentation/views/cubits/cubit/sign_up_cubit.dart';

import 'package:nursery_app/features/start/presentation/views/start_view.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/sign_in_button.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  Readings? readings;

  @override
  Widget build(BuildContext context) {
    final Patient patient = BlocProvider.of<SignUpCubit>(context)
        .patients[BlocProvider.of<PredictCubit>(context).currentuser];
    return BlocConsumer<FetchCubit, FetchState>(
      listener: (context, state) {
        if (state is FetchFaileur) {
          showMessage(context, message: state.errorMessage);
        }
        if (state is FetchSuccess) {
          readings = state.readings;
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0,
              pinned: true,
              expandedHeight: 60.0,
              flexibleSpace: CustomAppBar(
                kName: patient.firstName,
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    context.goNamed(StartView.id);
                  },
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContentData(
                          updata: "Baby Name",
                          downData: patient.babyName,
                        ),
                        ContentData(
                          updata: "Baby Gender",
                          downData: patient.babyGender,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ContentData(
                      updata: "Date",
                      downData: DateTime.now().toString().split(' ')[0],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "Baby Measures",
                          style: Styles.styleText20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleWidget(
                        icon: Icons.favorite,
                        label: "Pulse rate",
                        data: "__",
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      CircleWidget(
                        icon: Icons.bloodtype,
                        label: "SPO2",
                        data: "__",
                      ),
                    ],
                  ),
                  CircleWidget(
                    icon: Icons.thermostat,
                    label: "Temperature",
                    data: "__",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, bottom: 20),
                          child: Text(
                            "Incubator Measures",
                            style: Styles.styleText20,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ContentData(
                          updata: "Temperature",
                          downData: readings?.incubatorTemp.toString() ?? "32",
                        ),
                        ContentData(
                          updata: "Humidity",
                          downData:
                              readings?.incubatorHumidity.toString() ?? "44",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SginInButton(
                      load: state is FetchLoading,
                      onPressed: () async {
                        BlocProvider.of<FetchCubit>(context).fetchReadings();
                      },
                      textContent: "Update Measures",
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
