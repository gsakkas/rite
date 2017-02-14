
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) :: head;;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(3,3)-(7,45)
(3,17)-(3,19)
(7,20)-(7,36)
(7,20)-(7,45)
(7,41)-(7,45)
*)

(* type error slice
(4,3)-(7,45)
(4,3)-(7,45)
(4,3)-(7,45)
(4,3)-(7,45)
(4,3)-(7,45)
(4,3)-(7,45)
(6,17)-(6,23)
(6,17)-(6,23)
(6,18)-(6,22)
(7,20)-(7,45)
(7,20)-(7,45)
(7,41)-(7,45)
*)
