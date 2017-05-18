
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, (((f b) = (f (b - 1))) && ((f b) = b))), b);;
