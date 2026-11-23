/// WhatsApp guidance contact (not an emergency service).
/// Number supplied by the clinical lead; stored in international form for wa.me.
const guidanceWhatsAppDisplay = '0314 0790080';
const guidanceWhatsAppInternational = '923140790080';

Uri guidanceWhatsAppUri() => Uri.https('wa.me', '/$guidanceWhatsAppInternational');
