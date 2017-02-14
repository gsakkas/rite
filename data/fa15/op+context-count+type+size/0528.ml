
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (fun x  -> (f, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (3 < 4))), b);;

*)

(* changed spans
(5,28)-(5,46)
(5,40)-(5,41)
*)

(* type error slice
(3,49)-(3,55)
(3,49)-(3,62)
(3,56)-(3,62)
(5,21)-(5,27)
(5,21)-(5,46)
(5,28)-(5,46)
*)
