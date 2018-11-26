
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let x = List.map (f l) in sepConcat ";" x;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let x = List.map f l in sepConcat ";" x;;

*)

(* changed spans
(9,31)-(9,45)
List.map f l
AppG (fromList [VarG])

*)
