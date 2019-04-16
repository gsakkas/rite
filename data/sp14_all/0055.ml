
let pipe fs =
  let f a x g b y z = match y with | [] -> z | _ -> b a in
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
(3,9)-(3,56)
(3,11)-(3,56)
(3,13)-(3,56)
(4,14)-(4,15)
(4,14)-(4,20)
(4,16)-(4,17)
(4,24)-(4,38)
(4,24)-(4,48)
(4,39)-(4,40)
*)
