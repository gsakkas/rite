
let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat ";" (List.map f (List.map (fun f  -> "[" :: f :: "]") l));;


(* fix

let sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l =
  sepConcat ";" (List.map f (List.map (fun f  -> "[" :: f) l));;

*)

(* changed spans
(10,57)-(10,65)
f
VarG

*)

(* type error slice
(10,57)-(10,65)
(10,62)-(10,65)
*)
