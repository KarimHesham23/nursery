import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/helpers/functions.dart';
import 'package:nursery_app/core/helpers/show_message.dart';
import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/features/home/views/home_view.dart';
import 'package:nursery_app/features/start/presentation/views/cubits/cubit/predict_cubit.dart';
import 'package:nursery_app/features/start/presentation/views/cubits/cubit/sign_up_cubit.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/custom_border_text_form_filed.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/sign_in_button.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/sign_in_dialog.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/sign_up_body.dart';

class SginInForm extends StatefulWidget {
  const SginInForm({super.key});

  @override
  State<SginInForm> createState() => _SginInFormState();
}

class _SginInFormState extends State<SginInForm> {
  String? email;
  String? password;

  GlobalKey<FormState> fromKey = GlobalKey();

  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PredictCubit, PredictState>(
      listener: (context, state) async {
        if (state is PredictFaileur) {
          context.pop();
          showMessage(context, message: state.errorMessage);
        }
        if (state is PredictSuccess) {
          context.goNamed(HomeView.id);
        }
      },
      builder: (context, state) {
        return state is PredictLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: kSpecialColor,
                ),
              )
            : Form(
                key: fromKey,
                autovalidateMode: autoValidate,
                child: CustomScrollView(
                  cacheExtent: 2000,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Text(
                            "Email",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          CustomBorderTextFormFiled(
                            icon: Icons.email,
                            type: "email",
                            hintText: "Enter Your Email",
                            onSaved: (p0) {
                              email = p0;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Password",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          CustomBorderTextFormFiled(
                            icon: Icons.lock,
                            type: "password",
                            hintText: "Enter Your Password",
                            onSaved: (p0) {
                              password = p0;
                            },
                          ),
                          SginInButton(
                            load: false,
                            textContent: "Sing In",
                            onPressed: () async {
                              validataMethod(context);
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ? ",
                                style: Styles.styleText16,
                              ),
                              TextButton(
                                onPressed: () {
                                  AppFuctions.createGeneralDialog(context,
                                      barrierLabel: "Sign Up",
                                      dialogWidget: SignInDialog(
                                        body: SginUpBody(),
                                      ));
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero, // Remove padding
                                ),
                                child: Text(
                                  "Register",
                                  style: Styles.styleText16.copyWith(
                                    color: kSpecialColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }

  void validataMethod(BuildContext context) async {
    if (fromKey.currentState!.validate()) {
      fromKey.currentState!.save();
      BlocProvider.of<PredictCubit>(context).checkUserCredentials(
          email!, password!, BlocProvider.of<SignUpCubit>(context).patients);
    } else {
      setState(
        () {
          autoValidate = AutovalidateMode.always;
        },
      );
    }
  }
}
