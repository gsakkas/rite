
let rec wwhile (f,b) =
  let met = f b in
  match met with | (i,j) -> if j = false then i else wwhile (f, j);;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
