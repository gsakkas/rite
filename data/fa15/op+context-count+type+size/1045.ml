
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
(3,2)-(6,55)
(3,16)-(3,18)
(4,2)-(6,55)
(5,10)-(5,17)
(6,18)-(6,36)
(6,18)-(6,55)
(6,40)-(6,47)
(6,40)-(6,55)
*)

(* type error slice
(4,2)-(6,55)
(4,2)-(6,55)
(5,10)-(5,17)
(6,18)-(6,55)
(6,18)-(6,55)
(6,40)-(6,47)
(6,40)-(6,55)
(6,40)-(6,55)
*)
