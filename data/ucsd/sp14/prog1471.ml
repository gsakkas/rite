
let rec wwhile (f,b) =
  match b with
  | (express,boo) -> if boo = true then wwhile (express, b) else express;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
