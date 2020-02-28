
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest = t
        else seen' = (h :: (seen' helper (seen', rest'))) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,21)-(7,23)
h :: seen
AppG [VarG,VarG]

(8,21)-(8,31)
t
VarG

(9,9)-(11,58)
helper (seen' , rest')
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(3,3)-(12,28)
(3,19)-(11,58)
(4,5)-(11,58)
(5,13)-(5,17)
(7,9)-(11,58)
(7,21)-(7,23)
(8,9)-(11,58)
(9,9)-(11,58)
(11,14)-(11,58)
(11,28)-(11,57)
(11,29)-(11,34)
(12,12)-(12,28)
(12,13)-(12,19)
(12,20)-(12,27)
(12,21)-(12,23)
*)
