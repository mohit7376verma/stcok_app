class CryptoResponse {
  CryptoResponse({
      this.type,
      this.market, 
      this.side, 
      this.price, 
      this.amount,});

  CryptoResponse.fromJson(Map<String,dynamic> json) {
    type = json['type'];
    market = json['market'];
    side = json['side'];
    price = json['price'];
    amount = json['amount'];
  }
  String? type;
  String? market;
  String? side;
  String? price;
  String? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['market'] = market;
    map['side'] = side;
    map['price'] = price;
    map['amount'] = amount;
    return map;
  }

}