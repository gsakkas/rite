
let rec wwhile (f,b) =
  match b with | (f',b') -> if b' then wwhile (f, f') else f';;


(* fix

let rec wwhile (f,b) =
  match f b with | (f',x') -> if x' then wwhile (f, f') else f';;

*)

(* changed spans
(3,2)-(3,61)
(3,8)-(3,9)
(3,31)-(3,33)
*)

(* type error slice
(2,3)-(3,63)
(2,16)-(3,61)
(3,2)-(3,61)
(3,8)-(3,9)
(3,39)-(3,45)
(3,39)-(3,53)
(3,46)-(3,53)
(3,50)-(3,52)
*)
