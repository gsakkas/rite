
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen in
        let rest' = List.rev t in
        if (List.mem h rest') = false
        then let seen' = h :: seen' in helper (seen', rest') in
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
(7,21)-(7,25)
h :: seen
AppG [VarG,VarG]

(8,21)-(8,31)
t
VarG

(9,9)-(10,61)
helper (seen' , rest')
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(3,3)-(11,28)
(3,19)-(10,61)
(4,5)-(10,61)
(5,13)-(5,17)
(7,9)-(10,61)
(7,21)-(7,25)
(8,9)-(10,61)
(9,9)-(10,61)
(10,14)-(10,61)
(10,26)-(10,36)
(10,31)-(10,36)
(10,40)-(10,46)
(10,40)-(10,61)
(10,47)-(10,61)
(10,48)-(10,53)
(10,61)-(10,61)
(11,3)-(11,11)
(11,3)-(11,28)
(11,12)-(11,28)
(11,13)-(11,19)
*)
