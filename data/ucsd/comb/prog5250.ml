
let rec wwhile (f,b) =
  let i = b in
  match f i with | (v_n,false ) -> v_n | (v_n,true ) -> wwhile (f, v_n);;

let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) = wwhile (f, b);;

let _ = fixpoint (collatz, 48);;
