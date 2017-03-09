
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

(* all spans
(2,16)-(4,63)
(3,2)-(4,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(4,23)-(4,63)
(4,26)-(4,37)
(4,43)-(4,56)
(4,43)-(4,49)
(4,50)-(4,56)
(4,51)-(4,52)
(4,54)-(4,55)
(4,62)-(4,63)
(6,14)-(6,35)
(6,21)-(6,35)
(6,21)-(6,27)
(6,28)-(6,35)
(6,29)-(6,31)
(6,33)-(6,34)
*)
