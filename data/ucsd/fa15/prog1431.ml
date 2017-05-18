
let rec wwhile (f,b) =
  if not (f b) then b else (let (b',c) = f b in wwhile (f, b'));;
