
let pipe fs =
  let f a x = match a with | _ -> x a | [] -> x in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,14)-(3,47)
(3,20)-(3,21)
(3,36)-(3,37)
(3,46)-(3,47)
(4,2)-(4,43)
(4,13)-(4,15)
(4,19)-(4,43)
*)

(* type error slice
(3,14)-(3,47)
(3,14)-(3,47)
(3,34)-(3,35)
(3,34)-(3,37)
(3,46)-(3,47)
*)
