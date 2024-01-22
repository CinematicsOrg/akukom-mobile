import 'dart:io';

import 'package:akukom/app/locator.dart';
import 'package:akukom/camera.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/components/toast.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/cores/navigator/navigator.dart';
import 'package:akukom/cores/utils/utils.dart';
import 'package:akukom/features/family_group/__family_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class CreateFamilyGroupScreen extends StatelessWidget {
  static const String routeName = '/create-family-group';
  const CreateFamilyGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      dismissKeyboardOnTap: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                AppStrings.criteria,
                fontSize: sp(kfsSuperLarge),
                fontWeight: FontWeight.bold,
              ),
              GestureDetector(
                onTap: goToAddFamilyMembers,
                child: const Svg(
                  path: AppIcons.personAddSvg,
                ),
              ),
            ],
          ),
          const VSpace(20),
          TextWidget(
            AppStrings.pleaseFillThisForm,
            fontSize: sp(kfsLarge),
            fontWeight: FontWeight.w500,
            textColor: kcGrey600,
          ),
          const VSpace(45),
          const _CreateFamilyForm(),
        ],
      ),
    );
  }

  void goToAddFamilyMembers() {
    AppRouter.instance.navigateTo(AddFamilyMembersView.routeName);
  }
}

class _CreateFamilyForm extends StatefulWidget {
  const _CreateFamilyForm();

  @override
  State<_CreateFamilyForm> createState() => __CreateFamilyFormState();
}

class __CreateFamilyFormState extends State<_CreateFamilyForm> {
  final TextEditingController _familyNameController = TextEditingController();
  final TextEditingController _familyDescriptionController =
      TextEditingController();

  final CreateFamilyFormCubit _createFamilyFormCubit =
      getIt<CreateFamilyFormCubit>();
  final AddFamilyMemberListCubit addFamilyMemberListCubit =
      getIt<AddFamilyMemberListCubit>();

  final CreateFamilyBloc _createFamilyBloc = getIt<CreateFamilyBloc>();
  final AddFamilyMembersBloc _addFamilyMembersBloc =
      getIt<AddFamilyMembersBloc>();

  @override
  void dispose() {
    _familyNameController.dispose();
    _familyDescriptionController.dispose();
    _createFamilyFormCubit.close();
    _createFamilyBloc.close();
    _addFamilyMembersBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddFamilyMembersBloc, AddFamilyMembersState>(
      bloc: _addFamilyMembersBloc,
      listener: listenAddFamilyMembersBloc,
      child: BlocBuilder<CreateFamilyFormCubit, CreateFamilyFormState>(
        bloc: _createFamilyFormCubit,
        builder: (context, state) {
          final XFile? familyImage = state.familyImage;
          return Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                  child: GestureDetector(
                    onTap: () => openBottomSheet(context),
                    child: familyImage == null
                        ? const Svg(
                            path: AppIcons.createFamilySvg,
                          ) // SVG for null case
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            child: SizedBox(
                              height: 200.h,
                              width: 200.w,
                              child: Image.file(
                                File(familyImage.path),
                              ),
                            ),
                          ),
                  ),
                ),
              ),
              const VSpace(40),
              TextFieldWidget(
                textEditingController: _familyNameController,
                hintText: AppStrings.familyNameHint,
                title: AppStrings.familyName,
                onChanged: _createFamilyFormCubit.familyNameChanged,
              ),
              const VSpace(20),
              TextFieldWidget(
                textEditingController: _familyDescriptionController,
                hintText: AppStrings.familyDescriptionHint,
                title: AppStrings.familyDescription,
                onChanged: _createFamilyFormCubit.familyDescriptionChanged,
              ),
              const VSpace(40),
              BlocConsumer<CreateFamilyBloc, CreateFamilyState>(
                bloc: _createFamilyBloc,
                listener: listenCreateFamilyBloc,
                builder: (context, createFamilyState) {
                  return createFamilyState.status ==
                              CreateFamilyStatus.loading ||
                          _addFamilyMembersBloc.state.status ==
                              AddFamilyMembersStatus.loading
                      ? const Button.loading(
                          color: kcWhite,
                        )
                      : Button(
                          active: _createFamilyFormCubit.state.isValid,
                          text: AppStrings.create,
                          onTap: () {
                            createFamily();
                            // AppRouter.instance.navigateTo(FamilyGroupChatView.routeName);
                          },
                        );
                },
              ),
              const VSpace(16),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const TextWidget(
                  AppStrings.cancel,
                ),
              )
            ],
          );
        },
      ),
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

  void addFamilyMembers() {
    // Use map and toList to transform the set into a list of user IDs
    final List<String> userToAdd = addFamilyMemberListCubit.state.familyMembers!
        .map((element) => element.id ?? '')
        .toList();

    _addFamilyMembersBloc.add(
      AddFamilyMembersUserEvent(
        param: AddFamilyMembersParam(
          familyId: _createFamilyBloc.state.data!.data?.id ?? '',
          usersToAdd: userToAdd,
        ),
      ),
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
    _createFamilyFormCubit.familyImageChanged(file);
  }

  void createFamily() {
    _createFamilyBloc.add(
      CreateFamilyUserEvent(
        param: CreateFamilyParam(
          familyName: _familyNameController.text,
          familyDescription: _familyDescriptionController.text,
          image: _createFamilyFormCubit.state.familyImage!,
        ),
      ),
    );
  }
}

extension on __CreateFamilyFormState {
  void listenCreateFamilyBloc(BuildContext context, CreateFamilyState bloc) {
    _createFamilyBloc.stream.listen((state) {
      if (state.status == CreateFamilyStatus.success) {
        Toast.showSuccess(
          state.message ?? '',
        );
        if (addFamilyMemberListCubit.state.familyMembers!.isNotEmpty) {
          addFamilyMembers();
        } else {
          AppRouter.instance
              .navigateToAndReplace(FamilyGroupChatView.routeName);
        }
      } else if (state.status == CreateFamilyStatus.failure) {
        Toast.showError(
          state.message ?? '',
        );
      }
    });
  }

  void listenAddFamilyMembersBloc(
      BuildContext context, AddFamilyMembersState bloc) {
    _addFamilyMembersBloc.stream.listen((state) {
      if (state.status == AddFamilyMembersStatus.success) {
        Toast.showSuccess(
          state.message ?? '',
        );
        addFamilyMemberListCubit.resetFamilyMembers();
        AppRouter.instance.navigateToAndReplace(FamilyGroupChatView.routeName);
      } else if (state.status == AddFamilyMembersStatus.failure) {
        Toast.showError(
          state.message ?? '',
        );
      }
    });
  }
}
