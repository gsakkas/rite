
let pipe fs =
  let f a x = match x with | a -> (fun x  -> x) | h::t -> h in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,59)
(3,20)-(3,21)
(3,34)-(3,47)
(3,45)-(3,46)
(3,58)-(3,59)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,43)
*)

(* type error slice
(3,2)-(4,43)
(3,8)-(3,59)
(3,10)-(3,59)
(3,14)-(3,59)
(3,34)-(3,47)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,33)
(4,19)-(4,43)
(4,34)-(4,35)
(4,36)-(4,40)
*)
