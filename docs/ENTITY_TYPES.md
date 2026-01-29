# 📋 Entity Types Reference

This document describes all 13 entity types that the W2NER Clinical NER model can identify.

---

## 1. DRUG

**Description:** Medications, pharmaceuticals, and active substances

**Examples:**
- Цитарабин (Cytarabine)
- Метотрексат (Methotrexate)
- Дазатиниб (Dasatinib)
- Блинатумомаб (Blinatumomab)
- Ритуксимаб (Rituximab)

**Patterns:**
- Generic drug names
- Brand names
- Active ingredients
- Drug combinations

---

## 2. ACTION / INTERVENTION

**Description:** Medical actions, procedures, and interventions

**Examples:**
- Рекомендуется (Recommended)
- Назначить (Prescribe)
- Провести (Conduct)
- Выполнить (Perform)
- Оценить (Assess)

**Patterns:**
- Imperative verbs
- Recommendations
- Clinical actions
- Treatment steps

---

## 3. ADVERSE_EVENT / WARNING

**Description:** Side effects, adverse events, and warnings

**Examples:**
- Токсичность (Toxicity)
- Нейтропения (Neutropenia)
- Тошнота (Nausea)
- Аллергическая реакция (Allergic reaction)

**Patterns:**
- Side effects
- Complications
- Risks
- Warnings

---

## 4. DOSAGE

**Description:** Drug dosages and concentrations

**Examples:**
- 100 мг/м² (100 mg/m²)
- 500 мг per os (500 mg orally)
- 2 мг/кг (2 mg/kg)

**Patterns:**
- Number + unit
- Concentration expressions
- Dose calculations

---

## 5. 🧪 PROCEDURE / TEST

**Description:** Diagnostic and therapeutic procedures

**Examples:**
- КТ (CT scan)
- МРТ (MRI)
- УЗИ (Ultrasound)
- ПЭТ (PET scan)
- Биопсия (Biopsy)

**Patterns:**
- Imaging procedures
- Laboratory tests
- Diagnostic methods
- Therapeutic procedures

---

## 6. AGE_GROUP / POPULATION

**Description:** Patient populations and age groups

**Examples:**
- Дети (Children)
- Взрослые (Adults)
- Беременные (Pregnant women)
- Пациенты старше 65 лет (Patients over 65)

**Patterns:**
- Age ranges
- Special populations
- Gender-specific groups
- Demographic categories

---

## 7. FOLLOW_UP

**Description:** Follow-up schedules and monitoring

**Examples:**
- Наблюдение (Follow-up)
- Контроль (Monitoring)
- Динамическое наблюдение (Dynamic monitoring)

**Patterns:**
- Monitoring schedules
- Follow-up visits
- Surveillance plans

---

## 8. TIME_WINDOW

**Description:** Time frames and temporal expressions

**Examples:**
- Каждые 3 месяца (Every 3 months)
- В течение 2 недель (Within 2 weeks)
- Ежедневно (Daily)

**Patterns:**
- Duration expressions
- Frequency markers
- Time intervals

---

## 9. LAB_VALUE / MEASUREMENT

**Description:** Laboratory values and clinical measurements

**Examples:**
- Уровень гемоглобина (Hemoglobin level)
- Креатинин (Creatinine)
- Лейкоциты (Leukocytes)

**Patterns:**
- Lab parameters
- Vital signs
- Clinical measurements
- Reference ranges

---

## 10. SEVERITY/STAGE

**Description:** Disease severity and staging

**Examples:**
- Стадия II (Stage II)
- Высокий риск (High risk)
- Тяжелая форма (Severe form)

**Patterns:**
- Cancer stages
- Risk categories
- Severity levels

---

## 11. CONTRAINDICATION

**Description:** Contraindications and restrictions

**Examples:**
- Не рекомендуется (Not recommended)
- Противопоказано (Contraindicated)
- Запрещено (Prohibited)

**Patterns:**
- Absolute contraindications
- Relative contraindications
- Restrictions

---

## 12. DURATION

**Description:** Treatment duration

**Examples:**
- 6 месяцев терапии (6 months of therapy)
- Курс 21 день (21-day course)

**Patterns:**
- Treatment lengths
- Cycle durations
- Therapy periods

---

## 13. FREQUENCY

**Description:** Treatment frequency

**Examples:**
- 2 раза в день (Twice daily)
- Каждые 4 часа (Every 4 hours)
- Однократно (Once)

**Patterns:**
- Dosing frequency
- Administration schedules
- Repetition patterns

---

## Entity Type Distribution (Test Data)

| Entity Type | Count | Percentage |
|------------|-------|------------|
| ACTION / INTERVENTION | 939 | 40.5% |
| ADVERSE_EVENT / WARNING | 688 | 29.7% |
| DRUG | 294 | 12.7% |
| AGE_GROUP / POPULATION | 212 | 9.2% |
| FOLLOW_UP | 122 | 5.3% |
| PROCEDURE / TEST | 28 | 1.2% |
| TIME_WINDOW | 25 | 1.1% |
| LAB_VALUE / MEASUREMENT | 7 | 0.3% |
| SEVERITY/STAGE | 1 | 0.0% |
| CONTRAINDICATION | 2 | 0.1% |
| DOSAGE | 5 | 0.2% |
| DURATION | - | - |
| FREQUENCY | - | - |

---

## Notes

- Some entity types are more common than others in clinical guidelines
- Distribution varies by document type and medical specialty
- Model may require fine-tuning for specific domains
