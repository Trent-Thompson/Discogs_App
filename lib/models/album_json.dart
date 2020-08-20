class AlbumJson {
  Pagination pagination;
  List<Releases> releases;

  AlbumJson({this.pagination, this.releases});

  AlbumJson.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['releases'] != null) {
      releases = new List<Releases>();
      json['releases'].forEach((v) {
        releases.add(new Releases.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.releases != null) {
      data['releases'] = this.releases.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int page;
  int pages;
  int perPage;
  int items;
  Urls urls;

  Pagination({this.page, this.pages, this.perPage, this.items, this.urls});

  Pagination.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    pages = json['pages'];
    perPage = json['per_page'];
    items = json['items'];
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['pages'] = this.pages;
    data['per_page'] = this.perPage;
    data['items'] = this.items;
    if (this.urls != null) {
      data['urls'] = this.urls.toJson();
    }
    return data;
  }
}

class Urls {
  String last;
  String next;

  Urls({this.last, this.next});

  Urls.fromJson(Map<String, dynamic> json) {
    last = json['last'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['last'] = this.last;
    data['next'] = this.next;
    return data;
  }
}

class Releases {
  int id;
  int instanceId;
  String dateAdded;
  int rating;
  BasicInformation basicInformation;

  Releases(
      {this.id,
      this.instanceId,
      this.dateAdded,
      this.rating,
      this.basicInformation});

  Releases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    instanceId = json['instance_id'];
    dateAdded = json['date_added'];
    rating = json['rating'];
    basicInformation = json['basic_information'] != null
        ? new BasicInformation.fromJson(json['basic_information'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['instance_id'] = this.instanceId;
    data['date_added'] = this.dateAdded;
    data['rating'] = this.rating;
    if (this.basicInformation != null) {
      data['basic_information'] = this.basicInformation.toJson();
    }
    return data;
  }
}

class BasicInformation {
  int id;
  int masterId;
  String masterUrl;
  String resourceUrl;
  String thumb;
  String coverImage;
  String title;
  int year;
  List<Formats> formats;
  List<Labels> labels;
  List<Artists> artists;
  List<String> genres;
  List<String> styles;

  BasicInformation(
      {this.id,
      this.masterId,
      this.masterUrl,
      this.resourceUrl,
      this.thumb,
      this.coverImage,
      this.title,
      this.year,
      this.formats,
      this.labels,
      this.artists,
      this.genres,
      this.styles});

  BasicInformation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masterId = json['master_id'];
    masterUrl = json['master_url'];
    resourceUrl = json['resource_url'];
    thumb = json['thumb'];
    coverImage = json['cover_image'];
    title = json['title'];
    year = json['year'];
    if (json['formats'] != null) {
      formats = new List<Formats>();
      json['formats'].forEach((v) {
        formats.add(new Formats.fromJson(v));
      });
    }
    if (json['labels'] != null) {
      labels = new List<Labels>();
      json['labels'].forEach((v) {
        labels.add(new Labels.fromJson(v));
      });
    }
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
    genres = json['genres'].cast<String>();
    styles = json['styles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['master_id'] = this.masterId;
    data['master_url'] = this.masterUrl;
    data['resource_url'] = this.resourceUrl;
    data['thumb'] = this.thumb;
    data['cover_image'] = this.coverImage;
    data['title'] = this.title;
    data['year'] = this.year;
    if (this.formats != null) {
      data['formats'] = this.formats.map((v) => v.toJson()).toList();
    }
    if (this.labels != null) {
      data['labels'] = this.labels.map((v) => v.toJson()).toList();
    }
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    data['genres'] = this.genres;
    data['styles'] = this.styles;
    return data;
  }
}

class Formats {
  String name;
  String qty;
  String text;
  List<String> descriptions;

  Formats({this.name, this.qty, this.text, this.descriptions});

  Formats.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    qty = json['qty'];
    text = json['text'];
    descriptions = json['descriptions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qty'] = this.qty;
    data['text'] = this.text;
    data['descriptions'] = this.descriptions;
    return data;
  }
}

class Labels {
  String name;
  String catno;
  String entityType;
  String entityTypeName;
  int id;
  String resourceUrl;

  Labels(
      {this.name,
      this.catno,
      this.entityType,
      this.entityTypeName,
      this.id,
      this.resourceUrl});

  Labels.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    catno = json['catno'];
    entityType = json['entity_type'];
    entityTypeName = json['entity_type_name'];
    id = json['id'];
    resourceUrl = json['resource_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['catno'] = this.catno;
    data['entity_type'] = this.entityType;
    data['entity_type_name'] = this.entityTypeName;
    data['id'] = this.id;
    data['resource_url'] = this.resourceUrl;
    return data;
  }
}

class Artists {
  String name;
  String anv;
  String join;
  String role;
  String tracks;
  int id;
  String resourceUrl;

  Artists(
      {this.name,
      this.anv,
      this.join,
      this.role,
      this.tracks,
      this.id,
      this.resourceUrl});

  Artists.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    anv = json['anv'];
    join = json['join'];
    role = json['role'];
    tracks = json['tracks'];
    id = json['id'];
    resourceUrl = json['resource_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['anv'] = this.anv;
    data['join'] = this.join;
    data['role'] = this.role;
    data['tracks'] = this.tracks;
    data['id'] = this.id;
    data['resource_url'] = this.resourceUrl;
    return data;
  }
}
