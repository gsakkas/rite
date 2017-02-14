
let rec listReverse l =
  let newList = [] in
  match l with
  | [] -> newList
  | head::tail -> (listReverse tail) :: newList :: head;;


(* fix

let rec listReverse l =
  match l with
  | [] -> []
  | head::[] -> [head]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(3,3)-(6,56)
(3,17)-(3,19)
(4,3)-(6,56)
(5,11)-(5,18)
(6,20)-(6,36)
(6,20)-(6,56)
(6,41)-(6,48)
(6,41)-(6,56)
*)

(* type error slice
(4,3)-(6,56)
(4,3)-(6,56)
(5,11)-(5,18)
(6,20)-(6,56)
(6,20)-(6,56)
(6,41)-(6,48)
(6,41)-(6,56)
(6,41)-(6,56)
*)
