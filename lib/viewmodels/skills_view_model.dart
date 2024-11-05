// lib/viewmodels/skills_view_model.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_manager_app/models/skill_model.dart';

class SkillsViewModel {
  final CollectionReference skillsCollection =
      FirebaseFirestore.instance.collection('skills');

  // Obter habilidades do Firestore
  Stream<List<Skill>> getSkills() {
    return skillsCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Skill.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Adicionar nova habilidade
  Future<void> addSkill(Skill skill) {
    return skillsCollection.add(skill.toMap());
  }

  // Editar habilidade existente
  Future<void> editSkill(String id, Skill skill) {
    return skillsCollection.doc(id).update(skill.toMap());
  }

  // Deletar habilidade
  Future<void> deleteSkill(String id) {
    return skillsCollection.doc(id).delete();
  }
}
