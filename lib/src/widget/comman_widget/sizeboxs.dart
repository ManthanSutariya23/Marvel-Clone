import 'package:flutter/cupertino.dart';

Widget sizedBoxHeight({
  @required BuildContext? context,
  @required double? height,
}) {
  return SizedBox(
    height: MediaQuery.of(context!).size.height / height!,
  );
}

Widget sizedBoxWidth(
    {@required BuildContext? context, @required double? width}) {
  return SizedBox(
    width: MediaQuery.of(context!).size.height / width!,
  );
}
