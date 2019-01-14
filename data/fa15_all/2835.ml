
let pipe fs =
  let f a x x = x a in let base f = f fs in List.fold_left f base fs;;


(* fix

let f a x x a = a x;;

let pipe fs =
  let f a x g = f a x in let base f = f in List.fold_left f base fs;;

*)

(* changed spans
(3,16)-(3,17)
a
VarG

(3,16)-(3,19)
fun a -> a x
LamG (AppG (fromList [EmptyG]))

(3,18)-(3,19)
f
VarG

(3,18)-(3,19)
fun fs ->
  (let f =
     fun a ->
       fun x -> fun g -> f a x in
   let base = fun f -> f in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,18)-(3,19)
fun a ->
  fun x -> fun g -> f a x
LamG (LamG EmptyG)

(3,18)-(3,19)
fun x -> fun g -> f a x
LamG (LamG EmptyG)

(3,18)-(3,19)
fun g -> f a x
LamG (AppG (fromList [EmptyG]))

(3,18)-(3,19)
f a x
AppG (fromList [VarG])

(3,18)-(3,19)
let f =
  fun a ->
    fun x -> fun g -> f a x in
let base = fun f -> f in
List.fold_left f base fs
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(3,23)-(3,68)
x
VarG

*)
