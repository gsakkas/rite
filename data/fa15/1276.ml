
let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse [tail]) @ [head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(6,31)-(6,37)
*)

(* type error slice
(2,3)-(6,49)
(2,20)-(6,47)
(3,2)-(6,47)
(3,8)-(3,9)
(6,18)-(6,38)
(6,19)-(6,30)
(6,31)-(6,37)
(6,32)-(6,36)
*)

(* all spans
(2,20)-(6,47)
(3,2)-(6,47)
(3,8)-(3,9)
(4,10)-(4,12)
(5,16)-(5,22)
(5,17)-(5,21)
(6,18)-(6,47)
(6,39)-(6,40)
(6,18)-(6,38)
(6,19)-(6,30)
(6,31)-(6,37)
(6,32)-(6,36)
(6,41)-(6,47)
(6,42)-(6,46)
*)
