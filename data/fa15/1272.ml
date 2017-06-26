
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
(3,2)-(7,44)
(3,16)-(3,18)
(7,18)-(7,36)
(7,18)-(7,44)
(7,40)-(7,44)
*)

(* type error slice
(4,2)-(7,44)
(6,16)-(6,22)
(6,17)-(6,21)
(7,18)-(7,44)
(7,40)-(7,44)
*)

(* all spans
(2,20)-(7,44)
(3,2)-(7,44)
(3,16)-(3,18)
(4,2)-(7,44)
(4,8)-(4,9)
(5,10)-(5,12)
(6,16)-(6,22)
(6,17)-(6,21)
(7,18)-(7,44)
(7,18)-(7,36)
(7,19)-(7,30)
(7,31)-(7,35)
(7,40)-(7,44)
*)
