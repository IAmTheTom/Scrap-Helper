from __future__ import annotations
import argparse, json
from pathlib import Path

def labels(path: Path) -> set[str]:
    data=json.loads(path.read_text(encoding="utf-8"))
    return {x for family in data["families"] for x in family["labels"]}

def main() -> int:
    ap=argparse.ArgumentParser()
    ap.add_argument("--dataset", default="Training/dataset")
    ap.add_argument("--taxonomy", default="Flutter/assets/training/scrap_taxonomy.json")
    a=ap.parse_args(); root=Path(a.dataset); allowed=labels(Path(a.taxonomy))
    errors=[]; count=0
    for ann in sorted((root/"annotations").glob("*.json")):
        count+=1
        try:
            data=json.loads(ann.read_text(encoding="utf-8"))
            if not (root/"images"/data["image"]).exists(): errors.append(f"{ann}: missing image")
            for i,obj in enumerate(data.get("objects", [])):
                if obj.get("label") not in allowed: errors.append(f"{ann}: object {i} unknown label")
                box=obj.get("bbox",[])
                if len(box)!=4 or any(not isinstance(v,(int,float)) or not 0<=v<=1 for v in box):
                    errors.append(f"{ann}: object {i} invalid bbox")
        except Exception as exc: errors.append(f"{ann}: {exc}")
    print(f"Annotations checked: {count}")
    if errors: print("\n".join(errors)); return 1
    print("Dataset validation passed."); return 0
if __name__=="__main__": raise SystemExit(main())
