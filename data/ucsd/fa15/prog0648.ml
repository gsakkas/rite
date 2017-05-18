
let rec wwhile (f,b) =
  match (f, b) with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
