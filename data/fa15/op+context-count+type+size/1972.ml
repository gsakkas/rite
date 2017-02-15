
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun b  -> (((f b), ((f b) != b)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) != b))), b);;

*)

(* changed spans
(5,28)-(5,66)
(5,40)-(5,61)
*)

(* type error slice
(3,41)-(3,47)
(3,41)-(3,55)
(3,48)-(3,55)
(5,21)-(5,27)
(5,21)-(5,66)
(5,28)-(5,66)
*)
