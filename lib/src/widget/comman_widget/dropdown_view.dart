import 'package:flutter/material.dart';
import 'package:marvel/src/config/colors.dart';
import 'package:marvel/src/config/text_style.dart';

Widget dropdownView({
  List<String>? dataList,
  String? hintText,
  Function(String?)? onChange,
  String? value,
  double? rightPadding,
  double? leftPadding,
  double? topPadding,
  double? bottomPadding,
  String? labelText,
}) {
  return Container(
    padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
    child: DropdownButtonFormField(
      
      style: AppTextStyle.regular16.copyWith(
        color: AppColors.whiteColor,
      ),
      elevation: 0,
      isExpanded: true,
      dropdownColor: AppColors.whiteColor,
      decoration: InputDecoration(
        hintText: hintText ?? "Select Any Item",
        hintStyle:
            AppTextStyle.regular16.copyWith(color: AppColors.primaryGreyColor),
        border: InputBorder.none,
        
        alignLabelWithHint: false,
        labelText: labelText ?? "",
        labelStyle: AppTextStyle.regular16
            .copyWith(color: AppColors.primaryGreyColor, fontSize: 14),
        contentPadding: EdgeInsets.fromLTRB(
          leftPadding ?? 2,
          topPadding ?? 0,
          rightPadding ?? 0,
          bottomPadding ?? 0,
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.primaryGreyColor.withOpacity(0.5),
              style: BorderStyle.solid,
            )),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColors.primaryGreyColor.withOpacity(0.5),
            style: BorderStyle.solid,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryRedColor,
          ),
        ),
      ),
      items: dataList!.map((e) {
        return DropdownMenuItem(
            value: e,
            child: Row(
              children: [
                SizedBox(
                  width: leftPadding != null ? 0 : 15,
                ),
                Text(
                  e,
                  style: AppTextStyle.regular16
                      .copyWith(color: AppColors.primaryGreyColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ));
      }).toList(),
      hint: Row(
        children: [
          SizedBox(
            width: leftPadding != null ? 0 : 15,
          ),
          Text(
            hintText!,
            style: AppTextStyle.regular16.copyWith(
              color: AppColors.primaryGreyColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      icon: Row(
        children: const [
          Icon(
            Icons.keyboard_arrow_down_outlined,
            size: 25,
          ),
          SizedBox(width: 15),
        ],
      ),
      validator: (value) => value == null ? 'Field Required' : null,
      value: value,
      onChanged: onChange,
    ),
  );
}
