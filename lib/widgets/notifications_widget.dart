import 'package:flutter/material.dart';

import '../config/constants.dart';

class NotificationsWidget extends StatelessWidget {
  const NotificationsWidget({
    super.key,
  });

  void _onNotificationsIconTap() {
    dPrint('Notifications menu icon Clicked');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _onNotificationsIconTap,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent, // textFieldBg.withOpacity(0.12),
              borderRadius: BorderRadius.circular(500),
            ),
            height: 40,
            width: 40,
          ),
          Positioned(
            top: -2,
            right: -1,
            child: IconButton(
              iconSize: 22,
              onPressed: () {}, //_onNotificationsIconTap,
              icon: const Icon(Icons.notifications),
              alignment: Alignment.center,
            ),
          ),
          Positioned(
              top: 3,
              right: 3,
              child: Container(
                height: 19,
                width: 19,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.withOpacity(0.8), // Bright green color
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(-3, 3), // Adjust the offset as needed
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Material(
                    color: Colors.red,
                    child: Center(
                      child: Text(
                        '999+',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 7,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
