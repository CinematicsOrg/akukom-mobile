import 'package:akukom/app/locator.dart';
import 'package:akukom/camera.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/components/toast.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/shared_blocs/user_bloc/user_bloc.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatelessWidget {
  static const String routeName = '/edit_profile';

  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      body: Column(
        children: [
          BlocBuilder<EditProfileCubit, EditProfileCubitState>(
            bloc: getIt<EditProfileCubit>(),
            builder: (context, state) {
              return ProfileAppBar(
                actionPath: state.isReadonly ? AppIcons.addSvg : null,
                title: AppStrings.editProfile,
                onActionTap: () {
                  getIt<EditProfileCubit>().changeStatus(
                    state.isEditing
                        ? EditProfileCubitStatus.readonly
                        : EditProfileCubitStatus.editing,
                  );
                },
              );
            },
          ),
          const VSpace(20),
          const _EditProfileInfo(),
          const VSpace(30),
          const _EditProfileForm(),
        ],
      ),
    );
  }
}

class _EditProfileInfo extends StatefulWidget {
  const _EditProfileInfo();

  @override
  State<_EditProfileInfo> createState() => _EditProfileInfoState();
}

class _EditProfileInfoState extends State<_EditProfileInfo> {
  final ProfileUploadImageBloc _profileUploadImageBloc =
      getIt<ProfileUploadImageBloc>();
  final UserBloc _userBloc = getIt<UserBloc>();

  @override
  void dispose() {
    _profileUploadImageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => openBottomSheet(context),
          child: BlocConsumer<ProfileUploadImageBloc, ProfileUploadImageState>(
            bloc: _profileUploadImageBloc,
            listener: onUploadImageListener,
            builder: (context, state) {
              if (state.status == ProfileUploadImageStatus.loading) {
                return const SizedBox(
                  height: 48,
                  width: 48,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              return BlocBuilder<UserBloc, UserState>(
                bloc: _userBloc,
                builder: (context, state) {
                  if (state.user?.image != null) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: ImageWidget(
                        imageUrl: state.user!.image!,
                        imageTypes: ImageTypes.network,
                        height: 48.h,
                        width: 48.w,
                      ),
                    );
                  }
                  return Container(
                    height: 48.h,
                    width: 48.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kcPrimaryColor,
                    ),
                  );
                },
              );
            },
          ),
        ),
        const VSpace(8),
        BlocBuilder<UserBloc, UserState>(
          bloc: getIt<UserBloc>(),
          builder: (context, state) {
            final firstName =
                state.user!.firstName?.capitalizeFirstLetter ?? '';
            final lastName = state.user!.lastName?.capitalizeFirstLetter ?? '';
            return TextWidget.bold(
              '$firstName $lastName',
              fontSize: sp(20),
              textColor: Theme.of(context).textTheme.titleMedium!.color,
            );
          },
        ),
        const VSpace(30),
      ],
    );
  }

  void openBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200.h,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                ListTile(
                  title: const TextWidget.bold(AppStrings.camera),
                  onTap: openCamera,
                ),
                ListTile(
                  title: const TextWidget.bold(AppStrings.gallery),
                  onTap: _pickImageFromGallery,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void openCamera() {
    final result = AppRouter.instance.navigateTo(CameraScreen.routeName);
    result.then((value) {
      if (value != null) {
        uploadImage(value);
      }
    });
  }

  Future<void> _pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (image != null) {
      uploadImage(image);
    }
  }

  void uploadImage(XFile file) {
    Navigator.pop(context);
    final params = UploadProfileImageParams(image: file);
    _profileUploadImageBloc.add(ProfileUploadImageEventStarted(params: params));
  }
}

extension _EditProfileInfoListener on _EditProfileInfoState {
  void onUploadImageListener(
    BuildContext context,
    ProfileUploadImageState state,
  ) {
    if (state.status == ProfileUploadImageStatus.success) {
      final user = state.data?.user;
      if (user != null) {
        _userBloc.add(UpdateUser(user));
        debugPrint('User: $user');
      }
      Toast.showSuccess(state.message ?? '');
    } else if (state.status == ProfileUploadImageStatus.failure) {
      Toast.showError(state.failures?.message ?? '');
    }
  }
}

class _EditProfileForm extends StatefulWidget {
  const _EditProfileForm();

  @override
  State<_EditProfileForm> createState() => __EditProfileFormState();
}

class __EditProfileFormState extends State<_EditProfileForm> {
  final EditProfileCubit _editProfileCubit = getIt<EditProfileCubit>();
  final EditProfileBloc _editProfileBloc = getIt<EditProfileBloc>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryOfResidenceController =
      TextEditingController();
  // final TextEditingController _tribeController = TextEditingController();

  @override
  void initState() {
    final UserBloc userBloc = getIt<UserBloc>();
    final userData = userBloc.state.user;
    _firstNameController.text = userData!.firstName ?? '';
    _lastNameController.text = userData.lastName ?? '';
    _emailController.text = userData.email ?? '';
    _countryOfResidenceController.text = userData.country ?? 'Select Country';
    // _tribeController.text = userData.tribe ?? '';
    _editProfileCubit.reset();
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _editProfileBloc.close();

    _countryOfResidenceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileCubitState>(
      bloc: _editProfileCubit,
      builder: (context, state) {
        return Column(
          children: [
            TextFieldWidget(
              hintText: AppStrings.firstNameHint,
              title: AppStrings.firstName,
              textEditingController: _firstNameController,
              readOnly: true,
            ),
            vSpace(24),
            TextFieldWidget(
              hintText: AppStrings.lastNameHint,
              title: AppStrings.lastName,
              textEditingController: _lastNameController,
              readOnly: true,
            ),
            vSpace(24),
            TextFieldWidget(
              hintText: AppStrings.emailHint,
              title: AppStrings.email,
              textEditingController: _emailController,
              textInputType: TextInputType.emailAddress,
              readOnly: state.isReadonly,
            ),
            vSpace(24),
            TextFieldWidget(
              onTap: () => showCountryPicker(
                context: context,
                showPhoneCode: true,
                onSelect: selectCountry,
              ),
              hintText: AppStrings.countryOfResidenceHint,
              title: AppStrings.countryOfResidence,
              textEditingController: _countryOfResidenceController,
              textInputType: TextInputType.emailAddress,
              readOnly: state.isReadonly,
              onChanged: _editProfileCubit.countryChanged,
            ),
            // vSpace(24),
            // TextFieldWidget(
            //   hintText: AppStrings.tribe,
            //   title: AppStrings.tribeHint,
            //   textEditingController: _tribeController,
            //   readOnly: state.isReadonly,
            // ),
            vSpace(30),
            Visibility(
              visible: state.isEditing,
              child: Column(
                children: [
                  BlocConsumer<EditProfileBloc, EditProfileState>(
                    bloc: _editProfileBloc,
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state.status == EditProfileStatus.loading) {
                        return const Button.loading();
                      }
                      return Button(
                        text: 'Submit',
                        onTap: () {
                          final params = EditProfileParams(
                            email: _emailController.text,
                            country: _countryOfResidenceController.text,
                          );
                          _editProfileBloc.add(
                            UpdateProfileEvent(params: params),
                          );
                        },
                      );
                    },
                  ),
                  BlocListener<EditProfileBloc, EditProfileState>(
                    bloc: _editProfileBloc,
                    listener: onEditProfileListener,
                    child: Button(
                      color: Colors.transparent,
                      textColor: kcBlack,
                      text: 'Cancel',
                      onTap: () {
                        _editProfileCubit
                            .changeStatus(EditProfileCubitStatus.readonly);
                      },
                    ),
                  ),
                ],
              ),
            ),
            vSpace(30),
          ],
        );
      },
    );
  }

  void selectCountry(Country country) {
    final countryName = country.name;
    _countryOfResidenceController.text = countryName;
    _editProfileCubit.countryChanged(countryName);
  }
}

extension __EditProfileFormListener on __EditProfileFormState {
  void onEditProfileListener(
    BuildContext context,
    EditProfileState state,
  ) {
    if (state.status == EditProfileStatus.success) {
      Toast.showSuccess('Profile updated successfully');
    } else if (state.status == EditProfileStatus.failure) {
      Toast.showError('Profile update failed: ${state.failures?.message}');
    }
  }
}
