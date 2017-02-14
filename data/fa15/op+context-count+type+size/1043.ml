
let rec listReverse l =
  let newList = [] in
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
(3,3)-(7,45)
(3,17)-(3,19)
(7,19)-(7,45)
(7,20)-(7,38)
(7,32)-(7,38)
(7,40)-(7,44)
*)

(* type error slice
(2,4)-(7,47)
(2,21)-(7,45)
(4,3)-(7,45)
(4,3)-(7,45)
(4,9)-(4,10)
(7,20)-(7,31)
(7,20)-(7,38)
(7,32)-(7,38)
(7,32)-(7,38)
(7,33)-(7,37)
*)
