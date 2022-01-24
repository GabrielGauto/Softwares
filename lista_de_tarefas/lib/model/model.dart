class ModelTarefa {
  final String title;
  final bool status;

  ModelTarefa({required this.title, required this.status});

  Map<String, dynamic> toMap() {
    return ({'title': title, 'status': status.toString()});
  }
}
