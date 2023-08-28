import 'dart:async';

import 'package:alvamind_library_two/app/theme/app_colors.dart';
import 'package:alvamind_library_two/app/theme/app_sizes.dart';
import 'package:alvamind_library_two/app/theme/app_text_style.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';

class AppQuill extends StatefulWidget {
  final HtmlEditorController? controller;
  final String? hintText;
  final double? height;
  final Callbacks? callbacks;
  final List<Plugins>? plugins;
  final FutureOr<bool> Function(ButtonType, bool?, Function?)? onButtonPressed;
  final FutureOr<bool> Function(DropdownType, dynamic, void Function(dynamic)?)? onDropdownChange;
  final FutureOr<bool> Function(String, InsertFileType)? mediaLinkInsertInterceptor;
  final FutureOr<bool> Function(PlatformFile, InsertFileType)? mediaUploadInterceptor;
  final FutureOr<bool> Function(String, String, bool)? linkInsertInterceptor;

  const AppQuill({
    Key? key,
    this.controller,
    this.height,
    this.hintText,
    this.callbacks,
    this.linkInsertInterceptor,
    this.mediaLinkInsertInterceptor,
    this.mediaUploadInterceptor,
    this.onButtonPressed,
    this.onDropdownChange,
    this.plugins,
  }) : super(key: key);

  @override
  _AppQuillState createState() => _AppQuillState();
}

class _AppQuillState extends State<AppQuill> {
  final HtmlEditorController controller = HtmlEditorController();

  Color borderColor = AppColors.baseLv5;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(AppSizes.radius * 2)),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppSizes.padding / 3,
          left: AppSizes.padding / 3,
          bottom: AppSizes.padding / 3,
          right: AppSizes.padding * 1.5,
        ),
        child: HtmlEditor(
          controller: widget.controller ?? controller,
          htmlEditorOptions: HtmlEditorOptions(
            hint: widget.hintText ?? 'Masukan deskripsi program...',
          ),
          htmlToolbarOptions: HtmlToolbarOptions(
              toolbarPosition: ToolbarPosition.belowEditor,
              toolbarType: ToolbarType.nativeScrollable,
              dropdownBackgroundColor: AppColors.white,
              renderSeparatorWidget: true,
              toolbarItemHeight: 32,
              buttonBorderWidth: 1,
              dropdownElevation: 3,
              buttonBorderColor: AppColors.baseLv6,
              renderBorder: true,
              buttonColor: AppColors.baseLv4,
              buttonBorderRadius: BorderRadius.circular(AppSizes.radius),
              dropdownMenuDirection: DropdownMenuDirection.down,
              textStyle: AppTextStyle.regular(context, fontSize: 14),
              defaultToolbarButtons: const [
                FontButtons(),
                StyleButtons(),
                ColorButtons(),
                ListButtons(),
                FontSettingButtons(),
                ParagraphButtons(),
                InsertButtons()
              ],
              onButtonPressed: widget.onButtonPressed ??
                  (ButtonType type, bool? status, Function? updateStatus) {
                    print("button '${describeEnum(type)}' pressed, the current selected status is $status");
                    return true;
                  },
              onDropdownChanged: widget.onDropdownChange ??
                  (DropdownType type, dynamic changed, Function(dynamic)? updateSelectedItem) {
                    print("dropdown '${describeEnum(type)}' changed to $changed");
                    return true;
                  },
              mediaLinkInsertInterceptor: widget.mediaLinkInsertInterceptor ??
                  (String url, InsertFileType type) {
                    print(url);
                    return true;
                  },
              mediaUploadInterceptor: widget.mediaUploadInterceptor ??
                  (PlatformFile file, InsertFileType type) async {
                    print(file.name);
                    print(file.size);
                    print(file.extension);
                    return true;
                  },
              linkInsertInterceptor: widget.linkInsertInterceptor ?? null),
          otherOptions: OtherOptions(
            height: widget.height ?? 350,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(AppSizes.radius * 2)),
          ),
          callbacks: widget.callbacks ??
              Callbacks(onBeforeCommand: (String? currentHtml) {
                print('html before change is $currentHtml');
              }, onChangeContent: (String? changed) {
                print('content changed to $changed');
              }, onChangeCodeview: (String? changed) {
                print('code changed to $changed');
              }, onChangeSelection: (EditorSettings settings) {
                print('parent element is ${settings.parentElement}');
                print('font name is ${settings.fontName}');
              }, onDialogShown: () {
                print('dialog shown');
              }, onEnter: () {
                print('enter/return pressed');
              }, onFocus: () {
                setState(() {
                  borderColor = AppColors.primary;
                });
                print('editor focused');
              }, onBlur: () {
                setState(() {
                  borderColor = AppColors.baseLv4;
                });
                print('editor unfocused');
              }, onBlurCodeview: () {
                print('codeview either focused or unfocused');
              }, onInit: () {
                print('init');
              },
                  //this is commented because it overrides the default Summernote handlers
                  /*onImageLinkInsert: (String? url) {
                print(url ?? "unknown url");
              },
              onImageUpload: (FileUpload file) async {
                print(file.name);
                print(file.size);
                print(file.type);
                print(file.base64);
              },*/
                  onImageUploadError: (FileUpload? file, String? base64Str, UploadError error) {
                print(describeEnum(error));
                print(base64Str ?? '');
                if (file != null) {
                  print(file.name);
                  print(file.size);
                  print(file.type);
                }
              }, onKeyDown: (int? keyCode) {
                print('$keyCode key downed');
                print('current character count: ${controller.characterCount}');
              }, onKeyUp: (int? keyCode) {
                print('$keyCode key released');
              }, onMouseDown: () {
                print('mouse downed');
              }, onMouseUp: () {
                print('mouse released');
              }, onNavigationRequestMobile: (String url) {
                print(url);
                return NavigationActionPolicy.ALLOW;
              }, onPaste: () {
                print('pasted into editor');
              }, onScroll: () {
                print('editor scrolled');
              }),
          plugins: widget.plugins ??
              [
                SummernoteAtMention(
                    getSuggestionsMobile: (String value) {
                      var mentions = <String>[
                        'test1',
                        'test2',
                        'test3'
                      ];
                      return mentions.where((element) => element.contains(value)).toList();
                    },
                    mentionsWeb: [
                      'test1',
                      'test2',
                      'test3'
                    ],
                    onSelect: (String value) {
                      print(value);
                    }),
              ],
        ),
      ),
    );
  }
}
