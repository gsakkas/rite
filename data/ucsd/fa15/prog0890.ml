
let intboolf f x = ((f x), ((f x) < 1));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (intboolf, b);;
