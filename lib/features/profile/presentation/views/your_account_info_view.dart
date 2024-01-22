import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/shared_blocs/__shared_bloc.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:flutter/material.dart';

class YourAccountInfoView extends StatelessWidget {
  static const String routeName = '/your-account-info';
  const YourAccountInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NormalScaffoldWidget(
      body: Column(
        children: [
          ProfileAppBar(
            title: AppStrings.yourAccount,
          ),
          VSpace(20),
          _YourAccountInfoForm()
        ],
      ),
    );
  }
}

class _YourAccountInfoForm extends StatefulWidget {
  const _YourAccountInfoForm();

  @override
  State<_YourAccountInfoForm> createState() => _YourAccountInfoFormState();
}

class _YourAccountInfoFormState extends State<_YourAccountInfoForm> {
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final countryController = TextEditingController();

  @override
  void initState() {
    final user = getIt<UserBloc>().state.user;
    phoneController.text = user?.phone ?? '';
    emailController.text = user?.email ?? '';
    countryController.text = user?.country ?? '';
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    emailController.dispose();
    countryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldWidget(
          hintText: AppStrings.phoneNumber,
          title: AppStrings.phoneNumber,
          textEditingController: phoneController,
          textInputType: TextInputType.number,
          readOnly: true,
          suffixWidget: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Svg(path: AppIcons.editSvg),
          ),
        ),
        const VSpace(20),
        TextFieldWidget(
          hintText: AppStrings.emailHint,
          title: AppStrings.email,
          textEditingController: emailController,
          readOnly: true,
          textInputType: TextInputType.emailAddress,
          suffixWidget: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Svg(path: AppIcons.editSvg),
          ),
        ),
        const VSpace(20),
        TextFieldWidget(
          hintText: AppStrings.country,
          title: AppStrings.countryOfResidence,
          textEditingController: countryController,
          readOnly: true,
          suffixWidget: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Svg(path: AppIcons.editSvg),
          ),
        ),
      ],
    );
  }
}
