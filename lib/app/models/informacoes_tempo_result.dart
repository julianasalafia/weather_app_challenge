import 'package:weather_app_challenge/app/models/informacoes_tempo_helper.dart';

class InformacoesTempoResult with InformacoesTempoHelper {
  final List<Estado> estados;

  const InformacoesTempoResult._({required this.estados});

  factory InformacoesTempoResult.fromJson(dynamic json) {
    return InformacoesTempoResult._(
      estados: Estado.fromListJson(json['result']['estados']),
    );
  }
}

class Estado {
  final String estado;
  final Map<DiasSemanaEnum, Dia> dias;

  const Estado._({
    required this.estado,
    required this.dias,
  });

  factory Estado.fromJson(dynamic json) {
    final dias = json['dias'][0];
    Map<DiasSemanaEnum, Dia> mapDia = {};

    for (final dia in DiasSemanaEnum.values) {
      mapDia[dia] = Dia.fromJson(dias[dia.name][0]);
    }

    return Estado._(
      estado: json['estado'],
      dias: mapDia,
    );
  }

  Dia? getToday() {
    final today = DateTime.now().weekday;
    final dia = dias[DiasSemanaEnum.values[today - 1]];

    return dia;
  }

  String getTodayName() {
    final today = DateTime.now().weekday;
    final dia = DiasSemanaEnum.values[today - 1].nome;

    return dia;
  }

  static List<Estado> fromListJson(dynamic list) {
    final List<Estado> result = [];

    for (var o in list) {
      result.add(Estado.fromJson(o));
    }
    return result;
  }
}

enum DiasSemanaEnum {
  segunda(id: 0, nome: 'Segunda'),
  terca(id: 1, nome: 'Terça'),
  quarta(id: 2, nome: 'Quarta'),
  quinta(id: 3, nome: 'Quinta'),
  sexta(id: 4, nome: 'Sexta'),
  sabado(id: 5, nome: 'Sábado'),
  domingo(id: 6, nome: 'Domingo');

  final int id;
  final String nome;

  const DiasSemanaEnum({required this.id, required this.nome});
}

enum PeriodosEnum {
  manha(id: 0, nome: 'Manhã'),
  tarde(id: 1, nome: 'Tarde'),
  noite(id: 2, nome: 'Noite');

  final int id;
  final String nome;

  const PeriodosEnum({required this.id, required this.nome});
}

class Dia {
  final Map<PeriodosEnum, Periodo> periodos;

  const Dia._({
    required this.periodos,
  });

  factory Dia.fromJson(dynamic json) {
    final Map<PeriodosEnum, Periodo> periodos = {};
    for (final periodo in PeriodosEnum.values) {
      periodos[periodo] = Periodo.fromJson(json[periodo.name][0]);
    }

    final result = Dia._(
      periodos: periodos,
    );
    return result;
  }

  MapEntry<PeriodosEnum, Periodo> getPeriodoNow() {
    final hourNow = DateTime.now().hour;

    if (hourNow >= 6 && hourNow <= 12) {
      final periodo = periodos.entries.toList()[0];
      return periodo;
    } else if (hourNow >= 13 && hourNow <= 18) {
      final periodo = periodos.entries.toList()[1];
      return periodo;
    } else {
      final periodo = periodos.entries.toList()[2];
      return periodo;
    }
  }
}

class Periodo {
  final String tempo;
  final String graus;

  const Periodo._({
    required this.tempo,
    required this.graus,
  });

  factory Periodo.fromJson(dynamic json) {
    return Periodo._(
      tempo: json['tempo'],
      graus: json['graus']?.toString() ?? '0',
    );
  }
}
