import 'package:agendify/core/components/app_bar_component.dart';
import 'package:agendify/core/service/http_methods.dart';
import 'package:agendify/features/dashboard/presentation/components/dashboard_item_component.dart';
import 'package:agendify/features/scheduling/data/scheduling_service.dart';
import 'package:agendify/features/scheduling/domain/scheduling_entity.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  SchedulingService service = SchedulingService('agenda', HttpMethods());

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int nowCont = 0;
  int totalCont = 0;

  void setNowDash(List<SchedulingEntity> list) async {
    DateTime dateNow = DateTime.now();
    int cont = 0;
    list.forEach((element) {
      if (element.date.day == dateNow.day &&
          element.date.month == dateNow.month &&
          element.date.year == dateNow.year) {
        cont += 1;
      }
    });

    setState(() {
      nowCont = cont;
    });
  }

  void setTotalDash(List<SchedulingEntity> list) {
    setState(() {
      totalCont = list.length;
    });
  }

  Future<List<SchedulingEntity>> getScheduling() async {
    List<SchedulingEntity> list = await widget.service.loadAgendas();
    return list;
  }

  void loadDashboards() async {
    List<SchedulingEntity> listScheduling = await getScheduling();

    setNowDash(listScheduling);
    setTotalDash(listScheduling);
  }

  @override
  void initState() {
    super.initState();
    loadDashboards();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(title: 'Dashboard'),
      body: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Color(0xFF1D1D29),
        ),
        child: Column(
          children: [
            DashboardItemComponent(
              title: 'Agendamentos hoje',
              value: nowCont,
              icon: Icons.person,
            ),
            SizedBox(
              height: 20.0,
            ),
            DashboardItemComponent(
              title: 'Total de agendamentos',
              value: totalCont,
              icon: Icons.today,
            ),
          ],
        ),
      ),
    );
  }
}
