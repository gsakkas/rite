
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let rec fixpoint (f,b) = wwhile (f, ((f b) = b), b);;
