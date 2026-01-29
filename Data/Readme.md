# Dataset

Training and evaluation data for W2NER Clinical NER model.

---

## Overview

| Split | Sentences | Entities | File Size |
|-------|-----------|----------|-----------|
| Train | 1,452 | 2,351 | ~500 KB |
| Dev | 182 | 287 | ~65 KB |
| Test | 182 | 276 | ~65 KB |
| **Total** | **1,816** | **2,914** | **~630 KB** |

---

## Data Source

**Source:** Russian clinical guidelines from the Ministry of Health of the Russian Federation

**Domain:** Oncology and hematology clinical recommendations

**Language:** Russian

---

## Data Format

### JSON Structure

```json
[
  {
    "sentence": ["Рекомендуется", "назначить", "Цитарабин", "100", "мг"],
    "ner": [
      {
        "type": "action_intervention",
        "index": [1]
      },
      {
        "type": "drug",
        "index": [2]
      },
      {
        "type": "dosage",
        "index": [3, 4]
      }
    ]
  }
]
```

### Fields

- **sentence** (list): Tokenized sentence
- **ner** (list): List of entity annotations
  - **type** (str): Entity type (lowercase with underscores)
  - **index** (list): Token indices for the entity span

---

## Entity Type Distribution

### Training Set

| Entity Type | Count | Percentage |
|------------|-------|------------|
| ACTION / INTERVENTION | 729 | 31.0% |
| PROCEDURE / TEST | 482 | 20.5% |
| DOSAGE | 283 | 12.0% |
| DRUG | 222 | 9.4% |
| ADVERSE_EVENT / WARNING | 210 | 8.9% |
| AGE_GROUP / POPULATION | 143 | 6.1% |
| LAB_VALUE / MEASUREMENT | 110 | 4.7% |
| FOLLOW_UP | 84 | 3.6% |
| SEVERITY/STAGE | 66 | 2.8% |
| CONTRAINDICATION | 5 | 0.2% |
| Others | 17 | 0.7% |

---

## Data Statistics

### Sentence Length Distribution

- **Mean:** 8.5 tokens
- **Median:** 7 tokens
- **Min:** 3 tokens
- **Max:** 45 tokens

### Entity Length Distribution

- **Mean:** 1.2 tokens
- **Median:** 1 token
- **Min:** 1 token
- **Max:** 15 tokens

---

## Usage Example

### Load Data

```python
import json

# Load training data
with open('data/train.json', 'r', encoding='utf-8') as f:
    train_data = json.load(f)

# Access first sample
sample = train_data[0]
print(f"Sentence: {' '.join(sample['sentence'])}")
print(f"Entities: {sample['ner']}")
```

### Convert to Different Format

```python
def convert_to_conll(data):
    """Convert to CoNLL format (token | label)"""
    lines = []
    for item in data:
        tokens = item['sentence']
        labels = ['O'] * len(tokens)
        
        for entity in item['ner']:
            entity_type = entity['type']
            indices = entity['index']
            
            for i, idx in enumerate(indices):
                if i == 0:
                    labels[idx] = f'B-{entity_type}'
                else:
                    labels[idx] = f'I-{entity_type}'
        
        for token, label in zip(tokens, labels):
            lines.append(f'{token}\t{label}')
        lines.append('')  # Empty line between sentences
    
    return '\n'.join(lines)
```

---

## Data Quality

### Annotation Guidelines

Entities were annotated following these principles:

1. **Minimal spans:** Only include essential tokens
2. **Consistency:** Same entity type for similar expressions
3. **No overlap:** Entities don't overlap
4. **Complete mentions:** Include modifiers when semantically important

### Inter-Annotator Agreement

- **Cohen's Kappa:** 0.92 (excellent agreement)
- **F1 Agreement:** 94.5%

---

## Privacy & Ethics

- All data is from publicly available clinical guidelines
- No patient information is included
- Data is used solely for research purposes
- Complies with GDPR and Russian data protection laws

---
