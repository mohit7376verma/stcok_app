class NewsResponse {
  NewsResponse({
      this.results, 
      this.status, 
      this.requestId, 
      this.count, 
      this.nextUrl,});

  NewsResponse.fromJson(dynamic json) {
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Results.fromJson(v));
      });
    }
    status = json['status'];
    requestId = json['request_id'];
    count = json['count'];
    nextUrl = json['next_url'];
  }
  List<Results>? results;
  String? status;
  String? requestId;
  num? count;
  String? nextUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['request_id'] = requestId;
    map['count'] = count;
    map['next_url'] = nextUrl;
    return map;
  }

}

class Results {
  Results({
      this.id, 
      this.publisher, 
      this.title, 
      this.author, 
      this.publishedUtc, 
      this.articleUrl, 
      this.tickers, 
      this.ampUrl, 
      this.imageUrl, 
      this.description, 
      this.keywords,});

  Results.fromJson(dynamic json) {
    id = json['id'];
    publisher = json['publisher'] != null ? Publisher.fromJson(json['publisher']) : null;
    title = json['title'];
    author = json['author'];
    publishedUtc = json['published_utc'];
    articleUrl = json['article_url'];
    tickers = json['tickers'] != null ? json['tickers'].cast<String>() : [];
    ampUrl = json['amp_url'];
    imageUrl = json['image_url'];
    description = json['description'];
    keywords = json['keywords'] != null ? json['keywords'].cast<String>() : [];
  }
  String? id;
  Publisher? publisher;
  String? title;
  String? author;
  String? publishedUtc;
  String? articleUrl;
  List<String>? tickers;
  String? ampUrl;
  String? imageUrl;
  String? description;
  List<String>? keywords;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (publisher != null) {
      map['publisher'] = publisher?.toJson();
    }
    map['title'] = title;
    map['author'] = author;
    map['published_utc'] = publishedUtc;
    map['article_url'] = articleUrl;
    map['tickers'] = tickers;
    map['amp_url'] = ampUrl;
    map['image_url'] = imageUrl;
    map['description'] = description;
    map['keywords'] = keywords;
    return map;
  }

}

class Publisher {
  Publisher({
      this.name, 
      this.homepageUrl, 
      this.logoUrl, 
      this.faviconUrl,});

  Publisher.fromJson(dynamic json) {
    name = json['name'];
    homepageUrl = json['homepage_url'];
    logoUrl = json['logo_url'];
    faviconUrl = json['favicon_url'];
  }
  String? name;
  String? homepageUrl;
  String? logoUrl;
  String? faviconUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['homepage_url'] = homepageUrl;
    map['logo_url'] = logoUrl;
    map['favicon_url'] = faviconUrl;
    return map;
  }

}