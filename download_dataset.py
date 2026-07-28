import kagglehub
import shutil
from pathlib import Path

# Download dataset
path = kagglehub.dataset_download("konstantinognev/sample-superstorecsv")

print("Downloaded to:", path)

# Copy CSV into project folder
source = next(Path(path).glob("*.csv"))
destination = Path("data/raw") / source.name

destination.parent.mkdir(parents=True, exist_ok=True)

shutil.copy(source, destination)

print(f"Dataset copied to: {destination}")