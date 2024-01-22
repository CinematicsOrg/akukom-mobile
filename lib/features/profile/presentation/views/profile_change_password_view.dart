import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/components/toast.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileChangePasswordView extends StatelessWidget {
  static const String routeName = '/profile-change-password';
  const ProfileChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const NormalScaffoldWidget(
      body: Column(
        children: [
          ProfileAppBar(
            title: AppStrings.changePassword,
          ),
          VSpace(20),
          _ChangePasswordForm(),
        ],
      ),
    );
  }
}

class _ChangePasswordForm extends StatefulWidget {
  const _ChangePasswordForm();

  @override
  State<_ChangePasswordForm> createState() => __ChangePasswordFormState();
}

class __ChangePasswordFormState extends State<_ChangePasswordForm> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final PasswordCubitCubit passwordCubitCubit = getIt();
  final ProfileChangePasswordBloc profileChangePasswordBloc = getIt();

  @override
  void initState() {
    passwordCubitCubit.reset();
    super.initState();
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    profileChangePasswordBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubitCubit, PasswordCubitState>(
      bloc: passwordCubitCubit,
      builder: (context, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWidget(
              hintText: AppStrings.currentPasswordHint,
              title: AppStrings.currentPassword,
              textEditingController: currentPasswordController,
              onChanged: passwordCubitCubit.currentPasswordChanged,
              isPassword: true,
            ),
            const VSpace(20),
            TextFieldWidget(
              hintText: AppStrings.newPasswordHint,
              title: AppStrings.newPassword,
              textEditingController: newPasswordController,
              onChanged: passwordCubitCubit.newPasswordChanged,
              isPassword: true,
            ),
            const VSpace(20),
            const TextWidget(AppStrings.passRequirement, textColor: kcGrey600),
            const VSpace(20),
            BlocConsumer<ProfileChangePasswordBloc, ProfileChangePasswordState>(
              bloc: profileChangePasswordBloc,
              listener: _listenToProfileChangePasswordState,
              builder: (context, state) {
                return state.status == ProfileChangePasswordStatus.loading
                    ? const Button.loading()
                    : Button(
                        active: passwordCubitCubit.state.isValid ?? false,
                        text: AppStrings.cont,
                        onTap: changePassword,
                      );
              },
            ),
          ],
        );
      },
    );
  }

  void changePassword() {
    final currentPassword = currentPasswordController.text;
    final newPassword = newPasswordController.text;
    final ProfileChangePasswordParam params = ProfileChangePasswordParam(
      currentPassword: currentPassword,
      newPassword: newPassword,
    );

    profileChangePasswordBloc.add(
      ProfileUserChangePasswordEvent(
        params: params,
      ),
    );
  }
}

extension __ChangePasswordBlocListener on __ChangePasswordFormState {
  void _listenToProfileChangePasswordState(
      BuildContext context, ProfileChangePasswordState state) {
    if (state.status == ProfileChangePasswordStatus.success) {
      Toast.showSuccess(state.message ?? '');
      AppRouter.instance.navigateToADashboard();
    } else if (state.status == ProfileChangePasswordStatus.failure) {
      Toast.showError(state.failures?.message ?? '');
    }
  }
}
