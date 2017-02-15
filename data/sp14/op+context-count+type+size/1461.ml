
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then f b' else b';;


(* fix

let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,53)-(3,54)
*)

(* type error slice
(3,2)-(3,65)
(3,13)-(3,14)
(3,13)-(3,16)
(3,20)-(3,65)
(3,34)-(3,38)
(3,42)-(3,65)
(3,42)-(3,65)
(3,53)-(3,54)
(3,53)-(3,57)
(3,63)-(3,65)
*)
