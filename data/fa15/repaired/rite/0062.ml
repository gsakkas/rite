let pipe =
  fun fs ->
    (let f =
       fun a -> fun x -> x in
     let base = fun b -> b in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a -> fun x -> a in
     let base = fun b -> b in
     List.fold_left f base fs)


(* -------------------------------------- *)

let pipe =
  fun fs ->
    (let f =
       fun a ->
         fun x -> fun __var_1__ -> x in
     let base = fun b -> b in
     List.fold_left f base fs)


(* -------------------------------------- *)


(* bad

let pipe fs = let f a x = a x in let base b = b in List.fold_left f base fs;;

*)

(* student fix

let pipe fs = let f a x = a in let base b = b in List.fold_left f base fs;;

*)

(* changed spans

(2,27)-(2,30)
a
VarG

*)
