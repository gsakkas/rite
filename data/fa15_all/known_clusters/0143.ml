LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)
let f =
  fun a ->
    fun x -> a ^ (sep ^ x) in
let base = h in
let l = t in
List.fold_left f base l
let f =
  fun a ->
    fun x -> a ^ (sep ^ x) in
let base = h in
let l = t in
List.fold_left f base l
let f =
  fun a ->
    fun x -> fun g -> f a x in
let base = fun f -> f in
List.fold_left f base fs
let f =
  fun a ->
    fun x -> fun g -> f a x in
let base = fun f -> f in
List.fold_left f base fs
