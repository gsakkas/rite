
let pipe fs =
  let f a x = let g b y n = match n with | [] -> n | _ -> y b in g a x in
  let base = f 0 [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(4,48)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(4,48)
(3,9)-(3,71)
(3,11)-(3,71)
(3,15)-(3,71)
(3,21)-(3,62)
(3,23)-(3,62)
(3,25)-(3,62)
(3,59)-(3,60)
(3,59)-(3,62)
(3,66)-(3,67)
(3,66)-(3,71)
(3,70)-(3,71)
(4,14)-(4,15)
(4,14)-(4,20)
(4,16)-(4,17)
(4,18)-(4,20)
(4,24)-(4,38)
(4,24)-(4,48)
(4,39)-(4,40)
*)
