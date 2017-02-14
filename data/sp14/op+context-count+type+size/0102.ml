
let pipe fs =
  let f a x = match a with | [] -> x | h::t -> h x in
  let base = failwith "to be implemented" in List.fold_left f base fs;;


(* fix

let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,69)
(3,14)-(3,50)
(3,20)-(3,21)
(3,47)-(3,48)
(3,47)-(3,50)
(3,49)-(3,50)
(4,2)-(4,69)
(4,13)-(4,21)
(4,13)-(4,41)
(4,22)-(4,41)
*)

(* type error slice
(3,2)-(4,69)
(3,8)-(3,50)
(3,10)-(3,50)
(3,14)-(3,50)
(3,14)-(3,50)
(3,14)-(3,50)
(3,20)-(3,21)
(3,47)-(3,48)
(3,47)-(3,50)
(4,45)-(4,59)
(4,45)-(4,69)
(4,60)-(4,61)
*)
