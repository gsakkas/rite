
let rec wwhile (f,b) =
  let (b',c') = f b in if !c' then b' else wwhile (f, b');;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
