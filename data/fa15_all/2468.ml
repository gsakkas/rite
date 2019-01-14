
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (sepConcat ";" (List.map f l)) [("[", "]")];;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat (sepConcat ";" (List.map f l)) ["["; "]"];;

*)

(* changed spans
(9,65)-(9,75)
["[" ; "]"]
ListG LitG Nothing

*)
