enum PeriodsEnum {
  manha(id: 0, label: 'Manhã'),
  tarde(id: 1, label: 'Tarde'),
  noite(id: 2, label: 'Noite');

  final int id;
  final String label;

  const PeriodsEnum({required this.id, required this.label});
}
