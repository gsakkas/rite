let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun f' ->
             fun a -> fun x -> x a in
     let base = __var_1__ in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a -> fun x -> __var_1__ in
     let base = 0 in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a -> fun x -> __var_1__ in
     let base = __var_1__ in
     List.fold_left f base fs)


(* -------------------------------------- *)


(* bad

let pipe fs =
  let f a x f' a x = x a in let base = 0 in List.fold_left f base fs;;

*)

(* student fix

let pipe fs =
  let f a x f' a x = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans

(3,40)-(3,41)
fun y -> y
LamG VarPatG VarG

*)
