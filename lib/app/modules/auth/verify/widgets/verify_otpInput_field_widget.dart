import 'package:flutter/services.dart';
import 'package:manager_ads/app/core/constants/app_packages.dart';

class VerifyOtpInputFieldWidget extends StatefulWidget {
  final void Function(String)? onCompleted;
  const VerifyOtpInputFieldWidget({super.key, this.onCompleted});

  @override
  State<VerifyOtpInputFieldWidget> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<VerifyOtpInputFieldWidget> {
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length > 1) {
      controllers[index].text = value.substring(value.length - 1);
    }
    if (value.isNotEmpty && index < 5) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    }
    if (controllers.every((c) => c.text.isNotEmpty)) {
      final code = controllers.map((c) => c.text).join();
      widget.onCompleted?.call(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return SizedBox(
          width: 55,
          height: 60,
          child: TextField(
            focusNode: focusNodes[index],
            controller: controllers[index],
            textAlign: TextAlign.center,
            maxLength: 1,
            style: AppTextTheme.textTheme.titleLarge!.copyWith(
              fontSize: 19,
              color: AppColors.darkModeColor,
            ),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: AppColors.lightGrayColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.text,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
            ],
            textInputAction:
                index == 5 ? TextInputAction.done : TextInputAction.next,
            onChanged: (val) => _onChanged(val, index),
          ),
        );
      }),
    );
  }
}
