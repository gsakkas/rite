
let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | l -> (listReverse (List.tl l)) :: (List.hd l);;


(* fix

let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | h::t -> (List.hd l) :: (listReverse (List.tl l));;

*)

(* changed spans
(4,2)-(4,73)
(4,33)-(4,58)
(4,34)-(4,45)
(4,62)-(4,73)
(4,63)-(4,70)
(4,71)-(4,72)
*)

(* type error slice
(2,3)-(4,75)
(2,20)-(4,73)
(3,2)-(4,73)
(4,2)-(4,73)
(4,33)-(4,58)
(4,33)-(4,73)
(4,33)-(4,73)
(4,34)-(4,45)
*)
