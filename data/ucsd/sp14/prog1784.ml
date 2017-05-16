
let collatz n =
  match n with | 1 -> 1 | _ when (n mod 2) = 0 -> n / 2 | _ -> (3 * n) + 1;;

let fixpoint (f,b) =
  let rec helper (f,b) =
    let b' = f b in if b' = b then b' else helper (f, b') in
  helper (f, b);;

let _ = fixpoint (collatz, (93 rew001));;
