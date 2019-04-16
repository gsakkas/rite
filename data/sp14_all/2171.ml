
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat "; " ["["; List.map f l; "]"];;


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
(9,39)-(9,63)
List.append ("[" :: (List.map f
                              l)) ["]"]
AppG (fromList [ConAppG (Just EmptyG),ListG (fromList [EmptyG])])

*)

(* type error slice
(9,39)-(9,63)
(9,40)-(9,43)
(9,45)-(9,53)
(9,45)-(9,57)
*)
