
let pipe fs =
  let f a x = match x with | [] -> 0 | _ -> 1 in
  let base = [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(4,44)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(4,44)
(3,9)-(3,46)
(3,11)-(3,46)
(3,15)-(3,46)
(3,36)-(3,37)
(4,3)-(4,44)
(4,14)-(4,16)
(4,20)-(4,34)
(4,20)-(4,44)
(4,35)-(4,36)
(4,37)-(4,41)
*)
