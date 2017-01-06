
let pipe fs =
  let f a x = match a with | [] -> [] | h::t -> h x in
  let base = 3 in List.fold_left f base fs;;



let pipe fs = let f a x = x in let base x = x in List.fold_left f base fs;;


(* changed spans
(3,15)-(3,50)
(4,14)-(4,15)
*)

(* type error slice
(4,19)-(4,43)
*)
