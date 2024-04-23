class StudentModel {
  String? name, grid, std;

  StudentModel({this.name, this.grid, this.std});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      name: json["name"],
      grid: json["grid"],
      std: json["std"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "grid": grid,
    "std": std,
  };
}