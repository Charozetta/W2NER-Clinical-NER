# Pre-trained Models

This directory contains pre-trained models for clinical NER.

---

## Download Model

### Option 1: From GitHub Releases

Download the latest model from [Model]([https://github.com/Charozetta/W2NER-Clinical-NER/Model](https://github.com/Charozetta/W2NER-Clinical-NER/tree/main/Model)):

- **guidelines_ru_model.pt** (707 MB) - Main model file
- **guidelines_ru.json** (1 KB) - Model configuration

### Option 2: Using Script

```bash
bash download_model.sh
```

### Option 3: Manual Download

```python
from huggingface_hub import hf_hub_download

# Download from Hugging Face (if uploaded there)
model_path = hf_hub_download(
    repo_id="YOUR_USERNAME/w2ner-clinical-ner",
    filename="guidelines_ru_model.pt"
)
```

---

## Model Details

### guidelines_ru_model.pt

**Size:** 707 MB  
**Architecture:** W2NER + BERT  
**Training Data:** 1,452 Russian clinical guideline sentences  
**Performance:** 95% F1-score  

**Entity Types:** 13 medical entity types  
**Language:** Russian  
**Domain:** Clinical guidelines  

**Training:**
- Epochs: 10
- Batch Size: 12
- Learning Rate: 1e-3 (model), 1e-5 (BERT)
- Optimizer: AdamW
- Training Time: ~5 minutes on T4 GPU

**Evaluation:**
- Dev F1: 95.0%
- Test F1: 94.7%

---

## Model Files

```
models/
├── README.md                    # This file
├── download_model.sh            # Download script
├── guidelines_ru_model.pt       # Model weights
└── guidelines_ru.json           # Model config
```

---

## Usage

```python
from w2ner_clinical import ClinicalNER

# Load model
ner = ClinicalNER(model_path="models/guidelines_ru_model.pt")

# Extract entities
text = "Рекомендуется назначить Цитарабин 100 мг/м²"
entities = ner.extract(text)
```

---

## Hosting Options

### GitHub Releases (Current)
- **Pros:** Free, integrated with repo
- **Cons:** 2GB file size limit per file
- **URL:** `https://github.com/YOUR_USERNAME/W2NER-Clinical-NER/releases/download/v1.0/guidelines_ru_model.pt`

### Hugging Face Hub (Recommended for >2GB)
- **Pros:** Unlimited size, CDN, versioning
- **Cons:** Separate platform
- **URL:** `https://huggingface.co/YOUR_USERNAME/w2ner-clinical-ner`

### Google Drive
- **Pros:** Easy sharing
- **Cons:** Download limits, no versioning
- **URL:** `https://drive.google.com/file/d/YOUR_FILE_ID`

---

## File Sizes

| File | Size | Required |
|------|------|----------|
| guidelines_ru_model.pt | 707 MB |  Yes |
| guidelines_ru.json | 1 KB |  Yes |
| bert-base-multilingual-cased | 1.5 GB | Auto-downloaded |

---

## Checksums

Verify downloaded files:

```bash
# MD5
md5sum guidelines_ru_model.pt
# Expected: [TO BE ADDED]

# SHA256
sha256sum guidelines_ru_model.pt
# Expected: [TO BE ADDED]
```
