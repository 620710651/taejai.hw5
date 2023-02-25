import 'package:flutter/material.dart';
import 'package:taejai/models/project.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            project.title,
            overflow: TextOverflow.ellipsis,
          )),
      body: Container(
        child: Text(
          project.title,
          style: TextStyle(fontSize: 30.0),
          overflow: TextOverflow.ellipsis,
        ),

      ),
    );
  }

}