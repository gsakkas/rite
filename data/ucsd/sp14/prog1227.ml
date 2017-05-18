
let rec wwhile (f,b) =
  match (f, b) with | (b',y) -> if y = false then b' else wwhile (f, b');;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
