
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let _ =
  let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile ((f 3), 2);;
