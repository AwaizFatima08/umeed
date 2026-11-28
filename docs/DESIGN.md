# Umeed (امید) — Design Document

**Working name:** Umeed (امید, "hope"). Rename freely; nothing in the plan depends on it.
**Status:** v0.2 draft for clinician review (scope reset: structured app, no AI agent)
**Owner:** Homi (clinical lead and product owner)
**Platforms:** Android first (Flutter); iOS and web later
**Languages:** Urdu (اردو) and English at launch; more languages added through content, not code

### What changed from v0.1
- **No AI agent.** The app is a structured, clinician-authored tool. A *scripted conversation* gives it a conversational feel without unscripted replies. AI is parked (see §15).
- **New core:** guided understanding of what the user is going through (validated screening, shown as *signals*, never as diagnoses), then a personal programme to cope with it.
- **Wider condition coverage**, organised by what the app can safely help with versus what it should only recognise and refer (§4).
- **New module: Path to Help.** A purpose-built flow that finds and softens the user's barriers to seeing a doctor and prepares them for the first step (§7).
- **Leaner first release**, with all other work sequenced in phases (§16).

---

## 1. Vision

A private, bilingual companion for people carrying stress, anxiety, low mood and negative thinking who can't or won't talk to anyone. It helps them **understand what they're going through, practise coping skills that build balance, and, when it's right, take the first step toward a doctor.**

> Umeed doesn't ask you to talk. It helps you understand, practise, and when you're ready, reach out.

It is a **self-help and signposting tool**. It is not therapy, not a diagnosis, and not an emergency service.

### 1.1 The aim, stated carefully
The goal is **balance and recovery**, not forced positivity. Telling a stressed person to "think positive" backfires. The programme validates first, helps the person notice unhelpful patterns, builds practical skills, and only then strengthens the positive side (gratitude, self-compassion, strengths, values).

### 1.2 Personas

| Persona | Situation | What they need |
|---|---|---|
| **Ayesha, 24** | Burnt out, ashamed to tell family, awake at 3 a.m. | Private space, understanding of what's happening, sleep help |
| **Bilal, 35** | Working abroad, lonely, "must stay strong" | Short tools, a name for what he feels, a nudge toward help |
| **Sara, 29** | New mother, numb, no energy | Tiny steps, no guilt, a way to tell someone |
| **Omar, 41** | Anxious, introverted, can't open up | Writing outlet, a clear path to a doctor without having to explain himself |
| **Someone in crisis** | Dark thoughts tonight | Immediate, offline route to help |

### 1.3 Non-goals
- Diagnosing, or saying "you have X".
- Replacing a clinician or giving individual treatment or medication advice.
- Open social feeds, public posting, likes.
- Ads, data selling, streak guilt, pressure notifications.
- An AI chatbot (parked; §15).

---

## 2. Design principles

1. **Lowest possible effort.** Core actions work with almost no energy.
2. **Understand, then act.** People engage more when they feel understood. Screening and plain-language reflection come before techniques.
3. **Signals, not labels.** Results suggest what to do next; they never name a disorder.
4. **Private by default.** Everything stays on the device; no account in the first versions.
5. **Safety is always one tap away**, offline, in both languages.
6. **Honest about limits.** The app says what it is and isn't, and knows when to hand over.
7. **Warm, not clinical.** "Feeling heavy", not "symptoms".
8. **Evidence-informed.** Methods from CBT, behavioural activation, ACT, positive psychology, motivational interviewing, grounding and paced breathing, reviewed by the clinical lead.
9. **Bilingual as a first-class constraint.**
10. **Modular so it can grow.**

---

## 3. Safety and ethics framework

This outranks every feature.

### 3.1 Crisis support
- A persistent **"I need help now"** control on every screen.
- **Crisis screen**, fully offline: a calm line, helpline by chosen country, emergency number, the user's safety plan, a 60-second grounding exercise, and a pre-written "text someone I trust" message.
- **Screening safeguard:** any positive answer to a self-harm item (e.g. PHQ-9 item 9) opens the Crisis screen immediately, whatever the total score.
- **Decision (29 Nov 2026): no helpline directory or numbers in V1.** The crisis screen shows "call your local emergency number", the HomiLabs support email only (Facebook and YouTube not linked in V1), and grounding. Revisit once numbers can be verified per country (Umang's site was down and sources conflicted).
- **Helpline directory (deferred past V1):** bundled offline, per country, versioned, verified by the clinical lead before every release. The user chooses a country (no location permission). If none is known, show a pointer to a global directory and "call local emergency services". Start with a small verified set and grow it.
- No unreliable phrase-detection in free text: it misses cases and gives false reassurance. The always-visible button is the honest design.

### 3.2 Scope and disclaimers
- First run and About state plainly: *self-help and guidance, not medical advice, not an emergency service*.
- No diagnosis, no medication guidance, no severity labels like "moderate depression". Results speak in everyday terms ("a lot of stress", "worry that's hard to switch off").

### 3.3 Screening safety rules
- Use **validated instruments only**; verify each one's licence and its validated Urdu version before use (§6).
- Show results as **signals with a next step**, never a bare score.
- Three outcomes only: **self-help track**, **talk to someone soon**, **urgent support**.
- Every result screen offers Path to Help and the Crisis route.
- Any instrument or threshold change goes through clinical review and is versioned.

### 3.4 Content governance
- Each card, exercise and script has an author, a clinical reviewer, a review date and a version.
- A **content style guide** covers tone, banned phrases and safe messaging on self-harm.
- Urdu content is written natively and reviewed by a native speaker, not machine-translated.

### 3.5 Vulnerable users
- No dark patterns. Notifications off by default, user-scheduled, gentle, nothing sensitive on the lock screen.
- **Discreet mode:** neutral app name and icon plus PIN or biometric lock, for shared or monitored phones.
- Age 13+ declared at first run; the under-18 experience is reviewed separately.

### 3.6 Clinician obligations
Because the app carries a clinician's name:
- Check licensing and advertising rules in your registering body and in countries you invite users from.
- Frame all content as general education; no individual treatment relationship is formed.
- Keep a record of clinical review for every release.
- Check whether screening features trigger medical-device rules in target markets (§11).

---

## 4. Condition coverage: what the app helps with, and what it only recognises

Not every condition suits self-help. The app is organised in three tiers.

### Tier A — Self-help programmes (the app guides practice)
Common, stress-related, and responsive to skills-based self-help:
1. **Everyday stress and overload** (work, study, money, family)
2. **Burnout and exhaustion**
3. **Worry and generalised anxiety**
4. **Negative thinking patterns** (self-criticism, catastrophising, rumination)
5. **Low mood and low energy** (mild, with firm referral signals)
6. **Sleep trouble linked to stress**

### Tier B — Self-help plus a stronger nudge to talk to someone
Helpful skills exist, but professional input is encouraged:
7. **Panic and sudden anxiety**
8. **Social anxiety and shyness**
9. **Grief and loss**
10. **Anger and irritability**
11. **Loneliness and isolation**
12. **Perfectionism and self-worth**
13. **Relationship and family stress**
14. **Health worry**

### Tier C — Recognise and refer (no self-help programme)
The app may notice signals and **guides straight to Path to Help**; it does not try to treat these:
15. **Trauma-related distress** (flashbacks, nightmares, being on edge after a frightening event)
16. **OCD-type patterns**
17. **Mood swings with very high energy periods** (possible bipolar signs)
18. **Hearing or seeing things others don't, or strong unusual beliefs**
19. **Eating-related distress**
20. **Heavy alcohol or substance use as a way to cope**
21. **Self-harm or suicidal thoughts** (always the Crisis screen)

Tiers are a **clinical decision**; Homi finalises the list and the referral thresholds. The tier structure lets the product say "all common stress-related conditions" honestly without pretending to treat conditions it should not.

---

## 5. The user journey

```
UNDERSTAND  → Guided, scripted conversation (feels like talking, runs on branching flows)
              Optional short screens → plain-language "what this seems to be about"
CHOOSE      → Personal programme(s) from Tier A/B, or Path to Help if signals say so
PRACTISE    → One 5–10 minute practice a day
TRACK       → Mood notes and a gentle re-check every 2–4 weeks, shown as progress
BRIDGE      → Path to Help when it is right, at the user's pace
(always)    → Help-now button
```

### 5.1 The scripted conversation
A chat-style interface where the app asks, reflects and offers choices, following flows you author. It uses preset answers plus optional free text that the app stores but does not interpret. Benefits: feels personal, stays predictable, is easy to review clinically, works offline, and costs nothing to run.

### 5.2 Understanding step
1. **Opening check-in:** how are you, what's been hardest lately (pick from a list), how long.
2. **Targeted short screens** chosen from those answers (not a long questionnaire up front).
3. **Reflection:** "It sounds like you've been under a lot of pressure for a while, and your sleep and mood are feeling it." Always followed by "that's more common than you'd think" and a next step.
4. **Choice:** "Would you like to start with…?" (never forced).

### 5.3 Practice step (programmes)
Each Tier A/B topic is a **2–4 week programme**: a short daily practice, a weekly reflection and a re-check. Each daily practice is one of:
- Breathing, grounding, muscle relaxation
- **Thought untangler** (the user picks a thinking trap from a list, then writes a kinder alternative; the app never labels the user's thoughts)
- Behavioural activation (schedule one small doable thing)
- Worry time and worry dump
- Three good things, self-compassion, strengths and values (introduced once steady)
- Sleep wind-down routine
- Short education card

### 5.4 Progress
Re-check every 2–4 weeks with the same short screens; show direction ("a bit lighter than three weeks ago"), never a grade. If scores are not improving or worsen, the app gently raises Path to Help.

---

## 6. Screening and signals

### 6.1 Candidate instruments (all subject to licence and Urdu-validation checks)

| Area | Candidate | Note |
|---|---|---|
| Low mood | PHQ-9 | Item 9 triggers Crisis |
| Anxiety | GAD-7 | |
| Stress | PSS-10 | Verify licence |
| Wellbeing | WHO-5 | |
| Sleep | ISI | Verify licence |
| Burnout | Copenhagen Burnout Inventory | Free to use |
| Panic | PDSS-SR or similar | Tier B |
| Social anxiety | Mini-SPIN or SPIN | Tier B |
| Trauma signals | PC-PTSD-5 (short) | Tier C; refer only |
| Alcohol use | AUDIT-C | Tier C; refer only |
| Bipolar signals | MDQ (short) | Tier C; refer only |

Where a validated Urdu version does not exist, use a clinically reviewed translation and **say so**, flagging it for future validation. Do not present such a result with the same confidence as a validated one.

### 6.2 Output design
- Plain language, no jargon, no numbers by default (an "advanced" view can show them).
- One of three outcomes: **self-help track · talk to someone soon · urgent support**.
- Short, kind reasoning ("You marked that worry has been hard to switch off most days.").
- Always: the next step, Path to Help, and the Crisis route.
- Result history is stored locally and can be exported for a doctor (§7).

### 6.3 Thresholds
Set by the clinical lead from instrument manuals, documented in a single versioned file and covered by unit tests so changes cannot ship unreviewed.

---

## 7. Path to Help: breaking the barriers to seeing a doctor

Many users know they should see someone and don't. The goal is to **lower the step, not push**.

### 7.1 Barrier discovery (motivational-interviewing style, scripted)
"What makes it hard to talk to a doctor?" (multi-select, no judgement):
- *I don't think it's serious enough.* · *People will judge me / stigma.*
- *My family mustn't know.* · *I can't afford it.*
- *I don't know who to see or where to start.* · *I'm scared they'll put me on medication.*
- *I'm afraid of what they'll say.* · *I don't have the time.*
- *I don't know how to explain it.* · *I've tried before and it didn't help.*
- *I don't trust doctors.* · *Language or cultural comfort.*

### 7.2 A tailored response to each barrier
Short, honest, clinician-written reframes, for example:
- **"Not serious enough"** → "You don't have to be in crisis to deserve support. Many people go when things are still manageable, and it's easier then."
- **Stigma / family** → "What you say to a doctor is confidential. You decide who knows." Plus discreet options.
- **Cost** → low-cost and free options by country (helplines, public clinics, sliding-scale services, text or online options). Starts with what the app can verify.
- **Medication fear** → "Seeing a doctor doesn't mean being put on medication. Talking and skills-based therapy are often the first step; you stay part of every decision."
- **Don't know how to explain** → the prepare-a-summary tool below.
- **Tried before** → "A first experience that didn't fit is common. It's okay to try a different person or approach."

### 7.3 Ladder of first steps
Offer the **smallest step that fits the person**, from lowest to highest commitment:
1. Save "when I'm ready" and see what happens at a first visit (no commitment).
2. Call or text a helpline to talk anonymously.
3. Anonymous question to the clinician (Phase 4).
4. Read what to expect at a first appointment.
5. Prepare a summary (below).
6. Find a professional (directory, Phase 5).
7. Book, with a prompt to bring someone if they want.

### 7.4 Prepare-for-the-visit kit
- **One-page summary** auto-built from what the user has chosen to include (screen results, what's been hardest, how long, sleep, mood patterns, what they've tried). The user previews and edits it, and can print, share or just read from it.
- **"What to say" script**: opening lines for someone who struggles to start.
- **Questions to ask** the doctor.
- **What to expect**: how long, what's asked, what happens next, what confidentiality means.
- **Bring a friend** option: a short message to send a trusted person.

### 7.5 Follow-through
A gentle, optional check-in a few days later ("How did it go?" or "Still thinking? That's okay"). No guilt, no nagging. If the user went, the app helps them note what to follow up on.

---

## 8. Features summary

| Pillar | What it gives | Release |
|---|---|---|
| Scripted conversation | Warm, guided check-in and reflection | 1 |
| Screening and signals | Validated short screens, plain-language results | 1 |
| Programmes | 2–4 week Tier A/B tracks with daily practice | 1 (first three), then grows |
| Calm toolkit | Breathing, grounding, relaxation, panic first-aid | 1 |
| Journal and release | Private writing, write-and-release | 1 |
| Thought untangler | Notice a thinking trap, find a kinder thought | 1 |
| Safety plan and Crisis screen | Always available, offline | 1 |
| Path to Help | Barrier flow, ladder, visit kit | 1 (core), grows |
| Learn | Short kind education cards | 1 (small set) |
| Progress and re-check | Gentle direction over time | 2 |
| Sleep module | Wind-down, worry dump, sounds | 2 |
| Voice notes and guided audio | In both languages | 2 |
| Notifications, widgets | Optional | 2 |
| Optional encrypted sync | User-held key | 4 |
| Anonymous Q&A with the clinician | General education answers | 4 |
| Professional directory | Vetted, by language and country | 5 |
| Moderated circles | Small, topic-based | 5 |

---

## 9. Information architecture

```
Bottom nav
├─ Today       Continue programme · today's practice · quick check-in · soft suggestions
├─ Understand  Guided conversation · screens · my results over time
├─ Practise    Programmes · Calm toolkit · Thought untangler · Journal and release
├─ Help        Path to Help · prepare-for-visit kit · helplines · safety plan
└─ Me          Progress · Learn (saved cards) · Settings · Privacy · About

Always present: [ Help now ] → Crisis screen
```

---

## 10. Bilingual design (Urdu + English)

- **Layout:** Urdu is RTL; English is LTR. Use directional-aware widgets throughout. Mirror navigation and progress; not media controls or the breathing circle. Test mixed-direction text.
- **Typography:** Nastaliq (Noto Nastaliq Urdu) for long reading with generous line height; a clear Naskh/Arabic sans for buttons, labels and small UI; a humane sans for English. A text-size control; fonts bundled.
- **Language:** all strings in ARB files; Urdu written natively, warm and simple (آپ register), reviewed by a native speaker. Avoid gendered phrasing where possible.
- **Roman Urdu:** free-text input accepts any script and never "corrects" it. A Roman Urdu reading mode comes in Phase 2.
- **Numerals:** Western or Arabic-Indic, by user choice. Hijri dates optional later.
- **Screening and translation:** screening items need validated or clinically reviewed Urdu; flag any that aren't.
- **Future languages:** adding one means content + fonts + ARB + a native clinical review + local crisis resources. The language list is data-driven.

---

## 11. Privacy and compliance (no geographic limits)

- **Data minimisation:** the first versions collect nothing off the device.
- **Screening results are health data.** Store them encrypted on the device; exports are user-initiated.
- **When data leaves the device (Phase 4+):** explicit opt-in, end-to-end encrypted, purpose-limited, deletable.
- **Stores:** Google Play health-apps declaration and mental-health policy; Apple's equivalent for iOS. Use "self-help and guidance", not "treatment" or "diagnosis".
- **Medical-device boundary:** screening and "identify your condition" claims can trigger device regulation in some regions (FDA, EU MDR, others). Mitigations: wording as signals and signposting, no diagnostic claim, no treatment claim, regulatory check at every phase gate.
- **Clinician obligations:** see §3.6.

---

## 12. Technical architecture (summary)

**Stack:** Flutter (Dart 3), Riverpod 3, go_router, Drift on SQLite with SQLCipher (key in Android Keystore via secure storage), local_auth, flutter_localizations with ARB, just_audio, flutter_local_notifications. Typed `Result<T, Failure>` errors. No analytics or ad SDKs.

**Layers:** `app/`, `core/`, `features/<feature>/{data,domain,presentation}`, `content/`, `services/`.

**Content and flows as data:** conversation scripts, programmes, screens, thresholds and cards live in **versioned, validated content files** (JSON/Markdown with a schema), not in code. This lets Homi review them, lets new languages and programmes be added without code changes, and enables signed over-the-air content updates in Phase 2.

**Flow engine:** a small, tested interpreter for the scripted conversation (nodes, branches, conditions on earlier answers, screening scoring, outcome rules). Thresholds are unit-tested against fixed vectors so any change is visible in review.

**Data (local):** `screen_result`, `checkin`, `journal_entry`, `practice_session`, `programme_progress`, `barrier_selection`, `visit_summary`, `safety_plan`, `settings`, `content_progress`. No user id exists in v1.

**Security:** SQLCipher at rest; app lock with timeout; `FLAG_SECURE` on sensitive screens; opt-in, content-scrubbed crash reports only.

**Quality:** unit tests on the flow engine and scoring; golden tests in both languages and directions; accessibility tests; a crisis-path integration test that must pass before every release; performance budget (cold start under 2 s on a 3 GB RAM phone).

---

## 13. Content strategy

- **Condition-by-condition content plan** matching §4, built in waves (§16).
- **Pipeline:** draft (Homi) → native Urdu editor → safe-messaging check → clinical sign-off → versioned in repo → ships in a content pack.
- **Each programme includes:** an introduction card, 2–4 weeks of daily practices, a weekly reflection, a re-check and a "when to talk to someone" card.
- **Reuse:** each card doubles as a Facebook or Instagram post; the page builds trust and shows which topics matter.
- **Path to Help content:** one reframe per barrier, per-country low-cost options, the first-visit guide and the summary template.

---

## 14. Sustainability

- Core, safety and Path to Help are free forever. No ads, no data sales.
- Options later: voluntary support, optional low-cost "Plus" (extra audio programmes, encrypted backup), grants and NGO or university partnerships, workplace programmes with aggregate-only consented reporting.
- Decide in Phase 2; v1 is self-funded.

---

## 15. Future prospects and parked ideas

| Prospect | Notes |
|---|---|
| More Tier B programmes and languages | Content plus clinical review, no code |
| iOS and web | Same codebase |
| Encrypted backup, multi-device | User-held key, optional |
| Anonymous Q&A with the clinician | Published as general education |
| Professional directory and tele-referral | Vetted, by language and country |
| Moderated peer circles | Small, topic-based, trained moderators, never an open feed |
| Guided audio and voice-first use | Both languages |
| Wearable and sensor input (opt-in) | Biofeedback breathing, sleep import, on-device |
| Clinician export | User-controlled summary for their therapist |
| Research partnerships | Opt-in, de-identified, with ethics approval |
| Faith- and culture-sensitive modules | Opt-in |
| **AI features (parked)** | **Not planned.** Revisit only after Phase 4, as a separate project with its own clinical safety evaluation, privacy review and regulatory check. |

**Hooks built in from the start:** content as data, a no-op analytics port, repository interfaces, a signed content-pack format, and feature flags.

---

## 16. Phased roadmap

Each phase has a **goal, scope and exit gate**. Durations are rough for a solo, part-time founder. Content is the real constraint, not code. Phases 4 and 5 are intentions, not commitments.

### Phase 0 — Foundations (about 4 weeks)
**Goal:** settle the clinical frame and prepare what the build depends on.
- Finalise the condition tiers and referral thresholds (§4).
- Choose instruments; confirm licences and Urdu validation status (§6).
- Write the content style guide and safe-messaging rules.
- Verify a **starter crisis directory** (a small set of countries) plus a global pointer.
- Draft the Path to Help barrier list and the first reframes.
- Recruit a native Urdu editor; ideally a second clinical reviewer.
- Launch the anonymous Facebook page and post the first cards to test demand.
- Clickable prototype of the guided conversation, results screen, Crisis and Path to Help in both languages; test with 5–8 people.
- Regulatory and licensing check (§3.6, §11).
- Project scaffold, CI, and the RTL and golden-test harness.

**Exit gate:** thresholds and tiers signed off; instruments cleared; crisis starter set verified; prototype tested and revised.

### Phase 1 — MVP: Understand, Practise, Reach out (about 10–12 weeks)
**Goal:** the full loop for the first three programmes, on Android, offline.
- Onboarding, language and RTL, app lock and discreet mode.
- Scripted conversation engine and results screens.
- Screens: PSS-10, GAD-7, PHQ-9, WHO-5 (sleep and others added in Phase 2). PHQ-9 item 9 → Crisis.
- Programmes: **Everyday stress and burnout, Worry and anxiety, Negative thinking patterns**. Low mood is *screened and routed to Path to Help with small-steps support*, with a full programme in Phase 2.
- Calm toolkit, thought untangler, journal and write-and-release, safety plan and Crisis screen.
- **Path to Help:** barrier discovery, tailored reframes, ladder, visit-summary kit.
- 10 Learn cards, export and delete-all.
- Closed beta (20–30 people from the page), then staged Play Store release.

**Exit gate:** crisis path and scoring pass tests in both languages; beta users report feeling understood and safe; at least some users take a step on the Path to Help ladder; accessibility and low-end performance met; store approval.

### Phase 2 — Deepen and broaden (about 3 months)
**Goal:** more conditions, richer practice, better follow-through.
- Programmes: **Low mood, Sleep, Panic**, then **Social anxiety**.
- Re-check and progress view; gentle follow-up after Path to Help steps.
- Voice notes and guided audio in both languages; sleep module.
- Signed over-the-air content updates.
- Optional notifications, widget, quick check-in tile; Roman Urdu reading mode.
- A second language pilot to prove the pipeline.
- Opt-in, aggregate, privacy-safe metrics; iOS build if wanted; sustainability decision.

**Exit gate:** retention and use look healthy in the beta cohort; content update pipeline proven; clinical review of every new programme complete.

### Phase 3 — Remaining Tier B and Tier C recognition (about 3 months)
**Goal:** reach the rest of the common stress-related conditions safely.
- Tier B programmes: grief, anger, loneliness, perfectionism, relationship and family stress, health worry.
- **Tier C recognition and referral flows** (trauma, OCD-type patterns, bipolar signs, unusual experiences, eating, substance use): short signal checks that go straight to Path to Help, with no self-help programme.
- Expanded crisis directory and per-country low-cost options.
- Content review in both languages.

**Exit gate:** every Tier C route tested; clinical sign-off that no programme overreaches; legal review of wording.

### Phase 4 — Connection (intention)
- Optional account with end-to-end encrypted backup.
- Anonymous Q&A with the clinician; moderation tooling.
- "Share a summary with my therapist" export.
- Security review and a data-protection impact assessment before any online feature.

### Phase 5 — Community and professionals (intention)
- Vetted professional directory and tele-referral.
- Small moderated circles with trained moderators, an escalation process and community standards, opened only when that team exists.

### Phase summary

| Phase | Theme | Key result | Online |
|---|---|---|---|
| 0 | Foundations | Clinical frame, instruments, prototype | n/a |
| 1 | MVP | Understand → practise → reach out, first 3 programmes | No |
| 2 | Deepen | Low mood, sleep, panic, audio, progress | Content only |
| 3 | Breadth | Remaining Tier B, Tier C recognition | Content only |
| 4 | Connection | Optional sync, anonymous Q&A | Optional |
| 5 | Community | Directory, moderated circles | Opt-in |

---

## 17. Success measures (privacy-respecting)

All aggregate and opt-in; never tied to identity.
- Share of installs completing the first conversation and a first result
- Share of users who open Path to Help, pick a barrier, and take any ladder step
- Programme completion and week-4 retention (as a signal, not a target)
- Direction of re-check results over time
- "Did this help right now?" after an exercise
- Crisis-screen opens and helpline tap-through (counts only)
- Qualitative feedback

Avoid time-in-app as a goal. Success is feeling understood, a bit better, and more able to reach out.

---

## 18. Risks and mitigations

| Risk | Mitigation |
|---|---|
| Someone in crisis relies on the app | Always-visible Crisis route, offline helplines, item-9 safeguard, clear scope statements |
| Screening read as diagnosis | "Signals" wording, no labels, regulatory check each phase |
| Unvalidated Urdu instruments | Use validated versions where they exist, flag the rest, plan validation |
| Wrong or stale helpline numbers | Clinical verification each release, dated and versioned directory |
| Overreach on complex conditions | Tier C is recognise-and-refer only; clinical sign-off on every programme |
| Harmful or tone-deaf content | Style guide, two-person review, native editing |
| Privacy on a shared phone | App lock, discreet mode, no lock-screen text, `FLAG_SECURE` |
| Content workload | Phased conditions, content as data, reuse across page and app |
| Clinician liability or licensing | Check rules, general-education framing, review records |
| Founder burnout | Small first release, phases as intentions, shared review where possible |

---

## 19. Open decisions

1. **Final tier assignments and referral thresholds** (Homi's clinical call).
2. **Instruments:** confirm licences and Urdu validation status for each (§6.1).
3. **Name and identity:** keep "Umeed"? Appear by name and credentials, or stay anonymous like the page?
4. **Starter countries** for the crisis directory and low-cost options.
5. **Clinical advisory:** who else reviews content (a second clinician, a psychologist, a native Urdu editor)?
6. **Time and team:** weekly hours, and whether anyone helps with content, design and voice.
7. **Funding path** after Phase 2.

---

## 20. Immediate next steps

1. Review this v0.2 and answer the open decisions (§19).
2. Start Phase 0: tiers and thresholds, instrument licences, style guide, starter crisis directory.
3. Draft the first conversation script and the barrier-reframe set; these drive the prototype.
4. Scaffold the Flutter project: feature-first layout, ARB for en/ur, RTL golden tests, the flow-engine skeleton with scoring tests.
