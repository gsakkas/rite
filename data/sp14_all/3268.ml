
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
(11,24)-(11,46)
let nl = List.map f l in
sepConcat "" nl
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(11,24)-(11,32)
(11,24)-(11,46)
*)
