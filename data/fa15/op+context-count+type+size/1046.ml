
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> [listReverse tail; head];;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(3,2)-(7,42)
(3,16)-(3,18)
(7,18)-(7,42)
(7,19)-(7,35)
(7,37)-(7,41)
*)

(* type error slice
(2,3)-(7,44)
(2,20)-(7,42)
(3,2)-(7,42)
(4,2)-(7,42)
(4,2)-(7,42)
(4,2)-(7,42)
(4,2)-(7,42)
(4,2)-(7,42)
(4,8)-(4,9)
(6,16)-(6,22)
(6,16)-(6,22)
(6,17)-(6,21)
(7,18)-(7,42)
(7,18)-(7,42)
(7,19)-(7,30)
(7,19)-(7,35)
(7,31)-(7,35)
(7,37)-(7,41)
*)
