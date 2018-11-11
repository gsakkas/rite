
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          if List.mem h seen
          then helper (seen, t)
          else helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,52)-(7,63)
seen
VarG

(7,52)-(7,63)
t
VarG

(7,52)-(7,63)
helper
VarG

(7,52)-(7,63)
helper (h :: seen , t)
AppG [TupleG [EmptyG,EmptyG]]

(7,52)-(7,63)
(h :: seen , t)
TupleG [ConAppG (Just (TupleG [VarG,VarG])) Nothing,VarG]

*)
