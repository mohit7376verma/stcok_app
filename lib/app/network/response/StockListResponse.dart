class StockListResponse {
  StockListResponse({
      this.results, 
      this.status, 
      this.requestId, 
      this.count, 
      this.nextUrl,});

  StockListResponse.fromJson(dynamic json) {
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
      this.ticker, 
      this.name, 
      this.market, 
      this.locale, 
      this.primaryExchange, 
      this.type, 
      this.active, 
      this.currencyName, 
      this.cik, 
      this.compositeFigi, 
      this.shareClassFigi, 
      this.lastUpdatedUtc,});

  Results.fromJson(dynamic json) {
    ticker = json['ticker'];
    name = json['name'];
    market = json['market'];
    locale = json['locale'];
    primaryExchange = json['primary_exchange'];
    type = json['type'];
    active = json['active'];
    currencyName = json['currency_name'];
    cik = json['cik'];
    compositeFigi = json['composite_figi'];
    shareClassFigi = json['share_class_figi'];
    lastUpdatedUtc = json['last_updated_utc'];
  }
  String? ticker;
  String? name;
  String? market;
  String? locale;
  String? primaryExchange;
  String? type;
  bool? active;
  String? currencyName;
  String? cik;
  String? compositeFigi;
  String? shareClassFigi;
  String? lastUpdatedUtc;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ticker'] = ticker;
    map['name'] = name;
    map['market'] = market;
    map['locale'] = locale;
    map['primary_exchange'] = primaryExchange;
    map['type'] = type;
    map['active'] = active;
    map['currency_name'] = currencyName;
    map['cik'] = cik;
    map['composite_figi'] = compositeFigi;
    map['share_class_figi'] = shareClassFigi;
    map['last_updated_utc'] = lastUpdatedUtc;
    return map;
  }

}