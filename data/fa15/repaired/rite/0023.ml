let sqsum =
  fun xs ->
    (let f =
       fun a -> fun x -> a + x in
     let base = 0 in
     List.fold_left f base xs)


(* -------------------------------------- *)

let sqsum =
  fun xs ->
    (let f =
       fun a ->
         fun x -> a + (x * x) in
     let base = 0 in
     List.fold_left f base xs)


(* -------------------------------------- *)

let sqsum =
  fun xs ->
    (let f =
       fun a ->
         fun x -> a + (x * a) in
     let base = 0 in
     List.fold_left f base xs)


(* -------------------------------------- *)


(* bad

let sqsum xs =
  let f a x = a + (x ** 2) in let base = 0 in List.fold_left f base xs;;

*)

(* student fix

let sqsum xs =
  let f a x = a + (x * x) in let base = 0 in List.fold_left f base xs;;

*)

(* changed spans

(3,19)-(3,27)
x * x
BopG VarG VarG

*)
