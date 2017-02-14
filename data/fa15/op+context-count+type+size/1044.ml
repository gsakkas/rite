
let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> [listReverse [tail]; head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(6,18)-(6,44)
(6,19)-(6,37)
(6,31)-(6,37)
(6,39)-(6,43)
*)

(* type error slice
(2,3)-(6,46)
(2,20)-(6,44)
(3,2)-(6,44)
(3,2)-(6,44)
(3,8)-(3,9)
(6,19)-(6,30)
(6,19)-(6,37)
(6,31)-(6,37)
(6,31)-(6,37)
(6,32)-(6,36)
*)
