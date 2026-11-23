/// Placeholder directory. Every entry must be verified by the clinical lead
/// before a release build (docs/DESIGN.md §3.1).
class Helpline {
  const Helpline({required this.country, required this.name, required this.number});

  final String country;
  final String name;
  final String number;
}

const helplines = <Helpline>[
  Helpline(country: 'Pakistan', name: 'Umang', number: '03117786264'),
];
