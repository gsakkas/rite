
let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (x,trueOrFalse) -> if trueOrFalse then wwhile (f, x) else x;;

let fixpoint (f,b) =
  wwhile
    ((fun x  -> let xi = f x in (xi, (((f xi) != xi) || (f (f xi))))), b);;

*)

(* changed spans
(6,30)-(6,32)
(6,34)-(6,35)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(4,44)-(4,50)
(4,44)-(4,56)
(4,52)-(4,53)
(4,52)-(4,56)
(6,22)-(6,28)
(6,22)-(6,35)
(6,30)-(6,32)
(6,30)-(6,35)
*)
