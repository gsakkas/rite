
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let y x = List.map f l in sepConcat "[" y;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let fix l x = List.map f l in sepConcat "[" l;;

*)

(* changed spans
(9,23)-(9,64)
let fix =
  fun l ->
    fun x -> List.map f l in
sepConcat "[" l
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(9,29)-(9,45)
fun l -> fun x -> List.map f l
LamG (LamG EmptyG)

(9,63)-(9,64)
l
VarG

*)
