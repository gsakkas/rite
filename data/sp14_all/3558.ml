
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
(7,53)-(7,64)
seen
VarG

(7,68)-(7,68)
helper (h :: seen , t)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(9,28)
(3,19)-(8,63)
(4,5)-(8,63)
(5,13)-(5,17)
(7,9)-(8,63)
(7,21)-(7,68)
(7,45)-(7,51)
(7,45)-(7,68)
(7,52)-(7,68)
(7,53)-(7,64)
(7,68)-(7,68)
(8,21)-(8,27)
(8,21)-(8,38)
(8,28)-(8,38)
(8,29)-(8,34)
(8,42)-(8,48)
(8,42)-(8,63)
(8,49)-(8,63)
(8,50)-(8,55)
(9,3)-(9,11)
(9,3)-(9,28)
(9,12)-(9,28)
(9,13)-(9,19)
*)
