
let x l = List.map string_of_int;;

let pipe fs =
  let f a x x = x a in let base f = f x in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(5,16)-(5,17)
a
VarG

(5,16)-(5,19)
fun a -> a x
LamG (AppG (fromList [EmptyG]))

(5,18)-(5,19)
f
VarG

(5,18)-(5,19)
fun fs ->
  (let f =
     fun a ->
       fun x -> fun g -> f a x in
   let base = fun f -> f in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,18)-(5,19)
fun a ->
  fun x -> fun g -> f a x
LamG (LamG EmptyG)

(5,18)-(5,19)
fun x -> fun g -> f a x
LamG (LamG EmptyG)

(5,18)-(5,19)
fun g -> f a x
LamG (AppG (fromList [EmptyG]))

(5,18)-(5,19)
f a x
AppG (fromList [VarG])

(5,18)-(5,19)
let f =
  fun a ->
    fun x -> fun g -> f a x in
let base = fun f -> f in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(5,23)-(5,67)
x
VarG

*)
