let pipe =
  fun fs ->
    (let f =
       fun a -> fun x -> __var_1__ in
     let base = fun b -> b in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe = fun fs -> __var_1__


(* -------------------------------------- *)


(* bad

let pipe fs = let f a x = a x in let base b = b in List.fold_left f base fs;;

*)

(* student fix

let pipe fs =
  let f a x x a = x a in let base b = b in List.fold_left f base fs;;

*)

(* changed spans

(2,27)-(2,30)
fun x -> fun a -> x a
LamG VarPatG (LamG EmptyPatG EmptyG)

*)
