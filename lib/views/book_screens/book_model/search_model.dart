class BookModel {
  String? kind;
  int? totalItems;
  List<Items>? items;

  BookModel({this.kind, this.totalItems, this.items});

  BookModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    items = (json['items'] as List?)
        ?.map((item) => Items.fromJson(item))
        .toList();
  }

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'totalItems': totalItems,
    'items': items?.map((item) => item.toJson()).toList(),
  };
}

class Items {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Items({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  Items.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo =
    json['volumeInfo'] != null ? VolumeInfo.fromJson(json['volumeInfo']) : null;
    saleInfo = json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    accessInfo =
    json['accessInfo'] != null ? AccessInfo.fromJson(json['accessInfo']) : null;
    searchInfo =
    json['searchInfo'] != null ? SearchInfo.fromJson(json['searchInfo']) : null;
  }

  Map<String, dynamic> toJson() => {
    'kind': kind,
    'id': id,
    'etag': etag,
    'selfLink': selfLink,
    'volumeInfo': volumeInfo?.toJson(),
    'saleInfo': saleInfo?.toJson(),
    'accessInfo': accessInfo?.toJson(),
    'searchInfo': searchInfo?.toJson(),
  };
}

class VolumeInfo {
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  int? pageCount;
  String? printType;
  List<String>? categories;
  double? averageRating;
  int? ratingsCount;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  String? subtitle;

  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.industryIdentifiers,
    this.readingModes,
    this.pageCount,
    this.printType,
    this.categories,
    this.averageRating,
    this.ratingsCount,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.panelizationSummary,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
    this.subtitle,
  });

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    authors = (json['authors'] as List?)?.cast<String>();
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    industryIdentifiers = (json['industryIdentifiers'] as List?)
        ?.map((item) => IndustryIdentifiers.fromJson(item))
        .toList();
    readingModes =
    json['readingModes'] != null ? ReadingModes.fromJson(json['readingModes']) : null;
    pageCount = json['pageCount'];
    printType = json['printType'];
    categories = (json['categories'] as List?)?.cast<String>();
    averageRating = (json['averageRating'] as num?)?.toDouble();
    ratingsCount = json['ratingsCount'];
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    panelizationSummary = json['panelizationSummary'] != null
        ? PanelizationSummary.fromJson(json['panelizationSummary'])
        : null;
    imageLinks = json['imageLinks'] != null ? ImageLinks.fromJson(json['imageLinks']) : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'authors': authors,
    'publisher': publisher,
    'publishedDate': publishedDate,
    'description': description,
    'industryIdentifiers': industryIdentifiers?.map((e) => e.toJson()).toList(),
    'readingModes': readingModes?.toJson(),
    'pageCount': pageCount,
    'printType': printType,
    'categories': categories,
    'averageRating': averageRating,
    'ratingsCount': ratingsCount,
    'maturityRating': maturityRating,
    'allowAnonLogging': allowAnonLogging,
    'contentVersion': contentVersion,
    'panelizationSummary': panelizationSummary?.toJson(),
    'imageLinks': imageLinks?.toJson(),
    'language': language,
    'previewLink': previewLink,
    'infoLink': infoLink,
    'canonicalVolumeLink': canonicalVolumeLink,
    'subtitle': subtitle,
  };
}

class IndustryIdentifiers {
  String? type;
  String? identifier;

  IndustryIdentifiers({this.type, this.identifier});

  IndustryIdentifiers.fromJson(Map<String, dynamic> json)
      : type = json['type'],
        identifier = json['identifier'];

  Map<String, dynamic> toJson() => {'type': type, 'identifier': identifier};
}

class ReadingModes {
  bool? text;
  bool? image;

  ReadingModes({this.text, this.image});

  ReadingModes.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        image = json['image'];

  Map<String, dynamic> toJson() => {'text': text, 'image': image};
}

class PanelizationSummary {
  bool? containsEpubBubbles;
  bool? containsImageBubbles;

  PanelizationSummary({this.containsEpubBubbles, this.containsImageBubbles});

  PanelizationSummary.fromJson(Map<String, dynamic> json)
      : containsEpubBubbles = json['containsEpubBubbles'],
        containsImageBubbles = json['containsImageBubbles'];

  Map<String, dynamic> toJson() =>
      {'containsEpubBubbles': containsEpubBubbles, 'containsImageBubbles': containsImageBubbles};
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;

  ImageLinks({this.smallThumbnail, this.thumbnail});

  ImageLinks.fromJson(Map<String, dynamic> json)
      : smallThumbnail = json['smallThumbnail'],
        thumbnail = json['thumbnail'];

  Map<String, dynamic> toJson() => {'smallThumbnail': smallThumbnail, 'thumbnail': thumbnail};
}

class SaleInfo {
  String? country;
  String? saleability;
  bool? isEbook;

  SaleInfo({this.country, this.saleability, this.isEbook});

  SaleInfo.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        saleability = json['saleability'],
        isEbook = json['isEbook'];

  Map<String, dynamic> toJson() => {'country': country, 'saleability': saleability, 'isEbook': isEbook};
}

class AccessInfo {
  String? country;
  String? viewability;
  bool? embeddable;
  bool? publicDomain;

  AccessInfo({this.country, this.viewability, this.embeddable, this.publicDomain});

  AccessInfo.fromJson(Map<String, dynamic> json)
      : country = json['country'],
        viewability = json['viewability'],
        embeddable = json['embeddable'],
        publicDomain = json['publicDomain'];

  Map<String, dynamic> toJson() => {'country': country, 'viewability': viewability, 'embeddable': embeddable, 'publicDomain': publicDomain};
}

class SearchInfo {
  String? textSnippet;

  SearchInfo({this.textSnippet});

  SearchInfo.fromJson(Map<String, dynamic> json) : textSnippet = json['textSnippet'];

  Map<String, dynamic> toJson() => {'textSnippet': textSnippet};
}
