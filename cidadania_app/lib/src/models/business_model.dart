class BusinessModel {
  int id;
  String name;
  String businessName;
  String? address;
  String? mapsLink;
  String? description;
  String? district;
  String category;
  bool delivery;
  bool workatBusiness;
  String? image;
  String? whatsapp;
  String? instagram;
  String? phone;
  List<String> images;
  List<String> filters;

  BusinessModel({
    required this.id,
    required this.name,
    required this.address,
    required this.mapsLink,
    required this.businessName,
    required this.category,
    required this.delivery,
    required this.workatBusiness,
    required this.images,
    required this.filters,
    this.description,
    this.district,
    this.image,
    this.whatsapp,
    this.instagram,
    this.phone,
  });

  factory BusinessModel.fromJson({required Map<String,dynamic> data}){
    List<String> images = [];
    if(data["image1"] != null) images.add(data["image1"]);
    if(data["image2"] != null) images.add(data["image2"]);
    if(data["image3"] != null) images.add(data["image3"]);
    if(data["image4"] != null) images.add(data["image4"]);
    if(data["image5"] != null) images.add(data["image5"]);
    return BusinessModel(
      id: data["id"],
      name: data["name"],  
      businessName: data["business_name"],
      workatBusiness: data["workatbu"],
      address: data["address"],
      district: data["district"], 
      mapsLink: data["maps_link"],
      category: data["category"], 
      delivery: data["delivery"], 
      description: data["description"],
      image: data["image"],
      whatsapp: data["whatsapp"],
      instagram: data["instagram"],
      phone: data["phone"],
      images: images,
      filters: (data["filters"] as String).split(","),
    );
  }

  toJson() {
    return {
      "name": name,
      "description": description,
      "business_name": businessName,
      "district": district,
      "maps_link": mapsLink,
      "workatbu": workatBusiness,
      "address": address,
      "category": category,
      "delivery": delivery,
      "image": image,
      "whatsapp": whatsapp,
      "instagram": instagram,
      "phone": phone,
      "image1": images.length > 0 ? images[0] : null,
      "image2": images.length > 1 ? images[1] : null,
      "image3": images.length > 2 ? images[2] : null,
      "image4": images.length > 3 ? images[3] : null,
      "image5": images.length > 4 ? images[4] : null,
      "filters": filters.join(","),
    };
  }
}

/*  id              Int         @id @default(autoincrement())
  name            String 
  description     String?
  category        String
  delivery        Boolean
  image           String?
  whatsapp        String?
  instagram       String?
  phone           String?
  image1          String?
  image2          String?
  image3          String?
  image4          String?
  image5          String?
  filters         String? */