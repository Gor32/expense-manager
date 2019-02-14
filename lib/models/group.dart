class Group {
  static const db_id = "id";
  static const db_name = "name";
  static const db_description = "description";

  String name, description;
  int id;

  Group({
    this.id,
    this.name,
    this.description = "",
  });

  Group.fromMap(Map<String, dynamic> map)
      : this(
          id: map[db_id],
          name: map[db_name],
          description: map[db_description],
        );

  Map<String, dynamic> toMap() {
    return {
      db_id: id,
      db_name: name,
      db_description: description,
    };
  }
}
