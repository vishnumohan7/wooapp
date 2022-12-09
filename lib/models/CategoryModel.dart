class CategoryModel {
  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  String? display;
  String? image;
  int? menuOrder;
  int? count;
  Links? lLinks;

  CategoryModel(
      {this.id,
        this.name,
        this.slug,
        this.parent,
        this.description,
        this.display,
        this.image,
        this.menuOrder,
        this.count,
        this.lLinks});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??1;
    name = json['name']??"name";
    slug = json['slug']??"slug";
    parent = json['parent']??1;
    description = json['description']??"desc";
    display = json['display']??"display";
    image = json['image'];
    menuOrder = json['menu_order']??1;
    count = json['count']??1;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['parent'] = this.parent;
    data['description'] = this.description;
    data['display'] = this.display;
    data['image'] = this.image;
    data['menu_order'] = this.menuOrder;
    data['count'] = this.count;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks!.toJson();
    }
    return data;
  }
}

class Links {
  List<Self>? self;
  List<Collection>? collection;
  List<Up>? up;

  Links({this.self, this.collection, this.up});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = <Self>[];
      json['self'].forEach((v) {
        self!.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = <Collection>[];
      json['collection'].forEach((v) {
        collection!.add(new Collection.fromJson(v));
      });
    }
    if (json['up'] != null) {
      up = <Up>[];
      json['up'].forEach((v) {
        up!.add(new Up.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self!.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection!.map((v) => v.toJson()).toList();
    }
    if (this.up != null) {
      data['up'] = this.up!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String? href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Collection {
  String? href;

  Collection({this.href});

  Collection.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Up {
  String? href;

  Up({this.href});

  Up.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class Image {
  int? id;
  String? dateCreated;
  String? dateCreatedGmt;
  String? dateModified;
  String? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  Image(
      {this.id,
        this.dateCreated,
        this.dateCreatedGmt,
        this.dateModified,
        this.dateModifiedGmt,
        this.src,
        this.name,
        this.alt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'] ??1;
    dateCreated = json['date_created']??"";
    dateCreatedGmt = json['date_created_gmt']??"";
    dateModified = json['date_modified']??"";
    dateModifiedGmt = json['date_modified_gmt']??"";
    src = json['src']??"";
    name = json['name']??"";
    alt = json['alt']??"";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['date_created'] = this.dateCreated;
    data['date_created_gmt'] = this.dateCreatedGmt;
    data['date_modified'] = this.dateModified;
    data['date_modified_gmt'] = this.dateModifiedGmt;
    data['src'] = this.src;
    data['name'] = this.name;
    data['alt'] = this.alt;
    return data;
  }
}