let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun f' ->
             fun x -> fun a -> x a in
     let base = __lit__ in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun f' ->
             fun x -> fun a -> x a in
     let base = __var_1__ in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun f' ->
             fun x -> fun a -> x a in
     let base =
       fun __var_1__ -> __var_1__ in
     List.fold_left f base fs)


(* -------------------------------------- *)


(* bad

let pipe fs =
  let f a x f' x a = x a in let base = 0 in List.fold_left f base fs;;

*)

(* student fix

let pipe fs =
  let f a x f' a x = x a in let base y = y in List.fold_left f base fs;;

*)

(* changed spans

(3,16)-(3,25)
fun a -> fun x -> x a
LamG VarPatG (LamG EmptyPatG EmptyG)

(3,40)-(3,41)
fun y -> y
LamG VarPatG VarG

*)
