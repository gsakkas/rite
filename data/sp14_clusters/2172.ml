
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " [["["]; List.map f l; ["]"]];;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat "; " (List.append ("[" :: (List.map f l)) ["]"]);;

*)

(* changed spans
(9,39)-(9,44)
List.append ("[" :: (List.map f
                              l)) ["]"]
AppG [ConAppG (Just EmptyG) Nothing,ListG EmptyG Nothing]

(9,40)-(9,43)
List.append
VarG

(9,40)-(9,43)
"[" :: (List.map f l)
ConAppG (Just (TupleG [LitG,AppG [VarG,VarG]])) Nothing

*)
