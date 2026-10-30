# Umeed (امید) — Design Document

**Working name:** Umeed (امید, "hope"). Rename freely; nothing in the plan depends on it.
**Status:** v0.1 draft for clinician review
**Owner:** Homi (clinical lead and product owner)
**Platforms:** Android first (Flutter), iOS and web later
**Languages:** Urdu (اردو) and English at launch, built so more languages can be added without code changes

---

## 1. Vision

A quiet, private place for people who are exhausted, overwhelmed or emotionally low, and who cannot or will not talk to anyone about it.

> Umeed doesn't ask you to talk. It lets you put it down.

The app is **not** therapy, not a diagnosis tool and not a crisis service. It is a **self-help companion** that sits between "doing nothing" and "seeing a professional", and it makes the step toward real help feel safe when the person is ready.

### 1.1 Who it's for
Anyone, anywhere, who reads Urdu or English and is struggling quietly. No geographic boundary: the content is culturally gentle and the crisis resources are chosen by the user's country, not forced on them.

### 1.2 Personas

| Persona | Situation | What they need from the app |
|---|---|---|
| **Ayesha, 24, student** | Burnt out, ashamed to tell family, awake at 3 a.m. | A private space, sleep wind-down, no judgment |
| **Bilal, 35, working abroad** | Lonely, stressed, feels he must "stay strong" | Short grounding tools, a way to name feelings, a nudge toward help |
| **Sara, 29, new mother** | Overwhelmed, numb, no energy for anything | The tiniest possible actions, no streak guilt |
| **Omar, 41, introvert** | Anxious in groups, can't open up to anyone | Writing and voice outlet, anonymous question to a clinician |
| **Someone in crisis** | Dark thoughts tonight | Immediate, obvious, offline route to help |

### 1.3 Non-goals (v1 and v2)
- Diagnosing, scoring severity, or labelling users ("you have depression").
- Replacing a clinician, or giving individual treatment advice.
- Open social feeds, public posting, or likes.
- Ads, data selling, or growth tricks (streak shaming, guilt notifications).
- An unsupervised AI chatbot giving advice (see §13 for the guarded path).

---

## 2. Design principles

1. **Lowest possible effort.** Every core action works with almost no energy: one tap, 10 seconds.
2. **No performance, no pressure.** No streaks, no "you missed a day", no scores. Gentle, optional, forgiving.
3. **Private by default.** Everything stays on the device. No account needed. Leaving is as easy as arriving.
4. **Safety is always one tap away.** The crisis route works offline, in both languages, from every screen.
5. **Honest about limits.** The app says clearly what it is and isn't.
6. **Warm, not clinical.** Language like "feeling heavy" instead of "symptoms". Never pathologising.
7. **Bilingual as a first-class design constraint**, not a translation afterthought (§7).
8. **Evidence-informed.** Techniques come from established approaches (CBT, behavioural activation, grounding, paced breathing, ACT, Stanley-Brown safety planning), reviewed by the clinical lead.
9. **Built to grow.** Content, languages and features are modular so the app can deepen without a rewrite.

---

## 3. Safety & ethics framework

This section outranks every feature. Nothing ships if it breaks these rules.

### 3.1 Crisis support
- A persistent, low-visual-weight **"I need help now"** control on every screen (long-press or visible button; never hidden in menus).
- Opens a **Crisis screen** that works fully offline:
  1. Calm line: "You're not alone. This moment can pass."
  2. **Call a helpline** (by user's chosen country) and **emergency number**.
  3. **My safety plan** (§5.7) if they have written one.
  4. A 60-second grounding exercise.
  5. "Text someone I trust" (opens the phone's own messaging with a pre-written line the user wrote earlier).
- **Helpline directory:** bundled offline, per country, versioned, and verified by the clinical lead before each release. The user picks their country in settings (no location permission). If unknown, fall back to a "find a helpline" pointer and the instruction to call local emergency services. Numbers in code are placeholders until verified.
- **Crisis language detection in the journal:** a simple, on-device, rule-based check for high-risk phrases in both languages. If triggered, show a gentle, non-alarming card offering the Crisis screen. Never auto-contact anyone, never block the user, never store a flag. Rules are reviewed by the clinical lead; false positives are acceptable, false negatives are minimised.

### 3.2 Scope and disclaimers
- First-run screen and About page state plainly: *self-help, not medical advice, not an emergency service*.
- No diagnosis, no severity scoring, no medication guidance.
- Mood patterns are shown as reflections, never as clinical conclusions.
- Any "check-in questionnaire" (PHQ-9/GAD-7 style) is deferred; if added later it needs clinical sign-off and a safe-results design (§14).

### 3.3 Content governance
- Every piece of educational content has: author, clinical reviewer, review date, version.
- A **content style guide** (tone, banned phrases, how to talk about self-harm safely, aligned with safe-messaging guidelines).
- Content is reviewed in both languages by a native speaker, not machine-translated.

### 3.4 Vulnerable users
- No dark patterns: no guilt notifications, no "we miss you", no urgency.
- Notifications are **off by default**, user-scheduled, and worded softly. They show no sensitive text on the lock screen.
- Optional **discreet mode**: neutral app name/icon and PIN/biometric lock, so the app is safe on a shared or monitored phone.
- Age: 13+ at launch (declared at first run); under-18 experience avoids certain content and reviews separately.

### 3.5 Clinician responsibilities
Because the app carries a clinician's name:
- Check professional-licensing rules for tele-advice or app endorsement in your registering body and any country where you invite users.
- Any "ask the doctor" feature (Phase 3) must be framed as general education, with no individual treatment relationship formed, and with clear terms.
- Keep a record of clinical review for liability and store policy.

---

## 4. Product scope at a glance

```
CORE LOOP:   Check in  →  Calm / Release  →  Small step  →  (optional) Bridge to help
                 ↑                                                  │
                 └────────── gentle reflection over time ───────────┘
```

| Pillar | What it gives |
|---|---|
| **Check-in** | 10-second mood and energy log |
| **Release** | Journal (text and voice), write-and-release |
| **Calm** | Breathing, grounding, muscle relaxation, audio |
| **Small steps** | Tiny actions for low-energy days |
| **Learn** | Short, kind education cards from the clinical lead |
| **Sleep** | Wind-down routine and worry dump |
| **Safety** | Crisis screen and personal safety plan |
| **Bridge** | Gentle path to real help, when ready |

---

## 5. Features (detailed)

### 5.1 Onboarding (target: under 60 seconds, skippable)
1. Language pick (اردو / English), changeable anytime. Applies direction (RTL/LTR) instantly.
2. "What this is / isn't" (one screen).
3. Optional: how are you feeling right now? (first check-in, sets the tone).
4. Optional: set lock (PIN / biometric) and discreet mode.
5. Country for helplines (optional, can skip, asked again only when opening Crisis).
No account, no email, no phone number.

### 5.2 Home ("Today")
- One calm greeting, one primary action: **How are you?**
- Below, up to three soft suggestions based on the last check-in (e.g. "Heavy day? Try 2 minutes of breathing").
- Always visible: the Help-now control.
- No counts, no streaks, no badges.

### 5.3 Check-in
- Pick a feeling from a small set, shown as shapes/colours plus words (not faces only; avoids cultural bias): *calm, okay, tired, anxious, sad, numb, angry, overwhelmed, hopeful*.
- Energy slider (low to high), optional.
- Optional tags: *sleep, work, family, health, money, alone, other*.
- Optional note (text or voice).
- Ends with a kind response and, if appropriate, one suggestion. Never a score.

### 5.4 Journal & release
- **Journal:** free writing with gentle prompts ("What's weighing on you?", "What would you tell a friend feeling this?"). Text and voice notes (voice stored on-device, encrypted).
- **Write and release:** type it, then watch it dissolve; nothing is saved. Perfect for thoughts a person doesn't want to keep.
- **Thought untangler (CBT-lite):** guided steps: situation, thought, feeling, a kinder alternative thought. Short, optional, and saved only if the user chooses.
- Entries searchable locally; export and delete are first-class.

### 5.5 Calm toolkit (offline, no login)
- **Paced breathing** (e.g. 4-6, box, 4-7-8 variants) with visual guide and optional gentle haptics.
- **5-4-3-2-1 grounding.**
- **Progressive muscle relaxation** (audio, 5 and 10 minute).
- **Body scan** and **calming sounds** (rain, soft tones).
- **Panic first-aid:** a 90-second sequence for a racing heart.
- Audio recorded in both languages by native speakers (Phase 2 for full set; MVP uses text and visual guidance).

### 5.6 "Too tired" mode (small steps)
A deliberately tiny action list for zero-energy days, built on behavioural activation: *drink water, open a window, wash your face, sit by the light for 2 minutes, text one person "hi"*. One step at a time, big checkmark, no judgement if skipped. Users can add their own tiny steps.

### 5.7 My safety plan
Based on the Stanley-Brown safety planning approach, filled in by the user, private:
1. My warning signs
2. Things I can do on my own to cope
3. People/places that help me feel better
4. People I can ask for help
5. Professionals / helplines I can contact
6. Making my space safer
7. My reasons to keep going

The plan is reachable from the Crisis screen and can be exported or shared with someone the user trusts.

### 5.8 Learn
- Short cards (under 90 seconds' read), tagged by topic: *burnout, anxiety, low mood, sleep, loneliness, grief, work stress, relationships, when to seek help*.
- Voice of the clinical lead, kind and plain; each ends with one tiny action and, where relevant, a "when to see someone" note.
- Bookmarkable, read offline, bundled in-app (updates in Phase 2).

### 5.9 Sleep
- Wind-down routine builder (screens off, breathing, worry dump, soft audio).
- **Worry dump:** write tomorrow's worries tonight, so the mind can let go.
- Sleep notes (not tracking hardware; no pressure to log).

### 5.10 Reflection (patterns, gently)
- Weekly view of moods in soft colour bands, not graphs of "good vs bad".
- Gentle observations: "Evenings tend to feel heavier." "You wrote more after exercise days."
- Always private, always optional, never a verdict.

### 5.11 Bridge to help ("When you're ready")
- Explains in plain language what talking to someone looks like, and what to say ("a script for your first message").
- Links to the user's country helpline directory and to professional-finding resources.
- Phase 3+: anonymous Q&A with the clinician, then a vetted professional directory.

### 5.12 Settings & privacy
Language, country, lock, discreet mode, notifications schedule, text size, theme (light/dark/low-stimulus), **Export my data**, **Delete everything**, About and credits, privacy policy, safety disclaimer.

---

## 6. Information architecture

```
Bottom nav (5 tabs, calm and simple)
├─ Today        Home, check-in entry, soft suggestions
├─ Calm         Breathing · Grounding · Muscle relaxation · Sounds · Panic first-aid
├─ Journal      Write · Voice · Release · Thought untangler · History
├─ Learn        Topic cards · Bookmarks
└─ Me           Reflection · Safety plan · Settings · Privacy · About

Always present: [ Help now ] → Crisis screen
Contextual:    "Too tired" mode, Sleep wind-down (from Today / Calm)
```

---

## 7. Bilingual design (Urdu + English)

This is a design constraint from day one.

### 7.1 Direction and layout
- Urdu is **RTL**, English **LTR**. Use directional-aware widgets (`EdgeInsetsDirectional`, `AlignmentDirectional`, start/end rather than left/right) everywhere.
- Mirror navigation, progress and back affordances. Do **not** mirror media controls (play/pause) or the breathing circle.
- Mixed text (Urdu with English words, numerals, brand names) must render correctly (bidi handling). Test with real mixed samples.

### 7.2 Typography
- Urdu is traditionally read in **Nastaliq**, which needs generous line height and can be hard to read at small UI sizes. Plan:
  - **Content (Learn, journal prompts, long reading):** Noto Nastaliq Urdu, large line height.
  - **UI chrome (buttons, labels, tabs):** a clean Naskh or Urdu-friendly sans (e.g. Noto Naskh Arabic / Noto Sans Arabic) for legibility at small sizes.
  - English: a humane sans (e.g. Inter / Nunito).
- Provide a **text size** control; Urdu defaults slightly larger.
- Bundle fonts (no network fetch), keep a fallback, and test on low-end Android.

### 7.3 Language handling
- All strings in ARB files (`app_en.arb`, `app_ur.arb`); no hard-coded text.
- **Native-written Urdu**, not machine translation; reviewed by a native speaker with clinical sensitivity. Register: warm, simple, respectful (aap, not tum); avoid heavy Persianised or Sanskritised words that feel formal or alienating.
- **Roman Urdu:** many users type Urdu in Latin script. Journaling must accept any script and never "correct" it. A Roman Urdu *reading* mode for content is a Phase 2 option.
- Numerals: user choice of Western (0-9) or Arabic-Indic/Extended (۰-۹).
- Dates: Gregorian by default; optional Hijri display later.
- Plurals, gender and formality handled via ICU messages; avoid gendered phrasing in prompts where possible.
- Audio and voice prompts recorded in both languages (Phase 2).

### 7.4 Future languages
The pipeline is designed so adding a language is **content + font + ARB**, not code: Arabic, Hindi (Devanagari), Bengali, Pashto, Persian, Spanish, French, and others, each requiring native clinical review and local crisis resources. Keep the language list data-driven.

---

## 8. Visual and interaction design

### 8.1 Feel
Soft, spacious, slow. Think warm dusk rather than clinical white or alarmed red.
- **Palette:** muted teal/sage, warm sand, soft rose, and deep twilight blue for dark mode. No harsh red except the Crisis screen's calm amber accent. Colour never carries meaning alone (accessibility).
- **Shapes:** rounded, organic; generous whitespace.
- **Imagery:** abstract shapes, gentle gradients, light and water; avoid stock photos of "sad people" and avoid culturally specific religious or gendered imagery by default.
- **Motion:** slow, eased, never jarring; **reduced-motion** respected; the breathing animation is the hero.
- **Sound and haptics:** optional, soft; defaults off.

### 8.2 Components (design system)
Tokens for colour, type, spacing, radius, elevation; light, dark and "low-stimulus" themes. Core widgets: `FeelingChip`, `EnergySlider`, `BreathingGuide`, `SoftCard`, `HelpNowButton`, `BigStepButton`, `LockScreen`, `ReleaseAnimation`.

### 8.3 Accessibility
- Target WCAG 2.2 AA: contrast, tap targets (min 48dp), screen-reader labels in both languages (TalkBack), scalable text, no colour-only meaning.
- Cognitive accessibility is key for this audience: short screens, one decision at a time, plain language, undo for everything.
- Voice input and output as a first-class path (helps low-literacy and low-energy users).

---

## 9. Technical architecture

### 9.1 Principles
Local-first, offline-capable, feature-first modular code, a single write path for state, and no network dependency in v1.

### 9.2 Stack (Flutter)
| Concern | Choice | Notes |
|---|---|---|
| Framework | Flutter (Dart 3) | Android first; iOS and web later with the same code |
| State & DI | Riverpod 3 | Immutable state, single write path |
| Navigation | go_router | Deep links for notifications and the Crisis screen |
| Local DB | Drift (SQLite) + **SQLCipher** | Encrypted at rest |
| Secrets | flutter_secure_storage | DB key, held in the Android Keystore |
| App lock | local_auth + PIN | Biometric and fallback PIN |
| Localisation | flutter_localizations + ARB | en, ur; RTL aware |
| Audio | just_audio + record | Voice notes and guided audio |
| Notifications | flutter_local_notifications | User-scheduled, off by default |
| Content | Bundled versioned JSON/Markdown packs | OTA-signed updates in Phase 2 |
| Errors | Typed `Result<T, Failure>` | No exceptions across layers |

### 9.3 Layering
```
lib/
  app/                 bootstrap, router, theme, l10n
  core/                result/failure, clock, logging, security, utils
  features/
    checkin/  journal/  calm/  steps/  learn/  sleep/
    reflection/  safety/  bridge/  settings/  onboarding/
      ├─ data/          Drift DAOs, repositories
      ├─ domain/        entities, use-cases, value objects
      └─ presentation/  view-models (Riverpod), widgets
  content/             schema + loaders for content packs
  services/            audio, notifications, lock, export (behind interfaces)
```
Widgets stay thin; side effects (clock, notifications, audio) are injected behind interfaces so they can be tested.

### 9.4 Data model (v1, all local)
- `mood_entry(id, at, feeling, energy?, tags[], note?, voice_ref?)`
- `journal_entry(id, at, kind[free|untangle|worry], body, voice_ref?, prompt_id?)`
- `exercise_session(id, at, exercise_id, duration, completed)`
- `small_step(id, label, is_custom)` + `step_log(id, step_id, at)`
- `safety_plan(section, items[])` (single record, encrypted)
- `content_progress(card_id, bookmarked, read_at?)`
- `settings(key, value)` — language, country, lock, theme, notification schedule
- `trusted_contact_message` (the pre-written line for Crisis)
Everything keyed to the device; **no user id exists** in v1.

### 9.5 Security
- DB encrypted with SQLCipher; key in Keystore-backed secure storage.
- App lock with auto-lock timeout; `FLAG_SECURE` to block screenshots/recents preview of sensitive screens.
- No analytics SDKs, no third-party trackers, no ad SDKs, no crash reporter that sends content (crash reports opt-in, content-scrubbed).
- Export is a user-initiated encrypted file; delete-all wipes DB, keys and audio.
- Dependency hygiene: minimal, audited packages; pinned versions.

### 9.6 Quality
Unit tests on domain logic; golden tests in **both languages and both directions**; accessibility tests; RTL layout tests; a crisis-path integration test that must pass in CI before any release; performance on low-end devices (budget: cold start under 2 s on a 3 GB RAM phone).

### 9.7 Build and release
Fastlane or GitHub Actions CI, signed AAB, staged rollout, Play Console health-app declarations, privacy policy hosted on a simple site, versioned release notes.

---

## 10. Privacy and compliance (no geographic limits)

Because users can be anywhere, design to the strictest common standard.

- **Data minimisation:** v1 collects nothing off-device. That makes GDPR/UK-GDPR/PDPA-style obligations trivial for v1.
- **When data leaves the device (Phase 3+):** explicit opt-in, end-to-end encrypted, purpose-limited, deletable, with a clear privacy policy and a lawful basis. Treat all mood/journal data as special-category (health) data.
- **Stores:** Google Play Health apps declaration and mental-health policy; Apple's health/mental-health review guidelines for iOS. Avoid any medical-device claims; keep the "self-help, not treatment" wording.
- **Regulatory watch:** if features start to look like treatment or diagnosis, medical-device rules (e.g. FDA / EU MDR) may apply. Keep a standing review with each phase.
- **Cross-border sync (Phase 3+):** choose a region-flexible host; document data location; offer deletion on request.
- **Clinician obligations:** see §3.5.

---

## 11. Content strategy

- **Pillars:** burnout, anxiety, low mood, sleep, loneliness, grief, work and money stress, relationships, "how to ask for help".
- **Format:** 60-90 second cards; one idea, one tiny action; Urdu and English written natively.
- **Launch set:** 20 cards (10 per pillar group), 6 calm exercises, 8 journal prompts, 12 tiny steps, the safety-plan template, and the crisis directory.
- **Pipeline:** draft (Homi) → native editor → safe-messaging check → clinical sign-off → record in repo with metadata → ship in content pack.
- **Reuse:** the same cards power Facebook/Instagram posts and the in-app feed, which keeps the page and the app in step.
- **Page-to-app loop:** the Facebook page builds trust and a demand signal; posts link to the app; app content mirrors the best-performing page topics.

---

## 12. Sustainability and business model

The app must be safe first, sustainable second.

- **Core is free, always:** check-in, journal, calm toolkit, safety plan, crisis screen, core content. Never paywall safety.
- **No ads, no data sales.**
- **Options for sustaining it:**
  1. Voluntary support ("Support Umeed") and donations.
  2. Optional low-cost "Plus" (extra audio programs, more themes, encrypted backup) that never gates safety or the basics.
  3. Grants and partnerships with NGOs, universities and mental-health charities.
  4. Later, B2B programmes (workplaces, universities) with strict aggregate-only, consented reporting.
- Reserve the decision until Phase 2; v1 is funded by you.

---

## 13. Future prospects and extensibility

Designed-in hooks so each of these is an addition, not a rewrite.

| Prospect | Notes |
|---|---|
| **More languages and regions** | Data-driven language list, country-specific crisis packs, local content partners |
| **iOS and web** | Same Flutter codebase; web as a "light" companion |
| **Encrypted backup and multi-device** | End-to-end encrypted, optional account, user-held key |
| **Anonymous Q&A with the clinician** | Submit a question without identity; answers published as general education |
| **Moderated peer circles** | Small, topic-based, anonymous, trained moderators, strict safety rules, report and block; never open public posting |
| **Professional directory and tele-referral** | Vetted therapists/counsellors by language and country; booking handled externally |
| **Guided programmes** | 7/14/30-day courses (sleep reset, anxiety basics, burnout recovery) |
| **On-device AI reflection** | A small local model that mirrors back what the user wrote and suggests exercises. No cloud, no advice, hard-coded crisis hand-off, clinician-tested prompts. Gate behind a safety evaluation |
| **Voice-first experience** | Speak a check-in; calm audio guides; TTS for low-literacy users |
| **Wearables and sensors (opt-in)** | Heart-rate-guided breathing, sleep data import, still on-device |
| **Widgets, quick tiles, wear OS** | One-tap check-in from the home screen |
| **Research partnerships** | Opt-in, de-identified, aggregate data for studies, with ethics approval and informed consent |
| **Clinician tools** | Optional "share a summary with my therapist" export the user controls |
| **Cultural adaptations** | Faith-sensitive modules (opt-in, e.g. dua, mindfulness traditions), diaspora-specific content |

**Architecture hooks:** repository interfaces behind every data source (swap local for synced later), a content-pack format that can be remotely updated and signed, an `AnalyticsPort` that is a no-op by default (so consent-based metrics can plug in later), and feature flags for staged rollout.

---

## 14. Success measures (privacy-respecting)

Avoid vanity metrics. Candidates, all aggregate and opt-in:
- Share of installs that complete a first check-in
- Week-4 retention (as a rough signal of usefulness, not a target to chase)
- Use of the Calm toolkit and "Too tired" mode
- Content cards read and bookmarked
- Qualitative feedback (in-app, anonymous, optional)
- Crisis screen opens and tap-through to a helpline (aggregate counts only, never linked to an identity)
- Clinical lens: simple user-reported "did this help right now?" after an exercise

Avoid optimising for time-in-app. Success means people feel a little better and are more able to seek help.

---

## 15. Risks and mitigations

| Risk | Mitigation |
|---|---|
| Someone in crisis relies on the app | Always-visible Crisis route, offline helplines, clear scope statements, crisis-phrase detection |
| Wrong or outdated helpline numbers | Clinical verification per release; directory versioned and dated; "verify" step in release checklist |
| Harmful content or wording | Safe-messaging style guide, two-person review, native editing |
| Privacy breach on a shared phone | App lock, discreet mode, no lock-screen text, `FLAG_SECURE` |
| Urdu rendering and readability issues | Font testing on low-end devices, size control, native review |
| Clinician liability or regulatory exposure | Check licensing rules, careful wording, no individual advice, record of review |
| Scope creep into "treatment" | Phase gates include a regulatory check |
| Burnout of the founder (you) | Phase small, automate the content pipeline, share review with trusted colleagues |
| AI misuse later | Local-only, guarded, tested, with a hard crisis hand-off, or not shipped |

---

# 16. Phased roadmap

Each phase has a goal, scope, and an **exit gate** that must be met before the next begins. Durations are rough for a solo founder building part-time; adjust to your pace.

## Phase 0 — Foundations and validation (≈ 3-4 weeks, before/alongside coding)
**Goal:** know the real needs and prepare the safety and content groundwork.
- Launch the anonymous Facebook page; post 10-15 educational pieces; read comments and DMs for themes.
- Write the content style guide and safe-messaging rules.
- Draft the crisis directory (top 15-20 countries by expected audience) and verify numbers.
- Recruit a native Urdu editor and a second clinical reviewer if possible.
- Interview 8-10 people from the target group (informally, ethically, consented).
- Draft the privacy policy and disclaimers; check licensing/regulatory position.
- Create design tokens, a clickable prototype of check-in, calm and crisis flows in both languages.
- Set up the Flutter project, CI and the test harness (RTL and golden tests).

**Exit gate:** page shows demand; crisis directory verified; style guide approved; prototype tested with 5+ people with feedback incorporated.

## Phase 1 — MVP: private companion (≈ 8-10 weeks)
**Goal:** a safe, useful, offline app on Android that does the core loop well.
- Onboarding, language switch with full RTL/LTR support, app lock and discreet mode.
- Check-in (feelings, energy, tags, note), Today screen, soft suggestions.
- Journal (text) + write-and-release; thought untangler.
- Calm toolkit: paced breathing, 5-4-3-2-1, panic first-aid (visual and text guidance).
- "Too tired" small-steps mode.
- Safety plan and **Crisis screen** (offline, country-aware).
- Learn: launch set of 20 cards.
- Settings: country, text size, theme, export, delete-all.
- Encrypted local DB, no network, no analytics.
- Closed beta (20-30 testers via the page), then Play Store release with staged rollout.

**Exit gate:** crisis path passes all tests in both languages; zero critical privacy issues; beta users report it feels safe and useful; accessibility and low-end performance targets met; store approval.

## Phase 2 — Deepen and polish (≈ 8-12 weeks)
**Goal:** make daily use richer and more comforting, expand content, improve reach.
- Voice notes and voice check-in; guided audio (muscle relaxation, body scan, sleep stories) recorded in Urdu and English.
- Sleep module: wind-down builder, worry dump, calming sounds.
- Reflection: weekly colour-band view and gentle observations.
- Remote, signed **content updates** (new cards without a new app release).
- Gentle notifications (user-scheduled), home-screen widget and quick tile for one-tap check-in.
- Roman Urdu reading mode; numeral choices; more themes (low-stimulus).
- Additional languages pilot (e.g. Arabic or Hindi) to prove the pipeline.
- Opt-in feedback and aggregate, privacy-safe metrics.
- iOS build (if desired), plus accessibility audit.
- Decide the sustainability path (donations / Plus).

**Exit gate:** sustained retention among beta cohort; content update pipeline proven; audit finds no safety or privacy regressions.

## Phase 3 — Connection (≈ 3-4 months)
**Goal:** give people a safe, optional way to reach a human, without losing privacy.
- **Optional** account with end-to-end encrypted backup and multi-device restore (user-held key).
- **Anonymous Q&A with the clinician:** submit a question with no identity; answers curated and published as general education; moderation tooling.
- Guided programmes (7/14/30-day courses).
- "Bridge to help" upgraded: professional-finding resources by country and language, shareable summary for a therapist.
- Backend (minimal, region-flexible, e.g. serverless + managed DB), with a security review and a data-protection impact assessment.
- Terms of use and updated privacy policy for any online features.

**Exit gate:** security review passed; data-protection assessment complete; Q&A moderation process proven; no local-only user is forced online.

## Phase 4 — Community and professionals (≈ 4-6 months)
**Goal:** safe peer support and trusted professional pathways.
- **Moderated peer circles:** small, anonymous, topic-based, trained moderators, report/block, crisis escalation procedure, strict posting rules, no public feed.
- **Professional directory** with vetting, language and country filters; external booking/tele-referral.
- Trained volunteer or supporter programme with supervision.
- Safety operations: moderation guidelines, incident response, escalation playbook, community standards.
- Partnerships with NGOs, universities, hospitals; formal advisory board.

**Exit gate:** moderation team and escalation process in place before opening; pilot circles run safely for a defined period; legal review done.

## Phase 5 — Intelligence and scale (ongoing)
**Goal:** careful personalisation and global reach.
- **On-device AI reflection** (optional, local only): mirrors and reframes, recommends exercises, hard crisis hand-off, clinician-led evaluation set; not shipped without passing the safety evaluation.
- Personalised suggestions based on local patterns.
- Wearable integration (opt-in) and biofeedback breathing.
- 10+ languages with local clinical partners and local crisis packs.
- Research partnerships (consented, de-identified), published outcomes.
- Workplace/university programmes with aggregate-only reporting.
- Regulatory review for medical-device boundaries as capability grows.

**Exit gate (continuous):** each AI or data feature passes a documented safety and ethics review before release.

---

## 17. Phase summary

| Phase | Theme | Key deliverable | Online? |
|---|---|---|---|
| 0 | Foundations | Validated need, safety groundwork, prototype | n/a |
| 1 | MVP | Private, safe, offline Android app | No |
| 2 | Deepen | Audio, sleep, reflection, content updates, widgets | Content only |
| 3 | Connection | Optional encrypted sync, anonymous clinician Q&A | Optional |
| 4 | Community | Moderated circles, professional directory | Yes (opt-in) |
| 5 | Intelligence | On-device AI, more languages, research | Mixed |

---

## 18. Open decisions

1. **Name and identity:** keep "Umeed"? Show your name and credentials in the app, or stay anonymous like the page?
2. **Anonymity of the clinician:** a named doctor builds trust; anonymity protects you. Decide before Phase 2 content.
3. **Funding path:** self-funded v1; donation, Plus, or grant by Phase 2?
4. **Launch regions for crisis directory:** which countries first?
5. **iOS timing:** Phase 2 or later?
6. **Clinical advisory:** who else reviews content (a second clinician, a psychologist, a native-language editor)?
7. **Team:** will anyone besides you help with content, design and voice recording?

---

## 19. Immediate next steps

1. Review this document and answer the open decisions (§18).
2. Start Phase 0: launch the page, draft the crisis directory and style guide.
3. Scaffold the Flutter project in this folder (feature-first layout, ARB for en/ur, RTL golden tests, CI).
4. Build the Crisis screen and the check-in flow first. They are the heart of the app.
