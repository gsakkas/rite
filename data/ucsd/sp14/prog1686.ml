
let rec wwhile (f,b) =
  match f with | (num,b00l) -> if b00l then num else wwhile (f, num);;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
