
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else h in
      List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = x ^ a in
      let base = if (List.length t) <> 0 then "" else sep in
      let l = if (List.length t) <> 0 then t else [h] in
      List.fold_left f base l;;

*)

(* changed spans
(8,51)-(8,52)
[h]
ListG (fromList [VarG])

*)

(* type error slice
(3,3)-(9,30)
(8,15)-(8,52)
(8,44)-(8,45)
(8,51)-(8,52)
*)
