
let rec wwhile (f,b) =
  let helper = (f, b) in
  match helper with | (x',n) -> if n = true then wwhile (f, x') else x';;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
