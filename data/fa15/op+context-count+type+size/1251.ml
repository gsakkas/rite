
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (fun x  -> ((x, ((f x) = x)), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,30)-(5,60)
(5,42)-(5,55)
*)

(* type error slice
(3,51)-(3,57)
(3,51)-(3,63)
(3,59)-(3,63)
(5,22)-(5,28)
(5,22)-(5,60)
(5,30)-(5,60)
*)
