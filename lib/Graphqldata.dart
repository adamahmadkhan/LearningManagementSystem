import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;


class Graphql extends StatelessWidget {

  final HttpLink httpLink = HttpLink('https://countries.trevorblades.com/');
  @override
  Widget build(BuildContext context) {
    final ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        cache: GraphQLCache(),
      ),
    );

    String fetchCountriesQuery = '''
      query {
        countries {
          name
          
        }}
    ''';

    return Scaffold(
    body:GraphQLProvider(
      client: client,
      child: Query(
            options: QueryOptions(
              document: gql(fetchCountriesQuery),
            ),
            builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return const Text('Loading...');
              }
print(result.data?["countries"][1]["name"]);
              List countries = result.data?['countries'];

              return ListView.builder(
                itemCount: countries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(result.data?["countries"][index]['name']),
                  );
                },
              );
            },
          ),
        ),);
  }
}
