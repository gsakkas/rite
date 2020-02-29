let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun a -> fun x -> x in
     let base = fun y -> y in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun a -> fun x -> x a in
     let base = __var_1__ in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x ->
           fun a -> fun x -> x a in
     let base = __lit__ in
     List.fold_left f base fs)


(* -------------------------------------- *)


(* bad

let pipe fs =
  let f a x a x = x a in let base y = y in List.fold_left f base fs;;

*)

(* student fix

let pipe fs = let f a x = x in let base y = y in List.fold_left f base fs;;

*)

(* changed spans

(3,13)-(3,22)
x
VarG

*)
