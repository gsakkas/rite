
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
(6,29)-(6,31)
(6,33)-(6,34)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(6,21)-(6,27)
(6,21)-(6,35)
(6,28)-(6,35)
(6,29)-(6,31)
*)
