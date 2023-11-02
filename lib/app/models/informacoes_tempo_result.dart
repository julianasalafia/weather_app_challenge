class InformacoesTempoResult {
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
  final List<Dias> dias;

  const Estado._({
    required this.estado,
    required this.dias,
  });

  factory Estado.fromJson(dynamic json) {
    return Estado._(
      estado: json['estado'],
      dias: Dias.fromListJson(json['dias']),
    );
  }

  static List<Estado> fromListJson(dynamic list) {
    final List<Estado> result = [];

    for (var o in list) {
      result.add(Estado.fromJson(o));
    }
    return result;
  }
}

class Dias {
  final List<Dia> segunda;
  final List<Dia> terca;
  final List<Dia> quarta;
  final List<Dia> quinta;
  final List<Dia> sexta;
  final List<Dia> sabado;
  final List<Dia> domingo;

  const Dias._({
    required this.segunda,
    required this.terca,
    required this.quarta,
    required this.quinta,
    required this.sexta,
    required this.sabado,
    required this.domingo,
  });

  factory Dias.fromJson(dynamic json) {
    return Dias._(
      segunda: Dia.fromListJson(json['segunda']),
      terca: Dia.fromListJson(json['terca']),
      quarta: Dia.fromListJson(json['quarta']),
      quinta: Dia.fromListJson(json['quinta']),
      sexta: Dia.fromListJson(json['sexta']),
      sabado: Dia.fromListJson(json['sabado']),
      domingo: Dia.fromListJson(json['domingo']),
    );
  }

  static List<Dias> fromListJson(dynamic list) {
    final List<Dias> result = [];

    for (var o in list) {
      result.add(Dias.fromJson(o));
    }
    return result;
  }
}

class Dia {
  final List<Periodo> manha;
  final List<Periodo> tarde;
  final List<Periodo> noite;

  const Dia._({
    required this.manha,
    required this.tarde,
    required this.noite,
  });

  factory Dia.fromJson(dynamic json) {
    final result = Dia._(
      manha: Periodo.fromListJson(json['manha']),
      tarde: Periodo.fromListJson(json['tarde']),
      noite: Periodo.fromListJson(json['noite']),
    );
    return result;
  }

  static List<Dia> fromListJson(dynamic list) {
    final List<Dia> result = [];

    for (var o in list) {
      result.add(Dia.fromJson(o));
    }
    return result;
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

  static List<Periodo> fromListJson(dynamic list) {
    final List<Periodo> result = [];

    for (var o in list) {
      result.add(Periodo.fromJson(o));
    }
    return result;
  }
}
