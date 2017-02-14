
let pipe fs =
  let f a x = match a with | [] -> x | h::t -> h x in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,42)
(3,14)-(3,50)
(3,20)-(3,21)
(3,47)-(3,48)
(3,47)-(3,50)
(3,49)-(3,50)
(4,2)-(4,42)
(4,13)-(4,14)
*)

(* type error slice
(3,2)-(4,42)
(3,8)-(3,50)
(3,10)-(3,50)
(3,14)-(3,50)
(3,14)-(3,50)
(3,14)-(3,50)
(3,20)-(3,21)
(3,47)-(3,48)
(3,47)-(3,50)
(4,18)-(4,32)
(4,18)-(4,42)
(4,33)-(4,34)
*)
