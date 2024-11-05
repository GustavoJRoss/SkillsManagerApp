// lib/models/skill_model.dart
class Skill {
  final String id;
  final String title;
  final String description;

  Skill({required this.id, required this.title, required this.description});

  // Converter Skill para Map para salvar no Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  // Criar Skill a partir de um documento Firestore
  factory Skill.fromMap(Map<String, dynamic> map, String documentId) {
    return Skill(
      id: documentId,
      title: map['title'],
      description: map['description'],
    );
  }
}
