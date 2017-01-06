
let pipe fs =
  let f a x = match a with | [] -> x | _ -> x a in
  let base = [] in List.fold_left f base fs;;



let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,15)-(3,35)
(3,38)-(3,46)
(4,14)-(4,16)
*)

(* type error slice
(3,15)-(3,48)
(3,45)-(3,48)
*)
