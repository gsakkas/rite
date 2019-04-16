
let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (h curr) tl in
  iter (fun y  -> y) fs;;


(* fix

let id y = y;;

let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (fun x  -> h (acc x)) tl in
  iter id fs;;

*)

(* changed spans
(4,49)-(4,57)
fun x -> h (acc x)
LamG VarPatG (AppG (fromList [EmptyG]))

(5,8)-(5,21)
id
VarG

*)

(* type error slice
(4,5)-(4,60)
(4,11)-(4,15)
(4,49)-(4,57)
(4,50)-(4,51)
(4,52)-(4,56)
*)
