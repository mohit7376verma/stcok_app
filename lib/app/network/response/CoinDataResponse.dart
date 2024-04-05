class CoinDataResponse {
  CoinDataResponse({
      this.tickers,});

  CoinDataResponse.fromJson(dynamic json) {
    if (json['tickers'] != null) {
      tickers = [];
      json['tickers'].forEach((v) {
        tickers?.add(Tickers.fromJson(v));
      });
    }
  }
  List<Tickers>? tickers;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (tickers != null) {
      map['tickers'] = tickers?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Tickers {
  Tickers({
      this.market, 
      this.bestBid, 
      this.bestAsk, 
      this.lastExecution, 
      this.lastDay, 
      this.today, 
      this.snapshotAt,});

  Tickers.fromJson(dynamic json) {
    market = json['market'];
    bestBid = json['best_bid'] != null ? BestBid.fromJson(json['best_bid']) : null;
    bestAsk = json['best_ask'] != null ? BestAsk.fromJson(json['best_ask']) : null;
    lastExecution = json['last_execution'] != null ? LastExecution.fromJson(json['last_execution']) : null;
    lastDay = json['last_day'] != null ? LastDay.fromJson(json['last_day']) : null;
    today = json['today'] != null ? Today.fromJson(json['today']) : null;
    snapshotAt = json['snapshot_at'];
  }
  String? market;
  BestBid? bestBid;
  BestAsk? bestAsk;
  LastExecution? lastExecution;
  LastDay? lastDay;
  Today? today;
  String? snapshotAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['market'] = market;
    if (bestBid != null) {
      map['best_bid'] = bestBid?.toJson();
    }
    if (bestAsk != null) {
      map['best_ask'] = bestAsk?.toJson();
    }
    if (lastExecution != null) {
      map['last_execution'] = lastExecution?.toJson();
    }
    if (lastDay != null) {
      map['last_day'] = lastDay?.toJson();
    }
    if (today != null) {
      map['today'] = today?.toJson();
    }
    map['snapshot_at'] = snapshotAt;
    return map;
  }

}

class Today {
  Today({
      this.high, 
      this.low, 
      this.open, 
      this.volume, 
      this.volumeWeightedAveragePrice, 
      this.range,});

  Today.fromJson(dynamic json) {
    high = json['high'];
    low = json['low'];
    open = json['open'];
    volume = json['volume'];
    volumeWeightedAveragePrice = json['volume_weighted_average_price'];
    range = json['range'] != null ? Range.fromJson(json['range']) : null;
  }
  String? high;
  String? low;
  String? open;
  String? volume;
  String? volumeWeightedAveragePrice;
  Range? range;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['high'] = high;
    map['low'] = low;
    map['open'] = open;
    map['volume'] = volume;
    map['volume_weighted_average_price'] = volumeWeightedAveragePrice;
    if (range != null) {
      map['range'] = range?.toJson();
    }
    return map;
  }

}

class Range {
  Range({
      this.begin, 
      this.end,});

  Range.fromJson(dynamic json) {
    begin = json['begin'];
    end = json['end'];
  }
  String? begin;
  String? end;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['begin'] = begin;
    map['end'] = end;
    return map;
  }

}

class LastDay {
  LastDay({
      this.high, 
      this.low, 
      this.open, 
      this.volume, 
      this.volumeWeightedAveragePrice, 
      this.range,});

  LastDay.fromJson(dynamic json) {
    high = json['high'];
    low = json['low'];
    open = json['open'];
    volume = json['volume'];
    volumeWeightedAveragePrice = json['volume_weighted_average_price'];
    range = json['range'] != null ? Range.fromJson(json['range']) : null;
  }
  String? high;
  String? low;
  String? open;
  String? volume;
  String? volumeWeightedAveragePrice;
  Range? range;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['high'] = high;
    map['low'] = low;
    map['open'] = open;
    map['volume'] = volume;
    map['volume_weighted_average_price'] = volumeWeightedAveragePrice;
    if (range != null) {
      map['range'] = range?.toJson();
    }
    return map;
  }

}

class LastExecution {
  LastExecution({
      this.price, 
      this.amount,});

  LastExecution.fromJson(dynamic json) {
    price = json['price'];
    amount = json['amount'];
  }
  String? price;
  String? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['amount'] = amount;
    return map;
  }

}

class BestAsk {
  BestAsk({
      this.price, 
      this.amount,});

  BestAsk.fromJson(dynamic json) {
    price = json['price'];
    amount = json['amount'];
  }
  String? price;
  String? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['amount'] = amount;
    return map;
  }

}

class BestBid {
  BestBid({
      this.price, 
      this.amount,});

  BestBid.fromJson(dynamic json) {
    price = json['price'];
    amount = json['amount'];
  }
  String? price;
  String? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['amount'] = amount;
    return map;
  }

}