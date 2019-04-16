
let pipe fs =
  let f a x a x =
    match x with | (x',y) -> (match x' with | [] -> y | _ -> x' a) in
  let base = f 0 [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(5,48)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(5,48)
(3,9)-(4,67)
(3,11)-(4,67)
(3,13)-(4,67)
(4,30)-(4,67)
(4,37)-(4,39)
(4,62)-(4,64)
(4,62)-(4,66)
(5,14)-(5,15)
(5,14)-(5,20)
(5,16)-(5,17)
(5,24)-(5,38)
(5,24)-(5,48)
(5,39)-(5,40)
*)
