import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class Product {
  @Id()
  int id = 0;

  @Property()
  String name;

  @Property()
  String description;

  @Property()
  List<String> usages;

  @Transient()
  bool isSelected = false; // Add this line

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.usages,
  });
}
