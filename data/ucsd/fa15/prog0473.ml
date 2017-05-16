
let rec wwhile (f,b) =
  match (f, b) with | (f,(h1,h2)) -> if h2 then f h1 else h1;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
