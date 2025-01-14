import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nursery_app/constants.dart';
import 'package:nursery_app/core/helpers/show_message.dart';
import 'package:nursery_app/core/models/patient.dart';
import 'package:nursery_app/core/utils/styles.dart';
import 'package:nursery_app/features/start/presentation/views/cubits/cubit/sign_up_cubit.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/custom_border_text_form_filed.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/drop_down.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/reset_button.dart';
import 'package:nursery_app/features/start/presentation/views/widgets/sign_in_button.dart';

class SginUpForm extends StatefulWidget {
  const SginUpForm({super.key});

  @override
  State<SginUpForm> createState() => _SginInFormState();
}

class _SginInFormState extends State<SginUpForm> {
  String? firstName;
  String? sex;
  String? age;
  String? secondName;
  String? email;
  String? password;
  String? babyName;
  String? phone;
  String? babyGender;
  GlobalKey<FormState> fromKey = GlobalKey();

  AutovalidateMode autoValidate = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) async {
        if (state is SignUpFaileur) {
          context.pop();
          context.pop();
          showMessage(context, message: state.errorMessage);
        }
        if (state is SignUpSuccess) {
          context.pop();
          context.pop();
          showMessage(context,
              message: "Registration successful! Please sign in.");
        }
      },
      builder: (context, state) {
        return state is SignUpLoading
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
                            "First Name",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            icon: Icons.person,
                            type: "name",
                            hintText: "Enter first name",
                            onSaved: (p0) {
                              firstName = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Second Name",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            icon: Icons.person,
                            type: "name",
                            hintText: "Enter second name",
                            onSaved: (p0) {
                              secondName = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Age",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            type: "number",
                            hintText: "Enter Your Age",
                            onSaved: (p0) {
                              age = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Sex",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownWidget(
                            hintText: "Select Your Gender",
                            onChanged: (p0) {},
                            onSaved: (p0) {
                              sex = p0;
                            },
                            items: const ["male", "female"],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Email",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            icon: Icons.email,
                            type: "email",
                            hintText: "Enter email",
                            onSaved: (p0) {
                              email = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Password",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            icon: Icons.lock,
                            type: "password",
                            hintText: "Enter password",
                            onSaved: (p0) {
                              password = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Phone",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            icon: Icons.phone,
                            type: "number",
                            hintText: "Enter phone",
                            onSaved: (p0) {
                              phone = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Baby Name",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomBorderTextFormFiled(
                            icon: Icons.child_care,
                            type: "name",
                            hintText: "Enter Baby name",
                            onSaved: (p0) {
                              babyName = p0;
                            },
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            "Baby Gender",
                            style: Styles.styleText16,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownWidget(
                            hintText: "Select Baby Gender",
                            onChanged: (p0) {},
                            onSaved: (p0) {
                              babyGender = p0;
                            },
                            items: const ["male", "female"],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          RestButton(
                            onPressed: () {
                              setState(() {
                                fromKey.currentState?.reset();
                              });
                            },
                          ),
                          SginInButton(
                            load: false,
                            textContent: "Sing Up",
                            onPressed: () async {
                              validataMethod(context);
                            },
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: Styles.styleText16,
                              ),
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero, // Remove padding
                                ),
                                child: Text(
                                  "Sign In",
                                  style: Styles.styleText16.copyWith(
                                    color: kSpecialColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
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
      Patient obj = Patient(
        firstName: firstName!,
        secondName: secondName!,
        age: int.parse(age!),
        sex: sex!,
        email: email!,
        password: password!,
        babyName: babyName!,
        phone: phone!,
        babyGender: babyGender!,
      );
      BlocProvider.of<SignUpCubit>(context).addUser(obj);
    } else {
      setState(
        () {
          autoValidate = AutovalidateMode.always;
        },
      );
    }
  }
}
