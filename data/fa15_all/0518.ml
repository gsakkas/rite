
let sqsum xs = List.fold_right (fun x  -> fun n  -> n * n) 0;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans
(2,16)-(2,61)
let f =
  fun a ->
    fun x -> a + (x * x) in
let base = 0 in
List.fold_left f base xs
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,16)-(2,31)
(2,16)-(2,61)
(2,60)-(2,61)
*)
