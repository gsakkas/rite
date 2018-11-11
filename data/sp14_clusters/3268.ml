
let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = List.map sepConcat f l;;


(* fix

let t x = x + 1;;

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = let nl = List.map f l in sepConcat "" nl;;

*)

(* changed spans
(11,23)-(11,31)
List.map f l
AppG [VarG,VarG]

(11,23)-(11,45)
let nl = List.map f l in
sepConcat "" nl
LetG NonRec [AppG [EmptyG,EmptyG]] (AppG [EmptyG,EmptyG])

*)
