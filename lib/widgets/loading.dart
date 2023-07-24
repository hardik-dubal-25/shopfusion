import 'package:flutter/material.dart';
import 'package:flutter_fimber/flutter_fimber.dart';

class Loading extends StatelessWidget {
  final log = FimberLog("Loading");
  final bool isShow;

  Loading({super.key, this.isShow = true});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isShow,
      child: Container(
        color: Colors.transparent,
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 4,color: Colors.teal,),
        ),
      ),
    );
  }
}
