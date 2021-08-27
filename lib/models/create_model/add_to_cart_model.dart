import 'dart:convert';

class AddToCartModel {

   String notes;
   String bookingData;
   String serviceId;
   String type;
   Choices choices;
  AddToCartModel({
     this.notes,
     this.bookingData,
     this.serviceId,
     this.type,
     this.choices,
  });

  Map<String, dynamic> toMap() {
    return {
      'notes': notes,
      'booking_date': bookingData,
      'service_id': serviceId,
      'type': type,
      'choices': choices.toMap(),
    };
  }

  factory AddToCartModel.fromMap(Map<String, dynamic> map) {
    return AddToCartModel(
      notes: map['notes'],
      bookingData: map['booking_date'],
      serviceId: map['service_id'],
      type: map['type'],
      choices: Choices.fromMap(map['choices']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddToCartModel.fromJson(String source) => AddToCartModel.fromMap(json.decode(source));
 }
//////////////////
class Choices {

   String choiceId;
   int price;
   int quantity;
    HallChoiceDetails hallChoiceDetails;
  Choices({
     this.choiceId,
     this.price,
     this.quantity,
     this.hallChoiceDetails,
  });


  Map<String, dynamic> toMap() {
    return {
      'choice_id': choiceId,
      'price': price,
      'quantity': quantity,
      'hall_choice_details': hallChoiceDetails.toMap(),
    };
  }

  factory Choices.fromMap(Map<String, dynamic> map) {
    return Choices(
      choiceId: map['choice_id'],
      price: map['price'],
      quantity: map['quantity'],
      hallChoiceDetails: HallChoiceDetails.fromMap(map['hall_choice_details']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Choices.fromJson(String source) => Choices.fromMap(json.decode(source));
 }
 ///////////////////////////////////
class HallChoiceDetails {
 int partyTypeId;
 int cartChoiceId;
 bool forMen;
 bool forWomen;
 bool forMix;
  HallChoiceDetails({
     this.partyTypeId,
     this.cartChoiceId,
     this.forMen,
     this.forWomen,
     this.forMix,
  });
 

  Map<String, dynamic> toMap() {
    return {
      'party_type_id': partyTypeId,
      'cart_choice_id': cartChoiceId,
      'for_men': forMen,
      'for_women': forWomen,
      'for_mix': forMix,
    };
  }

  factory HallChoiceDetails.fromMap(Map<String, dynamic> map) {
    return HallChoiceDetails(
      partyTypeId: map['party_type_id'],
      cartChoiceId: map['cart_choice_id'],
      forMen: map['for_men'],
      forWomen: map['for_women'],
      forMix: map['for_mix'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HallChoiceDetails.fromJson(String source) => HallChoiceDetails.fromMap(json.decode(source));
}
