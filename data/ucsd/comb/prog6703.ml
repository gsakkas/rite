
let rec wwhile (f,b) =
  let (b',c') = b in
  match c' with | true  -> wwhile (f, (b', c')) | false  -> b';;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
