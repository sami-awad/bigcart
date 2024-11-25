class CategoriesModel{
  String?image;
  String?color;
  String?title;

  CategoriesModel({
    required this.image,
    required this.color,
    required this.title,
});
  CategoriesModel.fromjson(Map<String,dynamic> json){
    image = json['image'];
    color= json['color'];
    title= json['title'];
  }
}