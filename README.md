# W2NER Clinical NER for Russian Medical Guidelines

Automatic extraction of medical entities from Russian clinical guidelines using W2NER (Word-Word Relation Network for Named Entity Recognition).

**Model Performance:** 95% F1-score  
**Speed:** ~5,000 sentences in 20 seconds (with GPU)

---

## Demo Results

**Processed:** 9 clinical documents (5,283 sentences)  
**Extracted:** 2,316 medical entities

| Entity Type | Count | Percentage |
|------------|-------|------------|
| ACTION / INTERVENTION | 939 | 40.5% |
| ADVERSE_EVENT / WARNING | 688 | 29.7% |
| DRUG | 294 | 12.7% |
| AGE_GROUP / POPULATION | 212 | 9.2% |
| Others | 183 | 7.9% |

---

## What It Does

The model identifies 13 types of medical entities in Russian clinical text:

- **DRUG** - Medications and pharmaceuticals
- **ACTION / INTERVENTION** - Medical procedures and actions
- **ADVERSE_EVENT / WARNING** - Side effects and warnings
- **DOSAGE** - Drug dosages
- **PROCEDURE / TEST** - Diagnostic procedures
- **AGE_GROUP / POPULATION** - Patient populations
- **FOLLOW_UP** - Follow-up schedules
- **TIME_WINDOW** - Time frames
- **LAB_VALUE / MEASUREMENT** - Laboratory values
- **SEVERITY/STAGE** - Disease severity/stages
- **CONTRAINDICATION** - Contraindications
- **DURATION** - Treatment duration
- **FREQUENCY** - Treatment frequency

---

## Quick Start (Google Colab)

### Option A: Use Pre-trained Model (2 minutes)

**For inference only - no training required**

1. **Open notebook in Colab:**
   - Use `W2NER.ipynb`

2. **Enable GPU:** 

3. **Upload files to `/content/`:**
   - `W2NER-main.zip` (configurations)
   - `guidelines_ru_model.pt` (707 MB) (please use readme.md from [Model](https://github.com/Charozetta/W2NER-Clinical-NER/tree/main/Model))
   - `w2ner_train.json` (for vocabulary)
   - Your `.md` or `.txt` files with medical text

4. **Run cells with:**
   - Setup
   - Unpack W2NER
   - Copy model
   - Build ID2LABEL
   - Load model
   - Load your texts
   - Inference
   - Extract entities
   - Statistics

5. **Download results** from `/content/W2NER-main/outputs/results.json`

---

### Option B: Train from Scratch (6 minutes)

**For training your own model**

1. **Open notebook in Colab:**
   - Use `W2NER.ipynb`

2. **Enable GPU:**

3. **Upload files to `/content/`:**
   - `W2NER-main.zip` (configurations)
   - `w2ner_train.json` (training data)
   - `w2ner_dev.json` (validation data)
   - `w2ner_test.json` (test data)

4. **Run all the cells 1-14:**
   - Cells 1-6: Setup and data preparation
   - **Cell 7: Training (~5 minutes)**
   - Cells 8-10: Save and load trained model
   - Cells 11-14: Inference on your texts

5. **Your trained model** saved as `/content/W2NER-main/models/guidelines_ru_model.pt`

---

## Installation

### Prerequisites
- Python 3.8+
- CUDA-capable GPU (recommended)
- 8GB+ RAM

### Install Dependencies

```bash
pip install torch transformers gensim tqdm prettytable
```

Or use requirements.txt:

```bash
pip install -r requirements.txt
```
---

## Dataset

### Training Data
- **Source:** Russian clinical guidelines from Ministry of Health
- **Size:** 1,452 annotated sentences
- **Entities:** 2,351 medical entities
- **Format:** JSON

### Data Format

```json
[
  {
    "sentence": ["Рекомендуется", "назначить", "Цитарабин"],
    "ner": [
      {"type": "ACTION_INTERVENTION", "index": [1]},
      {"type": "DRUG", "index": [2]}
    ]
  }
]
```
---

## Model Details

### Architecture
- **Base Model:** W2NER (Word-Word Relation Network)
- **Encoder:** bert-base-multilingual-cased
- **Grid Size:** 128x128
- **Hidden Size:** 768
- **Parameters:** ~110M

### Training
- **Epochs:** 10
- **Batch Size:** 12
- **Learning Rate:** 1e-3 (model), 1e-5 (BERT)
- **Optimizer:** AdamW
- **Hardware:** NVIDIA T4 GPU
- **Training Time:** ~5 minutes

### Performance

| Dataset | Precision | Recall | F1-Score |
|---------|-----------|--------|----------|
| Dev | 95.2% | 94.8% | 95.0% |
| Test | 94.9% | 94.5% | 94.7% |

---
### Acknowledgment

