enum Role implements Comparable<Role> {
  user(level: 0),
  moderator(level: 1),
  admin(level: 2),
  superAdmin(level: 3);

  const Role({required this.level});

  final int level;

  @override
  int compareTo(Role role) => level - role.level;
}
