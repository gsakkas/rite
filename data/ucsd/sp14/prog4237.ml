
let f x = let xx = (x * x) * x in (xx, (xx < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let _ = wwhile (f, 2) should return 512;;
