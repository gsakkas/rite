
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) =
  wwhile ((let func (output,result) = ((f b), ((f b) = b)) in func), b);;

let _ = fixpoint (collatz, 1);;
