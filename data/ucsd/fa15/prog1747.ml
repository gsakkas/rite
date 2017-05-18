
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) =
  let helper b = let fb = f b in if fb = b then (true, fb) else (false, fb) in
  wwhile (helper, b);;

let _ = fixpoint (collatz, 3);;
