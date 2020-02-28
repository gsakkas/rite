
let pipe fs =
  let f a x a x n = x a in let base = 0 in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g b y n = match n with | [] -> n | _ -> y b in
  let base = f 0 [] in List.fold_left f base fs;;

*)

(* changed spans
(3,13)-(3,24)
fun g ->
  fun b ->
    fun y ->
      fun n ->
        match n with
        | [] -> n
        | _ -> y b
LamG VarPatG (LamG EmptyPatG EmptyG)

(3,39)-(3,40)
f 0 []
AppG [LitG,ListG []]

*)

(* type error slice
(3,3)-(3,68)
(3,9)-(3,24)
(3,11)-(3,24)
(3,13)-(3,24)
(3,28)-(3,68)
(3,39)-(3,40)
(3,44)-(3,58)
(3,44)-(3,68)
(3,59)-(3,60)
(3,61)-(3,65)
*)
