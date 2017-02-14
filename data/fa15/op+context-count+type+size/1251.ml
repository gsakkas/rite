
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (fun x  -> ((x, ((f x) = x)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,28)-(5,61)
(5,40)-(5,56)
*)

(* type error slice
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(5,21)-(5,27)
(5,21)-(5,61)
(5,28)-(5,61)
*)
