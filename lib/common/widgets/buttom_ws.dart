import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:vsckeyboard/features/2_keyboard_setting/controllers/keyboard_settings.dart';
import 'package:web_socket_client/web_socket_client.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WsConnectButton extends StatelessWidget {
  const WsConnectButton({
    super.key,
    required this.settingController,
  });

  final KeyboardSettingController settingController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (settingController.connectionState == null ||
            settingController.connectionState is Disconnected) {
          settingController.tryWebsocketConnection();
        }
      },
      onLongPress: () {
        if (settingController.connectionState != null) {
          settingController.stopWebsocketConnection();
        }
      },
      style: ButtonStyle(
        side: MaterialStateProperty.all(
            const BorderSide(color: Colors.grey, width: 2)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 40,
            child: Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                settingController.connectionState is Connected ||
                        settingController.connectionState is Reconnected
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          MdiIcons.lanConnect,
                          color: Colors.deepPurpleAccent,
                        ),
                      )
                    : settingController.connectionState is Reconnecting
                        ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SpinKitRipple(
                              color: Colors.white,
                              size: 30.0,
                            ),
                        )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(MdiIcons.lanDisconnect,
                                color: Colors.grey),
                          ),
                Flexible(
                  child: Text(settingController.connectionState == null ||
                          settingController.connectionState is Disconnected
                      ? 'Connect to : ${settingController.routeAddress}'
                      : settingController.connectionState is! Connected &&
                              settingController.connectionState is! Reconnected
                          ? '${settingController.connectionState.runtimeType.toString()} to ${settingController.routeAddress}\nPress and hold to cancel'
                          : 'Connected to ${settingController.routeAddress}\nPress and hold to disconnect', overflow: TextOverflow.fade,maxLines: 2,),
                ),
              ],
            ))),
      ),
    );
  }
}
