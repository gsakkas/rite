
let pipe fs =
  let f a x = match x with | a -> (fun x  -> x) | h::t -> h in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,60)
(3,21)-(3,22)
(3,36)-(3,47)
(3,46)-(3,47)
(3,59)-(3,60)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,44)
*)

(* type error slice
(3,3)-(4,44)
(3,9)-(3,60)
(3,11)-(3,60)
(3,15)-(3,60)
(3,21)-(3,22)
(3,36)-(3,47)
(3,46)-(3,47)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
(4,37)-(4,41)
(4,42)-(4,44)
*)
