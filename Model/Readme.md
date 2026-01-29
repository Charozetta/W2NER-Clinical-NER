# Pre-trained Models

This directory contains pre-trained models for clinical NER.

---

## Download Model

Download the latest model:

- **guidelines_ru_model.pt** (707 MB) - Main model file (ready-to-use: https://drive.google.com/file/d/1PMRhYRsrOosNUaAHIcYL0UxBet__BIdB/view?usp=sharing)
- **guidelines_ru.json** (1 KB) - Model configuration

### Option 1: Using Script

```bash
bash download_model.sh
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
└── guidelines_ru.json           # Model config
```

---

## File Sizes

| File | Size | Required |
|------|------|----------|
| guidelines_ru_model.pt | 707 MB |  Yes |
| guidelines_ru.json | 1 KB |  Yes |
| bert-base-multilingual-cased | 1.5 GB | Auto-downloaded |

---
