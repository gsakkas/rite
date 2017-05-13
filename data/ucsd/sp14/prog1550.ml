
let rec wwhile (f,b) =
  match (f, b) with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
