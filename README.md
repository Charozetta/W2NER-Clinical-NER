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

1. **Open in Colab:**
   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/YOUR_USERNAME/W2NER-Clinical-NER/blob/main/notebooks/inference_example.ipynb)

2. **Upload files to `/content/`:**
   - Download model from [Releases](https://github.com/YOUR_USERNAME/W2NER-Clinical-NER/releases)
   - Your `.md` or `.txt` files

3. **Run all cells**

### Option B: Train from Scratch (6 minutes)

1. **Open training notebook:**
   [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/YOUR_USERNAME/W2NER-Clinical-NER/blob/main/notebooks/full_pipeline.ipynb)

2. **Enable GPU:** Runtime → Change runtime type → T4 GPU

3. **Run all cells**

---

## 📦 Installation

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

## Usage

### Python API

```python
from w2ner_clinical import ClinicalNER

# Initialize model
ner = ClinicalNER(model_path="models/guidelines_ru_model.pt")

# Extract entities from text
text = "Рекомендуется назначить Цитарабин в дозе 100 мг/м²."
entities = ner.extract(text)

# Output:
# [
#   {"type": "ACTION / INTERVENTION", "text": "назначить"},
#   {"type": "DRUG", "text": "Цитарабин"},
#   {"type": "DOSAGE", "text": "100 мг/м²"}
# ]
```

### Command Line

```bash
python inference.py \
  --model models/guidelines_ru_model.pt \
  --input data/my_documents/ \
  --output results/
```

### Batch Processing

```python
from w2ner_clinical import ClinicalNER

ner = ClinicalNER(model_path="models/guidelines_ru_model.pt")

# Process multiple files
files = ["doc1.md", "doc2.txt", "doc3.md"]
results = ner.batch_process(files, batch_size=8)

# Save results
ner.save_results(results, "output.json")
```

---

## 📚 Dataset

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

### Download Dataset

```bash
# Download from Releases
wget https://github.com/YOUR_USERNAME/W2NER-Clinical-NER/releases/download/v1.0/data.zip
unzip data.zip -d data/
```

---

## 🎓 Model Details

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

## 📥 Download Pre-trained Model

### Option 1: GitHub Releases

Download from [Releases](https://github.com/YOUR_USERNAME/W2NER-Clinical-NER/releases/latest):
- `guidelines_ru_model.pt` (707 MB)
- `guidelines_ru.json` (config)

### Option 2: Script

```bash
bash models/download_model.sh
```

### Option 3: Python

```python
from w2ner_clinical import download_model
download_model(save_path="models/")
```

---

## 🔧 Advanced Usage

### Custom Entity Types

Train on your own data:

```python
from w2ner_clinical import Trainer

trainer = Trainer(
    train_data="data/my_train.json",
    dev_data="data/my_dev.json",
    epochs=10,
    batch_size=12
)

trainer.train()
trainer.save_model("models/my_model.pt")
```

### Fine-tuning

Fine-tune on domain-specific data:

```python
from w2ner_clinical import ClinicalNER, Trainer

# Load pre-trained model
ner = ClinicalNER(model_path="models/guidelines_ru_model.pt")

# Fine-tune
trainer = Trainer.from_pretrained(ner)
trainer.train(
    train_data="data/domain_specific.json",
    epochs=5,
    learning_rate=1e-4
)
```

---

## 📖 Documentation

- [Usage Guide](docs/USAGE.md) - Detailed usage instructions
- [Training Guide](docs/TRAINING.md) - How to train your own model
- [Entity Types](docs/ENTITY_TYPES.md) - Description of all entity types
- [API Reference](docs/API.md) - Complete API documentation

---

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- **W2NER Model:** Based on [ljynlp/W2NER](https://github.com/ljynlp/W2NER)
- **BERT:** [bert-base-multilingual-cased](https://huggingface.co/bert-base-multilingual-cased)
- **Dataset:** Russian clinical guidelines from Ministry of Health of the Russian Federation

---

## 📧 Contact

- **Author:** [Your Name]
- **Email:** your.email@example.com
- **GitHub:** [@YOUR_USERNAME](https://github.com/YOUR_USERNAME)

---

## 📝 Citation

If you use this work in your research, please cite:

```bibtex
@software{w2ner_clinical_ner,
  author = {Your Name},
  title = {W2NER Clinical NER for Russian Medical Guidelines},
  year = {2026},
  url = {https://github.com/YOUR_USERNAME/W2NER-Clinical-NER}
}
```

---
## ⭐ Star History

If you find this project useful, please consider giving it a star! ⭐

[![Star History Chart](https://api.star-history.com/svg?repos=YOUR_USERNAME/W2NER-Clinical-NER&type=Date)](https://star-history.com/#YOUR_USERNAME/W2NER-Clinical-NER&Date)
