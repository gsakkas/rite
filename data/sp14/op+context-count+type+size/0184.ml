
let pipe fs =
  let f a x = match a with | _ -> x a | [] -> x in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;

*)

(* changed spans
(3,15)-(3,48)
(3,21)-(3,22)
(3,37)-(3,38)
(3,47)-(3,48)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,44)
*)

(* type error slice
(3,15)-(3,48)
(3,15)-(3,48)
(3,35)-(3,36)
(3,35)-(3,38)
(3,47)-(3,48)
*)
