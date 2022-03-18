var dummyProfile = DummyProfile(
  name: "Lê Xuân Hoàng",
  phone: "0898212096",
  email: "le9162608@gmail.com",
  location: "Hà Nội",
);

class DummyProfile {
  final String name;
  final String phone;
  final String email;
  final String location;

  DummyProfile({
    required this.name,
    required this.phone,
    required this.email,
    required this.location,
  });
}
