enum Lang { en, hi, pa }

enum PetKind { dog, cat }

const pawPhoneDisplay = '+91 75270 24273';
const pawPhoneTel = '+917527024273';
const pawWhatsApp = '917527024273';

class Faq {
  const Faq(this.q, this.a);
  final String q;
  final String a;
}

class StepCopy {
  const StepCopy(this.title, this.body);
  final String title;
  final String body;
}

class DayLine {
  const DayLine(this.when, this.detail);
  final String when;
  final String detail;
}

class Copy {
  const Copy({
    required this.code,
    required this.kicker,
    required this.heroTitle,
    required this.heroBody,
    required this.ctaDetails,
    required this.ctaCall,
    required this.trust,
    required this.dayTitle,
    required this.dayLines,
    required this.howKicker,
    required this.howTitle,
    required this.steps,
    required this.whoKicker,
    required this.whoTitle,
    required this.dogTitle,
    required this.dogBody,
    required this.catTitle,
    required this.catBody,
    required this.careKicker,
    required this.careTitle,
    required this.careItems,
    required this.packTitle,
    required this.packItems,
    required this.limitTitle,
    required this.limitBody,
    required this.formKicker,
    required this.formTitle,
    required this.formBody,
    required this.previewLabel,
    required this.send,
    required this.copyMessage,
    required this.copied,
    required this.missing,
    required this.openFailed,
    required this.fName,
    required this.fPhone,
    required this.fPhoneHint,
    required this.fPet,
    required this.petDog,
    required this.petCat,
    required this.fPetName,
    required this.fPetNameHint,
    required this.fFrom,
    required this.fTo,
    required this.fFromHint,
    required this.fToHint,
    required this.fNotes,
    required this.fNotesHint,
    required this.msgHello,
    required this.msgAsk,
    required this.faqKicker,
    required this.faqTitle,
    required this.faqs,
    required this.footerLine,
    required this.footerNote,
    required this.navCall,
    required this.navWhatsApp,
  });

  final String code;
  final String kicker;
  final String heroTitle;
  final String heroBody;
  final String ctaDetails;
  final String ctaCall;
  final List<String> trust;
  final String dayTitle;
  final List<DayLine> dayLines;
  final String howKicker;
  final String howTitle;
  final List<StepCopy> steps;
  final String whoKicker;
  final String whoTitle;
  final String dogTitle;
  final String dogBody;
  final String catTitle;
  final String catBody;
  final String careKicker;
  final String careTitle;
  final List<String> careItems;
  final String packTitle;
  final List<String> packItems;
  final String limitTitle;
  final String limitBody;
  final String formKicker;
  final String formTitle;
  final String formBody;
  final String previewLabel;
  final String send;
  final String copyMessage;
  final String copied;
  final String missing;
  final String openFailed;
  final String fName;
  final String fPhone;
  final String fPhoneHint;
  final String fPet;
  final String petDog;
  final String petCat;
  final String fPetName;
  final String fPetNameHint;
  final String fFrom;
  final String fTo;
  final String fFromHint;
  final String fToHint;
  final String fNotes;
  final String fNotesHint;
  final String msgHello;
  final String msgAsk;
  final String faqKicker;
  final String faqTitle;
  final List<Faq> faqs;
  final String footerLine;
  final String footerNote;
  final String navCall;
  final String navWhatsApp;

  String petLabel(PetKind kind) => kind == PetKind.dog ? petDog : petCat;
}

const copies = <Lang, Copy>{
  Lang.en: Copy(
    code: 'EN',
    kicker: 'Dogs & cats · a real home',
    heroTitle: 'Family function for 2–3 days? Leave your dog or cat with us.',
    heroBody:
        'A wedding, a function, or a short trip with the whole family — your pet should not be the worry you carry all evening. They stay in a home, eat on your timing, and you get a short WhatsApp note you can forward to everyone.',
    ctaDetails: 'Write the details',
    ctaCall: 'Call',
    trust: ['Short stays', 'Your food times', 'Easy to forward'],
    dayTitle: 'While you are at the function',
    dayLines: [
      DayLine('Morning', 'Breakfast, fresh water, and a walk for dogs.'),
      DayLine('Afternoon', 'Rest. Cats keep a quiet corner of their own.'),
      DayLine('Evening', 'Dinner, then a photo or a few lines on WhatsApp.'),
    ],
    howKicker: 'Simple',
    howTitle: 'Three steps. No long form.',
    steps: [
      StepCopy(
        'Message the dates',
        'Name, pet, dates, food, and medicine. One note is enough.',
      ),
      StepCopy(
        'Drop them at our home',
        'We send the place after we talk. It is not listed on this page.',
      ),
      StepCopy(
        'Go, then pick them up',
        'A short update while you are away. Collect them when you are back.',
      ),
    ],
    whoKicker: 'Who can stay',
    whoTitle: 'Dogs and cats, for a few nights.',
    dogTitle: 'Dogs',
    dogBody:
        'Company, your food routine, and a walk. This is a home stay, not a row of cages.',
    catTitle: 'Cats',
    catBody:
        'A calm corner, litter, and no mixing with a dog if they should be apart.',
    careKicker: 'The stay',
    careTitle: 'What we look after',
    careItems: [
      'Meals at the times you write',
      'Fresh water through the day',
      'A walk for dogs',
      'A litter spot for cats',
      'Medicine only with the timing you give',
      'A WhatsApp photo or short note',
    ],
    packTitle: 'Send these with them',
    packItems: [
      'Their food, or the brand and how much',
      'Medicine, if they take any',
      'A cloth or toy they already know',
      'Vaccine card, if you have it',
    ],
    limitTitle: 'Tell us before you come',
    limitBody:
        'If your pet is sick, in pain, or uneasy with people, say so on the call. This is a home, not a clinic.',
    formKicker: 'One message',
    formTitle: 'Details everyone can read',
    formBody:
        'Fill this once. Send it to us on WhatsApp, or copy the same text into the family group.',
    previewLabel: 'This is the message',
    send: 'Send on WhatsApp',
    copyMessage: 'Copy message',
    copied: 'Copied. Paste it in the family chat.',
    missing: 'Add your name and both dates, then send.',
    openFailed: 'Could not open WhatsApp. Please call +91 75270 24273.',
    fName: 'Your name',
    fPhone: 'Your phone',
    fPhoneHint: 'Optional',
    fPet: 'Pet',
    petDog: 'Dog',
    petCat: 'Cat',
    fPetName: "Pet's name",
    fPetNameHint: 'What you call them',
    fFrom: 'From',
    fTo: 'To',
    fFromHint: '20 Nov',
    fToHint: '22 Nov',
    fNotes: 'Food, medicine, habits',
    fNotesHint: 'Brand, meal times, anything they fear',
    msgHello: 'Hello Paws at Home, I want to leave my pet with you.',
    msgAsk: 'Please tell me if these dates are free.',
    faqKicker: 'Questions',
    faqTitle: 'Short answers',
    faqs: [
      Faq(
        'Is this only for 2–3 days?',
        'That is the usual stay: a function, a wedding, or a short trip. One night is fine. For longer, message us and we will say yes or no plainly.',
      ),
      Faq(
        'Can a dog and a cat both stay?',
        'Yes. If they should be apart, we keep them apart.',
      ),
      Faq(
        'What does it cost?',
        'It depends on the days and the pet. Ask on WhatsApp — there is no long form.',
      ),
      Faq(
        'Where do I drop them?',
        'Call or message. We send the home location after we speak.',
      ),
    ],
    footerLine: 'Home stay for dogs and cats.',
    footerNote: 'We reply on the same number. Nothing is booked until we confirm.',
    navCall: 'Call',
    navWhatsApp: 'WhatsApp',
  ),
  Lang.hi: Copy(
    code: 'हिं',
    kicker: 'कुत्ता और बिल्ली · असली घर',
    heroTitle: 'परिवार के साथ 2–3 दिन का फंक्शन है? कुत्ता या बिल्ली हमारे पास छोड़ जाइए।',
    heroBody:
        'शादी, फंक्शन, या पूरे परिवार के साथ छोटा सफर — पालतू सारी शाम की चिंता नहीं बनना चाहिए। वह घर में रहता है, आपके बताए समय पर खाता है, और आपको एक छोटा WhatsApp नोट मिलता है जिसे सबको भेज सकते हैं।',
    ctaDetails: 'विवरण लिखें',
    ctaCall: 'कॉल',
    trust: ['छोटे ठहराव', 'आपके खाने का समय', 'आगे भेजना आसान'],
    dayTitle: 'जब आप फंक्शन में हों',
    dayLines: [
      DayLine('सुबह', 'नाश्ता, ताज़ा पानी, और कुत्ते के लिए सैर।'),
      DayLine('दोपहर', 'आराम। बिल्ली का अपना शांत कोना।'),
      DayLine('शाम', 'खाना, फिर WhatsApp पर फोटो या कुछ लाइनें।'),
    ],
    howKicker: 'आसान',
    howTitle: 'तीन कदम। लंबा फॉर्म नहीं।',
    steps: [
      StepCopy(
        'तारीखें भेजें',
        'नाम, पालतू, तारीख, खाना और दवाई। एक संदेश काफी है।',
      ),
      StepCopy(
        'उन्हें घर छोड़ जाइए',
        'जगह हम बात के बाद बताते हैं। इस पेज पर पता नहीं है।',
      ),
      StepCopy(
        'जाएँ, फिर ले जाइए',
        'आपके बाहर रहते एक छोटा अपडेट। लौटकर उन्हें ले जाइए।',
      ),
    ],
    whoKicker: 'कौन रह सकता है',
    whoTitle: 'कुत्ता और बिल्ली, कुछ रातों के लिए।',
    dogTitle: 'कुत्ता',
    dogBody:
        'साथ, आपके खाने का तरीका, और सैर। यह घर है, पिंजरों की कतार नहीं।',
    catTitle: 'बिल्ली',
    catBody:
        'शांत कोना, लिट्टर, और अगर कुत्ते से दूर रखना हो तो अलग जगह।',
    careKicker: 'ठहराव',
    careTitle: 'हम क्या संभालते हैं',
    careItems: [
      'आपके लिखे समय पर खाना',
      'दिन भर ताज़ा पानी',
      'कुत्ते की सैर',
      'बिल्ली के लिए लिट्टर',
      'दवाई सिर्फ आपके बताए समय पर',
      'WhatsApp पर फोटो या छोटा नोट',
    ],
    packTitle: 'इनके साथ यह भेजें',
    packItems: [
      'उनका खाना, या ब्रांड और मात्रा',
      'दवाई, अगर लेते हों',
      'कोई कपड़ा या खिलौना जो वे पहचानते हों',
      'वैक्सीन कार्ड, अगर आपके पास हो',
    ],
    limitTitle: 'आने से पहले बता दें',
    limitBody:
        'अगर पालतू बीमार है, दर्द में है, या लोगों के साथ सहज नहीं है, तो कॉल पर बता दें। यह घर है, क्लिनिक नहीं।',
    formKicker: 'एक संदेश',
    formTitle: 'विवरण जो सब पढ़ सकें',
    formBody:
        'एक बार भरें। हमें WhatsApp पर भेजें, या यही टेक्स्ट फ़ैमिली ग्रुप में कॉपी कर दें।',
    previewLabel: 'यही संदेश जाएगा',
    send: 'WhatsApp पर भेजें',
    copyMessage: 'संदेश कॉपी करें',
    copied: 'कॉपी हो गया। फ़ैमिली चैट में पेस्ट कर दें।',
    missing: 'नाम और दोनों तारीखें लिखें, फिर भेजें।',
    openFailed: 'WhatsApp नहीं खुला। कृपया +91 75270 24273 पर कॉल करें।',
    fName: 'आपका नाम',
    fPhone: 'आपका फ़ोन',
    fPhoneHint: 'ज़रूरी नहीं',
    fPet: 'पालतू',
    petDog: 'कुत्ता',
    petCat: 'बिल्ली',
    fPetName: 'पालतू का नाम',
    fPetNameHint: 'आप उन्हें क्या बुलाते हैं',
    fFrom: 'कब से',
    fTo: 'कब तक',
    fFromHint: '20 नवम्बर',
    fToHint: '22 नवम्बर',
    fNotes: 'खाना, दवाई, आदतें',
    fNotesHint: 'ब्रांड, खाने का समय, किस बात से डरते हैं',
    msgHello: 'नमस्ते Paws at Home, मुझे अपना पालतू कुछ दिन आपके पास रखना है।',
    msgAsk: 'कृपया बताएं कि ये तारीखें खाली हैं या नहीं।',
    faqKicker: 'सवाल',
    faqTitle: 'छोटे जवाब',
    faqs: [
      Faq(
        'क्या यह सिर्फ 2–3 दिन के लिए है?',
        'आमतौर पर हाँ — फंक्शन, शादी, या छोटा सफर। एक रात भी ठीक है। ज्यादा दिन के लिए संदेश करें, हम साफ़ हाँ या ना कह देंगे।',
      ),
      Faq(
        'कुत्ता और बिल्ली दोनों रह सकते हैं?',
        'हाँ। अगर उन्हें अलग रखना हो, तो अलग रखते हैं।',
      ),
      Faq(
        'कितने पैसे लगेंगे?',
        'दिनों और पालतू पर निर्भर करता है। WhatsApp पर पूछ लें — लंबा फॉर्म नहीं है।',
      ),
      Faq(
        'छोड़ने कहाँ आना है?',
        'कॉल या संदेश करें। बात के बाद हम घर का लोकेशन भेजते हैं।',
      ),
    ],
    footerLine: 'कुत्ते और बिल्ली के लिए घर जैसा ठहराव।',
    footerNote: 'जवाब इसी नंबर पर मिलेगा। पुष्टि से पहले बुकिंग नहीं होती।',
    navCall: 'कॉल',
    navWhatsApp: 'WhatsApp',
  ),
  Lang.pa: Copy(
    code: 'ਪੰ',
    kicker: 'ਕੁੱਤਾ ਅਤੇ ਬਿੱਲੀ · ਅਸਲੀ ਘਰ',
    heroTitle: 'ਪਰਿਵਾਰ ਨਾਲ 2–3 ਦਿਨ ਦਾ ਫੰਕਸ਼ਨ ਹੈ? ਕੁੱਤਾ ਜਾਂ ਬਿੱਲੀ ਸਾਡੇ ਕੋਲ ਛੱਡ ਜਾਓ।',
    heroBody:
        'ਵਿਆਹ, ਫੰਕਸ਼ਨ, ਜਾਂ ਸਾਰੇ ਪਰਿਵਾਰ ਨਾਲ ਛੋਟੀ ਯਾਤਰਾ — ਪਾਲਤੂ ਸਾਰੀ ਸ਼ਾਮ ਦੀ ਚਿੰਤਾ ਨਹੀਂ ਬਣਨਾ ਚਾਹੀਦਾ। ਉਹ ਘਰ ਵਿੱਚ ਰਹਿੰਦਾ ਹੈ, ਤੁਹਾਡੇ ਦੱਸੇ ਸਮੇਂ ਖਾਂਦਾ ਹੈ, ਅਤੇ ਤੁਹਾਨੂੰ ਇੱਕ ਛੋਟਾ WhatsApp ਨੋਟ ਮਿਲਦਾ ਹੈ ਜੋ ਸਭ ਨੂੰ ਭੇਜ ਸਕਦੇ ਹੋ।',
    ctaDetails: 'ਵੇਰਵਾ ਲਿਖੋ',
    ctaCall: 'ਕਾਲ',
    trust: ['ਛੋਟੇ ਠਹਿਰਾਅ', 'ਤੁਹਾਡੇ ਖਾਣੇ ਦਾ ਸਮਾਂ', 'ਅੱਗੇ ਭੇਜਣਾ ਸੌਖਾ'],
    dayTitle: 'ਜਦੋਂ ਤੁਸੀਂ ਫੰਕਸ਼ਨ ਵਿੱਚ ਹੋਵੋ',
    dayLines: [
      DayLine('ਸਵੇਰ', 'ਨਾਸ਼ਤਾ, ਤਾਜ਼ਾ ਪਾਣੀ, ਅਤੇ ਕੁੱਤੇ ਲਈ ਸੈਰ।'),
      DayLine('ਦੁਪਹਿਰ', 'ਆਰਾਮ। ਬਿੱਲੀ ਦਾ ਆਪਣਾ ਸ਼ਾਂਤ ਕੋਨਾ।'),
      DayLine('ਸ਼ਾਮ', 'ਖਾਣਾ, ਫਿਰ WhatsApp ਤੇ ਫੋਟੋ ਜਾਂ ਕੁਝ ਲਾਈਨਾਂ।'),
    ],
    howKicker: 'ਸੌਖਾ',
    howTitle: 'ਤਿੰਨ ਕਦਮ। ਲੰਮਾ ਫਾਰਮ ਨਹੀਂ।',
    steps: [
      StepCopy(
        'ਤਾਰੀਖਾਂ ਭੇਜੋ',
        'ਨਾਮ, ਪਾਲਤੂ, ਤਾਰੀਖ, ਖਾਣਾ ਅਤੇ ਦਵਾਈ। ਇੱਕ ਸੁਨੇਹਾ ਕਾਫ਼ੀ ਹੈ।',
      ),
      StepCopy(
        'ਉਨ੍ਹਾਂ ਨੂੰ ਘਰ ਛੱਡ ਜਾਓ',
        'ਜਗ੍ਹਾ ਅਸੀਂ ਗੱਲ ਤੋਂ ਬਾਅਦ ਦੱਸਦੇ ਹਾਂ। ਇਸ ਪੰਨੇ ਤੇ ਪਤਾ ਨਹੀਂ।',
      ),
      StepCopy(
        'ਜਾਓ, ਫਿਰ ਲੈ ਜਾਓ',
        'ਤੁਹਾਡੇ ਬਾਹਰ ਹੁੰਦਿਆਂ ਇੱਕ ਛੋਟਾ ਅੱਪਡੇਟ। ਵਾਪਸ ਆ ਕੇ ਲੈ ਜਾਓ।',
      ),
    ],
    whoKicker: 'ਕੌਣ ਰਹਿ ਸਕਦਾ ਹੈ',
    whoTitle: 'ਕੁੱਤਾ ਅਤੇ ਬਿੱਲੀ, ਕੁਝ ਰਾਤਾਂ ਲਈ।',
    dogTitle: 'ਕੁੱਤਾ',
    dogBody:
        'ਸਾਥ, ਤੁਹਾਡੇ ਖਾਣੇ ਦਾ ਢੰਗ, ਅਤੇ ਸੈਰ। ਇਹ ਘਰ ਹੈ, ਪਿੰਜਰਿਆਂ ਦੀ ਕਤਾਰ ਨਹੀਂ।',
    catTitle: 'ਬਿੱਲੀ',
    catBody:
        'ਸ਼ਾਂਤ ਕੋਨਾ, ਲਿਟਰ, ਅਤੇ ਜੇ ਕੁੱਤੇ ਤੋਂ ਵੱਖ ਰੱਖਣਾ ਹੋਵੇ ਤਾਂ ਵੱਖ ਜਗ੍ਹਾ।',
    careKicker: 'ਠਹਿਰਾਅ',
    careTitle: 'ਅਸੀਂ ਕੀ ਸੰਭਾਲਦੇ ਹਾਂ',
    careItems: [
      'ਤੁਹਾਡੇ ਲਿਖੇ ਸਮੇਂ ਖਾਣਾ',
      'ਦਿਨ ਭਰ ਤਾਜ਼ਾ ਪਾਣੀ',
      'ਕੁੱਤੇ ਦੀ ਸੈਰ',
      'ਬਿੱਲੀ ਲਈ ਲਿਟਰ',
      'ਦਵਾਈ ਸਿਰਫ਼ ਤੁਹਾਡੇ ਦੱਸੇ ਸਮੇਂ',
      'WhatsApp ਤੇ ਫੋਟੋ ਜਾਂ ਛੋਟਾ ਨੋਟ',
    ],
    packTitle: 'ਇਨ੍ਹਾਂ ਨਾਲ ਇਹ ਭੇਜੋ',
    packItems: [
      'ਉਨ੍ਹਾਂ ਦਾ ਖਾਣਾ, ਜਾਂ ਬ੍ਰਾਂਡ ਅਤੇ ਮਾਤਰਾ',
      'ਦਵਾਈ, ਜੇ ਲੈਂਦੇ ਹੋਣ',
      'ਕੋਈ ਕੱਪੜਾ ਜਾਂ ਖਿਡੌਣਾ ਜੋ ਉਹ ਪਛਾਣਦੇ ਹੋਣ',
      'ਟੀਕੇ ਦਾ ਕਾਰਡ, ਜੇ ਤੁਹਾਡੇ ਕੋਲ ਹੋਵੇ',
    ],
    limitTitle: 'ਆਉਣ ਤੋਂ ਪਹਿਲਾਂ ਦੱਸ ਦਿਓ',
    limitBody:
        'ਜੇ ਪਾਲਤੂ ਬਿਮਾਰ ਹੈ, ਦਰਦ ਵਿੱਚ ਹੈ, ਜਾਂ ਲੋਕਾਂ ਨਾਲ ਸਹਿਜ ਨਹੀਂ, ਤਾਂ ਕਾਲ ਤੇ ਦੱਸ ਦਿਓ। ਇਹ ਘਰ ਹੈ, ਕਲੀਨਿਕ ਨਹੀਂ।',
    formKicker: 'ਇੱਕ ਸੁਨੇਹਾ',
    formTitle: 'ਵੇਰਵਾ ਜੋ ਸਭ ਪੜ੍ਹ ਸਕਣ',
    formBody:
        'ਇੱਕ ਵਾਰ ਭਰੋ। ਸਾਨੂੰ WhatsApp ਤੇ ਭੇਜੋ, ਜਾਂ ਇਹੀ ਲਿਖਤ ਫੈਮਿਲੀ ਗਰੁੱਪ ਵਿੱਚ ਕਾਪੀ ਕਰ ਦਿਓ।',
    previewLabel: 'ਇਹੀ ਸੁਨੇਹਾ ਜਾਵੇਗਾ',
    send: 'WhatsApp ਤੇ ਭੇਜੋ',
    copyMessage: 'ਸੁਨੇਹਾ ਕਾਪੀ ਕਰੋ',
    copied: 'ਕਾਪੀ ਹੋ ਗਿਆ। ਫੈਮਿਲੀ ਚੈਟ ਵਿੱਚ ਪੇਸਟ ਕਰ ਦਿਓ।',
    missing: 'ਨਾਮ ਅਤੇ ਦੋਵੇਂ ਤਾਰੀਖਾਂ ਲਿਖੋ, ਫਿਰ ਭੇਜੋ।',
    openFailed: 'WhatsApp ਨਹੀਂ ਖੁਲ੍ਹਿਆ। ਕਿਰਪਾ ਕਰਕੇ +91 75270 24273 ਤੇ ਕਾਲ ਕਰੋ।',
    fName: 'ਤੁਹਾਡਾ ਨਾਮ',
    fPhone: 'ਤੁਹਾਡਾ ਫੋਨ',
    fPhoneHint: 'ਜ਼ਰੂਰੀ ਨਹੀਂ',
    fPet: 'ਪਾਲਤੂ',
    petDog: 'ਕੁੱਤਾ',
    petCat: 'ਬਿੱਲੀ',
    fPetName: 'ਪਾਲਤੂ ਦਾ ਨਾਮ',
    fPetNameHint: 'ਤੁਸੀਂ ਉਨ੍ਹਾਂ ਨੂੰ ਕੀ ਕਹਿੰਦੇ ਹੋ',
    fFrom: 'ਕਦੋਂ ਤੋਂ',
    fTo: 'ਕਦੋਂ ਤੱਕ',
    fFromHint: '20 ਨਵੰਬਰ',
    fToHint: '22 ਨਵੰਬਰ',
    fNotes: 'ਖਾਣਾ, ਦਵਾਈ, ਆਦਤਾਂ',
    fNotesHint: 'ਬ੍ਰਾਂਡ, ਖਾਣੇ ਦਾ ਸਮਾਂ, ਕਿਸ ਗੱਲ ਤੋਂ ਡਰਦੇ ਹਨ',
    msgHello: 'ਸਤਿ ਸ੍ਰੀ ਅਕਾਲ Paws at Home, ਮੈਨੂੰ ਆਪਣਾ ਪਾਲਤੂ ਕੁਝ ਦਿਨ ਤੁਹਾਡੇ ਕੋਲ ਰੱਖਣਾ ਹੈ।',
    msgAsk: 'ਕਿਰਪਾ ਕਰਕੇ ਦੱਸੋ ਕਿ ਇਹ ਤਾਰੀਖਾਂ ਖਾਲੀ ਹਨ ਜਾਂ ਨਹੀਂ।',
    faqKicker: 'ਸਵਾਲ',
    faqTitle: 'ਛੋਟੇ ਜਵਾਬ',
    faqs: [
      Faq(
        'ਕੀ ਇਹ ਸਿਰਫ਼ 2–3 ਦਿਨ ਲਈ ਹੈ?',
        'ਆਮ ਤੌਰ ਤੇ ਹਾਂ — ਫੰਕਸ਼ਨ, ਵਿਆਹ, ਜਾਂ ਛੋਟੀ ਯਾਤਰਾ। ਇੱਕ ਰਾਤ ਵੀ ਠੀਕ ਹੈ। ਵੱਧ ਦਿਨਾਂ ਲਈ ਸੁਨੇਹਾ ਕਰੋ, ਅਸੀਂ ਸਾਫ਼ ਹਾਂ ਜਾਂ ਨਾ ਕਹਿ ਦੇਵਾਂਗੇ।',
      ),
      Faq(
        'ਕੁੱਤਾ ਅਤੇ ਬਿੱਲੀ ਦੋਵੇਂ ਰਹਿ ਸਕਦੇ ਹਨ?',
        'ਹਾਂ। ਜੇ ਉਨ੍ਹਾਂ ਨੂੰ ਵੱਖ ਰੱਖਣਾ ਹੋਵੇ, ਤਾਂ ਵੱਖ ਰੱਖਦੇ ਹਾਂ।',
      ),
      Faq(
        'ਕਿੰਨੇ ਪੈਸੇ ਲੱਗਣਗੇ?',
        'ਦਿਨਾਂ ਅਤੇ ਪਾਲਤੂ ਤੇ ਨਿਰਭਰ ਕਰਦਾ ਹੈ। WhatsApp ਤੇ ਪੁੱਛ ਲਵੋ — ਲੰਮਾ ਫਾਰਮ ਨਹੀਂ।',
      ),
      Faq(
        'ਛੱਡਣ ਕਿੱਥੇ ਆਉਣਾ ਹੈ?',
        'ਕਾਲ ਜਾਂ ਸੁਨੇਹਾ ਕਰੋ। ਗੱਲ ਤੋਂ ਬਾਅਦ ਅਸੀਂ ਘਰ ਦਾ ਲੋਕੇਸ਼ਨ ਭੇਜਦੇ ਹਾਂ।',
      ),
    ],
    footerLine: 'ਕੁੱਤੇ ਅਤੇ ਬਿੱਲੀ ਲਈ ਘਰ ਵਰਗਾ ਠਹਿਰਾਅ।',
    footerNote: 'ਜਵਾਬ ਇਸੇ ਨੰਬਰ ਤੇ ਮਿਲੇਗਾ। ਪੁਸ਼ਟੀ ਤੋਂ ਪਹਿਲਾਂ ਬੁਕਿੰਗ ਨਹੀਂ ਹੁੰਦੀ।',
    navCall: 'ਕਾਲ',
    navWhatsApp: 'WhatsApp',
  ),
};

String buildPetMessage({
  required Copy copy,
  required String name,
  required String phone,
  required String pet,
  required String petName,
  required String from,
  required String to,
  required String notes,
}) {
  String line(String label, String value) {
    final trimmed = value.trim();
    return '$label: ${trimmed.isEmpty ? '—' : trimmed}';
  }

  return [
    copy.msgHello,
    '',
    line(copy.fName, name),
    line(copy.fPhone, phone),
    line(copy.fPet, pet),
    line(copy.fPetName, petName),
    line(copy.fFrom, from),
    line(copy.fTo, to),
    line(copy.fNotes, notes),
    '',
    copy.msgAsk,
    'Paws at Home · $pawPhoneDisplay',
  ].join('\n');
}
