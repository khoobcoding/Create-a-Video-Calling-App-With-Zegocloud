import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoCalling extends StatefulWidget {
  const VideoCalling({Key? key}) : super(key: key);

  @override
  State<VideoCalling> createState() => _VideoCallingState();
}

class _VideoCallingState extends State<VideoCalling> {
  final callidtextcontroller = TextEditingController(text: 'call_id');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Zegocloud'),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: callidtextcontroller,
                decoration:
                    const InputDecoration(labelText: 'join a call by Id'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: ((context) {
                    return CallPage(callid: callidtextcontroller.text);
                  })));
                },
                child: const Text('Join'))
          ],
        ),
      )),
    );
  }
}

class CallPage extends StatelessWidget {
  final String callid;
  CallPage({required this.callid, super.key});

  final String Localuserid = Random().nextInt(1000).toString();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ZegoUIKitPrebuiltCall(
      appID: 1234567,
      appSign:
          'ebj34nh5...',
      userID: '$Localuserid',
      callID: callid,
      userName: 'user_$Localuserid',
      config: ZegoUIKitPrebuiltCallConfig.groupVideoCall(),
    ));
  }
}
