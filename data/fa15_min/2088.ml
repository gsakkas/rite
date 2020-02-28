
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let rec clone x n = sepConcat ";" clone ((x n) - 1);;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(9,21)-(9,52)
if n = 0
then []
else x :: (clone x (n - 1))
IteG (BopG EmptyG EmptyG) (ListG []) (AppG [EmptyG,EmptyG])

*)

(* type error slice
(2,4)-(7,61)
(2,19)-(7,59)
(2,23)-(7,59)
(3,3)-(7,59)
(4,11)-(4,13)
(9,21)-(9,30)
(9,21)-(9,52)
*)
