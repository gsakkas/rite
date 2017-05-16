
let rec wwhile (f,b) =
  let x = wwhile (f, b) in
  let h::t = x in
  let r::l = t in match r with | false  -> h | true  -> wwhile (f, h);;
