enum DaysWeekEnum {
  segunda(id: 0, label: 'Segunda'),
  terca(id: 1, label: 'Terça'),
  quarta(id: 2, label: 'Quarta'),
  quinta(id: 3, label: 'Quinta'),
  sexta(id: 4, label: 'Sexta'),
  sabado(id: 5, label: 'Sábado'),
  domingo(id: 6, label: 'Domingo');

  final int id;
  final String label;

  const DaysWeekEnum({required this.id, required this.label});
}
