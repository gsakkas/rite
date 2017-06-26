
let rec wwhile (f,b) =
  match f b with | (b',true ) -> f b' | (b',false ) -> b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,2)-(3,57)
(3,33)-(3,34)
(3,33)-(3,37)
*)

(* type error slice
(3,2)-(3,57)
(3,8)-(3,9)
(3,8)-(3,11)
(3,33)-(3,34)
(3,33)-(3,37)
(3,55)-(3,57)
*)

(* all spans
(2,16)-(3,57)
(3,2)-(3,57)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,33)-(3,37)
(3,33)-(3,34)
(3,35)-(3,37)
(3,55)-(3,57)
*)
