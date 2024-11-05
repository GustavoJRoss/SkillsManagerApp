// lib/views/add_edit_skill_screen.dart
import 'package:flutter/material.dart';
import 'package:skill_manager_app/models/skill_model.dart';
import 'package:skill_manager_app/viewmodels/skills_view_model.dart';

class AddEditSkillScreen extends StatefulWidget {
  final Skill? skill;

  const AddEditSkillScreen({Key? key, this.skill}) : super(key: key);

  @override
  _AddEditSkillScreenState createState() => _AddEditSkillScreenState();
}

class _AddEditSkillScreenState extends State<AddEditSkillScreen> {
  final _formKey = GlobalKey<FormState>();
  final SkillsViewModel viewModel = SkillsViewModel();
  late String title;
  late String description;

  @override
  void initState() {
    super.initState();
    title = widget.skill?.title ?? '';
    description = widget.skill?.description ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.skill == null ? 'Add Skill' : 'Edit Skill',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.green, // Define a cor do ícone de voltar
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: TextFormField(
                      initialValue: title,
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Colors.white), // Borda quando não está focado
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white), // Borda quando está focado
                        ),
                      ),
                      style: TextStyle(
                        color:
                            Colors.white, // Cor do texto inserido pelo usuário
                      ),
                      onChanged: (value) => title = value,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter a Title'
                          : null,
                    ),
                  )),
              SizedBox(height: 20.0),
              Card(
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: TextFormField(
                      initialValue: description,
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color:
                                  Colors.white), // Borda quando não está focado
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.white), // Borda quando está focado
                        ),
                      ),
                      style: TextStyle(
                        color:
                            Colors.white, // Cor do texto inserido pelo usuário
                      ),
                      onChanged: (value) => description = value,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Please enter a description'
                          : null,
                    ),
                  )),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final skill = Skill(
                      id: widget.skill?.id ?? '',
                      title: title,
                      description: description,
                    );
                    if (widget.skill == null) {
                      viewModel.addSkill(skill);
                    } else {
                      viewModel.editSkill(skill.id, skill);
                    }
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0)),
                child: Text(
                  widget.skill == null ? 'Add' : 'Save',
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
