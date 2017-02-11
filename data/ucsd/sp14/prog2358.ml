
let fptest x = truncate (1e6 *. (cos (1e-6 *. (float x))));;

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let _ = wwhile fptest 0;;
