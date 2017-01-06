
let pipe fs =
  let f a x = match x with | a -> (fun x  -> x) | h::t -> h in
  let base = [] in List.fold_left f base fs;;



let pipe fs =
  let f a x i = x (a i) in let base y = y in List.fold_left f base fs;;


(* changed spans
(3,15)-(3,20)
(3,23)-(3,34)
(3,36)-(3,47)
(3,49)-(3,60)
(4,14)-(4,16)
*)

(* type error slice
(4,20)-(4,44)
*)
