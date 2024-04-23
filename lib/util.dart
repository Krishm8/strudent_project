class StudentDetail{
  String? name;
  String? grid;
  String? std;
  String? xFile;

  StudentDetail({
    required this.name,
    required this.grid,
    required this.std,
    required this.xFile,
  });
}


StudentDetail studentData = StudentDetail(name: '',grid: '',std: '',xFile: '');

List<StudentDetail> studentList = [];

List profiledata=[];