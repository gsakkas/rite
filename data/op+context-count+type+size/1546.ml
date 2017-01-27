
let pipe fs =
  let f a x = match x with | [] -> a | _ -> x a in
  let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(4,43)
(3,15)-(3,48)
(3,21)-(3,22)
(3,36)-(3,37)
(4,14)-(4,15)
*)

(* type error slice
(3,15)-(3,48)
(3,21)-(3,22)
*)
