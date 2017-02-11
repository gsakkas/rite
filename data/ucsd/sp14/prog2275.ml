
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let rec fixpoint (f,b) = wwhile ((((fixpoint (f, (f b))) * (f b)) = b), b);;
