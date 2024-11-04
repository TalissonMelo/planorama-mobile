import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  final List<Map<String, dynamic>> notifications = const [
    {
      "title": "Agendamento Confirmado",
      "message": "Atendimento agendado com Talisson Mello para amanhã às 10h.",
      "time": "10:00",
      "isRead": false,
    },
    {
      "title": "Pedido Entregue!",
      "message":
          "Seu pedido acabou de ser entregue. Agradecemos por confiar em nossa loja!",
      "time": "12:30",
      "isRead": false,
    },
    {
      "title": "Atualização de Sistema",
      "message": "Manutenção programada para esta noite, das 23h às 02h.",
      "time": "08:00",
      "isRead": true,
    },
    {
      "title": "Dica do Dia",
      "message": "Organize seus compromissos com cores e alertas!",
      "time": "09:00",
      "isRead": true,
    },
    {
      "title": "Aniversário de Cliente",
      "message":
          "Hoje é aniversário de **Ana Silva**! Envie uma mensagem especial.",
      "time": "07:30",
      "isRead": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final unreadNotifications =
        notifications.where((n) => n['isRead'] == false).toList();
    final readNotifications =
        notifications.where((n) => n['isRead'] == true).toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            'notificacao'.tr,
            style: const TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            tabs: [
              Tab(text: 'nao_lidas'.tr),
              Tab(text: 'lidas'.tr),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildNotificationList(unreadNotifications),
            _buildNotificationList(readNotifications),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(List<Map<String, dynamic>> notifications) {
    if (notifications.isEmpty) {
      return const Center(
        child: Text(
          'No notifications found.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      );
    }

    return ListView.separated(
      itemCount: notifications.length,
      separatorBuilder: (context, index) => const Divider(
        color: Colors.white,
        thickness: 1,
        height: 10,
      ),
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return ListTile(
          leading: Image.asset(
            'assets/images/logo_planorama.png',
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Text(notification['title']!),
          subtitle: Text(notification['message']!),
          trailing: Text(notification['time']!),
        );
      },
    );
  }
}
