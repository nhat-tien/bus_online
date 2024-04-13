import "package:flutter/material.dart";

class MessagePage extends StatelessWidget {
  MessagePage({super.key});

  final List<Map<String, String>> notifications = [
    {
      'heading': 'ƯU ĐÃI CHO SINH VIÊN !',
      'content':
          'Giảm 70% đối với người dùng là HS/SV xin vui lòng đưa thẻ HS/SV cho tài xế trước khi lên xe buýt, xin cảm ơn ! \n Chúc bạn có một trãi nghiệm dịch vụ của chúng tôi tốt nhất !',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Thông báo',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
					const SizedBox(height: 20,),
				Expanded(
				  child: ListView.builder(
				                        itemCount: notifications.length,
				                        itemBuilder: (_, index) {
				                          final notification = notifications[index];
				                          return NotificationItem(notification: notification);
				                        }),
				),
		]),
          );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});

  final Map<String, String> notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Column(
        children: [
          Padding(
						padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              '${notification['heading']}',
              style: const TextStyle(
                color: Colors.white,
								fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Padding(
						padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
              '${notification['content']}',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
