import 'package:objectbox/objectbox.dart';
import 'package:wellnesspresentation/objectbox.g.dart';

@Entity()
@Sync()
class User {
  @Id(assignable: true)
  int id;

  @Property()
  String name;

  @Property()
  String email;

  @Property()
  String passwordHash;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.passwordHash,
  });
}
