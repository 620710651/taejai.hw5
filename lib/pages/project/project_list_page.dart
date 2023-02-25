import 'package:flutter/material.dart';
import 'package:taejai/models/project.dart';
import 'package:intl/intl.dart';

class ProjectListPage extends StatefulWidget {
  const ProjectListPage({Key? key}) : super(key: key);

  @override
  State<ProjectListPage> createState() => _ProjectListPageState();
}

class _ProjectListPageState extends State<ProjectListPage> {
  List<Project> projects = [
    Project(
      title: 'อิ่มท้องน้องพิเศษ',
      description:
          'ชวนมอบมื้ออาหารกลางวันให้เด็กพิเศษ 240 คนในมูลนิธิบ้านครูบุญชูเพื่อเด็กพิเศษ',
      targetAmount: 119350,
      duration: 22,
      receiveAmount: 10000,
      donateCount: 13,
    ),
    Project(
      title: 'I’m ABLE “โอกาสจากพี่ ช่วยหนูได้เรียนร่วม”',
      description:
          'ระดมทุนการศึกษา 1 ปีให้กับเด็กนักเรียนพิการจำนวน 150 คนๆ ละ 4,000 บาท',
      targetAmount: 825000,
      duration: 138,
      receiveAmount: 400000,
      donateCount: 8,
    ),
    Project(
      title: 'พาพญาแร้งที่สูญพันธุ์จากธรรมชาติกลับคืนป่าเมืองไทย',
      description:
          'เกือบ 30 ปี ที่พญาแร้งหายไปจากป่าเมืองไทย ในวันนี้พวกเราพยายามวางแผนเพาะพันธุ์พญาแร้งที่เหลืออยู่ในกรงเลี้ยงจำนวน 6 ตัว',
      targetAmount: 299200,
      duration: 322,
      receiveAmount: 200000,
      donateCount: 28,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('เทใจ')),
      body: ListView.builder(
        itemCount: projects.length,
        //callback function
        itemBuilder: (BuildContext context, int index) {
          // return Text(projects[index].title); อันเดียวกันกับข้างล่าง
          var project = projects[index];

          var descritionStyle = const TextStyle(
            fontSize: 12.0,
            color: Colors.black54,
          );
          var amountStyle = const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          );

          var formatter = NumberFormat('#,###,000');
          var target = formatter.format(project.targetAmount);
          var percentText = ((project.receiveAmount / project.targetAmount) *100).toStringAsFixed(0);
          var percent = int.tryParse(percentText);//แปลงเป็น int

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //อยู่ติดข้างหน้า ไม่อยู่ตรงกลาง
                children: [
                  Text(project.title),
                  const SizedBox(height: 8.0),
                  //ล็อกขนาดพื้นที่ว่างๆที่เราต้องการจะกำหนดขนาด
                  Text(project.description, style: descritionStyle),
                  const SizedBox(height: 8.0),
                  Row(//จำนวนเงินที่ขอรับบริจาค
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //ชิดซ้าย
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('เป้าหมาย', style: descritionStyle),
                          Text('$target บาท', style: amountStyle),
                        ],
                      ),
                      Text('$percentText%', style: descritionStyle),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: percent!,
                        child: Container(
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),// ระยะห่างด้านนอก
                          color: Colors.orange,
                        ),
                      ),
                      Expanded(
                        flex: 100-percent,
                        child: Container(
                          height: 10.0,
                          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),// ระยะห่างด้านนอก
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                  Row(//จำนวนวัน จำนวนครั้งที่บริจาค
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //ชิดซ้าย
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('${project.duration} วัน', style: descritionStyle),
                      Row(
                        children: [
                          const Icon(Icons.person,size: 14.0),
                          Text('${project.donateCount}', style: descritionStyle),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
