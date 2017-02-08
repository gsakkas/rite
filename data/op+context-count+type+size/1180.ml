
let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | l -> (listReverse (List.tl l)) :: (List.hd l);;


(* fix

let rec listReverse l =
  let l' = [] in
  match l with | [] -> l' | h::t -> (List.hd l) :: (listReverse (List.tl l));;

*)

(* changed spans
(4,3)-(4,73)
(4,35)-(4,46)
(4,35)-(4,57)
(4,64)-(4,71)
(4,64)-(4,73)
(4,72)-(4,73)
*)

(* type error slice
(2,4)-(4,76)
(2,21)-(4,73)
(3,3)-(4,73)
(4,3)-(4,73)
(4,35)-(4,46)
(4,35)-(4,57)
(4,35)-(4,73)
(4,35)-(4,73)
*)
