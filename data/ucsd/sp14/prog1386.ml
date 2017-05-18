
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (fun x  -> if x = b then (b, false) else (((f x), true), b));;
