
let rec listReverse l =
  match l with
  | _ -> []
  | x -> [x]
  | head::tail -> (listReverse tail) :: head;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::t::s -> head :: tail :: t :: s;;

*)

(* changed spans
(2,20)-(6,44)
(3,2)-(6,44)
(6,18)-(6,36)
(6,19)-(6,30)
(6,31)-(6,35)
*)

(* type error slice
(3,2)-(6,44)
(3,2)-(6,44)
(3,2)-(6,44)
(3,2)-(6,44)
(3,2)-(6,44)
(5,9)-(5,12)
(5,9)-(5,12)
(5,10)-(5,11)
(6,18)-(6,44)
(6,18)-(6,44)
(6,40)-(6,44)
*)
