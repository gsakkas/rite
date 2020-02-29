let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun a -> fun x -> a x in
     let base = __lit__ in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun a -> fun x -> a x in
     let base = __var_1__ in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun a -> fun x -> a x in
     let base =
       fun __var_1__ -> __var_1__ in
     List.fold_left f base fs)


(* -------------------------------------- *)


(* bad

let pipe fs = let f a x a x = a x in let base = 0 in List.fold_left f base fs;;

*)

(* student fix

let pipe fs =
  let f a x a x = a x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans

(2,49)-(2,50)
fun y -> y
LamG VarPatG VarG

*)
