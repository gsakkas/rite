
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  if b = 0 then 0 else if b > 1 then b - 1 else b + (1 wwhile (f, res));;
