import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import 'contacts.dart';

Future<void> openGuidanceWhatsApp(BuildContext context) async {
  final failed = AppLocalizations.of(context).whatsappFailed;
  final messenger = ScaffoldMessenger.of(context);
  var ok = false;
  try {
    ok = await launchUrl(guidanceWhatsAppUri(), mode: LaunchMode.externalApplication);
  } catch (_) {
    ok = false;
  }
  if (!ok) messenger.showSnackBar(SnackBar(content: Text(failed)));
}
