from __future__ import annotations
import argparse, hashlib, json, shutil
from pathlib import Path
def main() -> int:
    ap=argparse.ArgumentParser()
    for x in ["model","labels","output","name","version"]: ap.add_argument(f"--{x}",required=True)
    ap.add_argument("--taxonomy-version",default="1.0.0"); ap.add_argument("--width",type=int,default=320)
    ap.add_argument("--height",type=int,default=320); ap.add_argument("--kind",choices=["classification","object_detection"],default="object_detection")
    a=ap.parse_args(); model=Path(a.model); labels=Path(a.labels); out=Path(a.output)
    out.mkdir(parents=True,exist_ok=True); shutil.copy2(model,out/model.name); shutil.copy2(labels,out/labels.name)
    digest=hashlib.sha256((out/model.name).read_bytes()).hexdigest()
    m={"model_name":a.name,"model_version":a.version,"taxonomy_version":a.taxonomy_version,"runtime":"tflite",
       "model_file":model.name,"model_sha256":digest,"minimum_app_version":"0.9.1",
       "input":{"width":a.width,"height":a.height,"channels":3,"data_type":"uint8","normalization":"none"},
       "output":{"kind":a.kind,"label_file":labels.name,"maximum_detections":20}}
    (out/"manifest.json").write_text(json.dumps(m,indent=2),encoding="utf-8"); print(out.resolve()); return 0
if __name__=="__main__": raise SystemExit(main())
