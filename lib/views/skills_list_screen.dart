// lib/views/skills_list_screen.dart
import 'package:flutter/material.dart';
import 'package:skill_manager_app/models/skill_model.dart';
import 'package:skill_manager_app/viewmodels/skills_view_model.dart';
import 'package:skill_manager_app/views/add_edit_skill_screen.dart';

class SkillsListScreen extends StatelessWidget {
  final SkillsViewModel viewModel = SkillsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Skills App Manager',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(32.0), // Define o espaçamento desejado
        child: Column(
          children: [
            SizedBox(height: 60.0),
            Text(
              "Minhas \n Habilidades",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 28.0,
                  fontFamily: "Roboto",
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 80.0),
            Expanded(
              child: StreamBuilder<List<Skill>>(
                stream: viewModel.getSkills(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  final skills = snapshot.data ?? [];

                  return ListView.builder(
                    itemCount: skills.length,
                    itemBuilder: (context, index) {
                      final skill = skills[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green, // Cor de fundo verde
                            borderRadius: BorderRadius.circular(
                                8.0), // Bordas arredondadas
                          ),
                          child: ListTile(
                            title: Text(
                              skill.title,
                              style: TextStyle(
                                  color: Colors.white), // Cor do texto branca
                            ),
                            subtitle: Text(
                              skill.description,
                              style: TextStyle(
                                  color: Colors
                                      .white70), // Cor do subtítulo branca com opacidade
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.white),
                                  onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AddEditSkillScreen(skill: skill),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.white),
                                  onPressed: () =>
                                      viewModel.deleteSkill(skill.id),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddEditSkillScreen()),
        ),
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
