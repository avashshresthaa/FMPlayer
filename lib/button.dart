import 'package:flutter/material.dart';

import 'custom_text.dart';

class SignUpButton extends StatelessWidget {
  final preText, title, onPress;
  const SignUpButton({Key? key, this.preText, this.title, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          backgroundColor: Colors.white,
          elevation: 0,
          foregroundColor: const Color(0xFF1E7FB2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(
              color: Color(0xFF1E7FB2),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Text.rich(
            TextSpan(
              text: preText,
              style: TextStyle(
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.w400,
                color: const Color(0xff6E6E6E),
                fontSize: 14,
              ),
              children: [
                TextSpan(
                  text: title,
                  style: TextStyle(
                    fontFamily: 'NotoSans',
                    color: const Color(0xFF1E7FB2),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  // Add your sign up navigation here
                  // (e.g. Navigator.pushNamed(context, '/signup'))
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final onPress, text, color, textcolor, isFull;
  const LoginButton({
    Key? key,
    this.onPress,
    this.text,
    this.color,
    this.textcolor = Colors.white,
    this.isFull = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFull ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          elevation: 0,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: isFull ? 12.0 : 0.0),
          child: CustomText(
            text: text ?? "",
            fontSize: 14,
            weight: FontWeight.w500,
            color: textcolor,
          ),
        ),
      ),
    );
  }
}

class RetryWidget extends StatelessWidget {
  final onPress;
  const RetryWidget({
    super.key,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 55,
            ),
            SizedBox(height: 6),
            CustomText(
              text: 'Something went wrong',
            ),
            SizedBox(
              height: 4,
            ),
            LoginButton(
              isFull: false,
              text: 'Retry',
              onPress: onPress,
            )
          ],
        ),
      ),
    );
  }
}
