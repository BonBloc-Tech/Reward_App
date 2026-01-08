class CustomerModel {
  final String name;
  final String customerNo;
  final String lastService;
  final String vehicleNo;
  final String model;

  CustomerModel({
    required this.name,
    required this.customerNo,
    required this.lastService,
    required this.vehicleNo,
    required this.model,
  });

  static CustomerModel sample() {
    return CustomerModel(
      name: "Bharat Kalra & Co",
      customerNo: "CUS00013",
      lastService: "07 July 2025",
      vehicleNo: "TN09AB1234",
      model: "Mercedes-Benz C-Class",
    );
  }
}


  