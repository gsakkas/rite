
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        if List.mem h r
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,9)-(9,77)
let seen' = seen in
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [(VarPatG,VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(10,28)
(3,19)-(9,77)
(4,5)-(9,77)
(5,13)-(5,17)
(7,9)-(9,77)
(8,9)-(9,77)
(9,14)-(9,77)
(9,26)-(9,35)
(9,31)-(9,35)
(9,39)-(9,77)
(9,56)-(9,62)
(9,56)-(9,77)
(9,77)-(9,77)
(10,3)-(10,11)
(10,3)-(10,28)
(10,12)-(10,28)
(10,13)-(10,19)
*)
