from __future__ import annotations
import argparse, json, random
from pathlib import Path
def main() -> int:
    ap=argparse.ArgumentParser(); ap.add_argument("--dataset",default="Training/dataset")
    ap.add_argument("--seed",type=int,default=29031); ap.add_argument("--train",type=float,default=.70)
    ap.add_argument("--validation",type=float,default=.15); a=ap.parse_args()
    root=Path(a.dataset); items=sorted((root/"annotations").glob("*.json")); random.Random(a.seed).shuffle(items)
    n=len(items); x=int(n*a.train); y=x+int(n*a.validation)
    data={"seed":a.seed,"train":[p.name for p in items[:x]],"validation":[p.name for p in items[x:y]],"test":[p.name for p in items[y:]]}
    (root/"split.json").write_text(json.dumps(data,indent=2),encoding="utf-8"); print(data); return 0
if __name__=="__main__": raise SystemExit(main())
