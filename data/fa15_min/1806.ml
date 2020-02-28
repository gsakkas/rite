
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [] in
        let rest' = List.rev t in
        if List.mem h rest'
        then rest' = t
        else (let seen' = h :: seen' in helper (seen', rest')) in
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

(9,9)-(11,63)
helper (seen' , rest')
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(3,3)-(12,28)
(3,19)-(11,63)
(4,5)-(11,63)
(5,13)-(5,17)
(7,9)-(11,63)
(8,9)-(11,63)
(9,9)-(11,63)
(10,14)-(10,23)
(11,14)-(11,63)
(11,27)-(11,37)
(11,41)-(11,47)
(11,41)-(11,62)
(11,48)-(11,62)
(11,49)-(11,54)
(12,3)-(12,11)
(12,3)-(12,28)
(12,12)-(12,28)
(12,13)-(12,19)
*)
