
let rec wwhile (f,b) =
  match (f, b) with | (f',bool1) -> if bool1 then wwhile (f, f') else f';;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
