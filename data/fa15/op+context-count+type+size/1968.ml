
let rec wwhile (f,b) = match f b with | (b',c') -> if c' then f b' else b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,62)-(2,63)
*)

(* type error slice
(2,23)-(2,74)
(2,29)-(2,30)
(2,29)-(2,32)
(2,51)-(2,74)
(2,51)-(2,74)
(2,62)-(2,63)
(2,62)-(2,66)
(2,72)-(2,74)
*)
