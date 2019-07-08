class Pokeability {
  List<Null> effectChanges;
  List<EffectEntries> effectEntries;
  List<FlavorTextEntries> flavorTextEntries;
  Generation generation;
  int id;
  bool isMainSeries;
  String name;
  List<Names> names;
  List<Pokemon> pokemon;

  Pokeability(
      {this.effectChanges,
      this.effectEntries,
      this.flavorTextEntries,
      this.generation,
      this.id,
      this.isMainSeries,
      this.name,
      this.names,
      this.pokemon});

  Pokeability.fromJson(Map<String, dynamic> json) {
    if (json['effect_changes'] != null) {
      effectChanges = new List<Null>();
      json['effect_changes'].forEach((v) {
        
      });
    }
    if (json['effect_entries'] != null) {
      effectEntries = new List<EffectEntries>();
      json['effect_entries'].forEach((v) {
        effectEntries.add(new EffectEntries.fromJson(v));
      });
    }
    if (json['flavor_text_entries'] != null) {
      flavorTextEntries = new List<FlavorTextEntries>();
      json['flavor_text_entries'].forEach((v) {
        flavorTextEntries.add(new FlavorTextEntries.fromJson(v));
      });
    }
    generation = json['generation'] != null
        ? new Generation.fromJson(json['generation'])
        : null;
    id = json['id'];
    isMainSeries = json['is_main_series'];
    name = json['name'];
    if (json['names'] != null) {
      names = new List<Names>();
      json['names'].forEach((v) {
        names.add(new Names.fromJson(v));
      });
    }
    if (json['pokemon'] != null) {
      pokemon = new List<Pokemon>();
      json['pokemon'].forEach((v) {
        pokemon.add(new Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
   
    if (this.effectEntries != null) {
      data['effect_entries'] =
          this.effectEntries.map((v) => v.toJson()).toList();
    }
    if (this.flavorTextEntries != null) {
      data['flavor_text_entries'] =
          this.flavorTextEntries.map((v) => v.toJson()).toList();
    }
    if (this.generation != null) {
      data['generation'] = this.generation.toJson();
    }
    data['id'] = this.id;
    data['is_main_series'] = this.isMainSeries;
    data['name'] = this.name;
    if (this.names != null) {
      data['names'] = this.names.map((v) => v.toJson()).toList();
    }
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EffectEntries {
  String effect;
  Language language;
  String shortEffect;

  EffectEntries({this.effect, this.language, this.shortEffect});

  EffectEntries.fromJson(Map<String, dynamic> json) {
    effect = json['effect'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    shortEffect = json['short_effect'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['effect'] = this.effect;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['short_effect'] = this.shortEffect;
    return data;
  }
}

class Language {
  String name;
  String url;

  Language({this.name, this.url});

  Language.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class FlavorTextEntries {
  String flavorText;
  Language language;
  VersionGroup versionGroup;

  FlavorTextEntries({this.flavorText, this.language, this.versionGroup});

  FlavorTextEntries.fromJson(Map<String, dynamic> json) {
    flavorText = json['flavor_text'];
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    versionGroup = json['version_group'] != null
        ? new VersionGroup.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flavor_text'] = this.flavorText;
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    if (this.versionGroup != null) {
      data['version_group'] = this.versionGroup.toJson();
    }
    return data;
  }
}

class VersionGroup {
  String name;
  String url;

  VersionGroup({this.name, this.url});

  VersionGroup.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Generation {
  String name;
  String url;

  Generation({this.name, this.url});

  Generation.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Names {
  Language language;
  String name;

  Names({this.language, this.name});

  Names.fromJson(Map<String, dynamic> json) {
    language = json['language'] != null
        ? new Language.fromJson(json['language'])
        : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.language != null) {
      data['language'] = this.language.toJson();
    }
    data['name'] = this.name;
    return data;
  }
}

class Pokemon {
  bool isHidden;
  Pokemon pokemon;
  int slot;

  Pokemon({this.isHidden, this.pokemon, this.slot});

  Pokemon.fromJson(Map<String, dynamic> json) {
    isHidden = json['is_hidden'];
    pokemon =
        json['pokemon'] != null ? new Pokemon.fromJson(json['pokemon']) : null;
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_hidden'] = this.isHidden;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon.toJson();
    }
    data['slot'] = this.slot;
    return data;
  }
}


