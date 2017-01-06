
let pipe fs =
  let f a x = match a with | [] -> x | h::t -> h x in
  let base = 0 in List.fold_left f base fs;;



let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;


(* changed spans
(3,15)-(3,35)
(3,38)-(3,51)
(4,14)-(4,15)
*)

(* type error slice
(4,19)-(4,43)
*)
