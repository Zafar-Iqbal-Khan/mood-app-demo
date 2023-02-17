import 'package:http/http.dart' as http;

getCustomersData() async {
  final url = Uri.parse(
    "http://api.reward-dragon.com:8000/customers/customer-josh-reason-today/?user_profile=500'",
  );
  final headers = {
    'Authorization': 'c3fb04334a7c647338cdfd500e2997bb9898cf52',
  };

  final response = await http.get(url, headers: headers);

  return response;
}
