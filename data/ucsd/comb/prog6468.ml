
let rec wwhile (f,b) =
  let x = f b in
  let h::t = x in
  let r::l = t in match r with | false  -> h | true  -> wwhile (f, h);;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
