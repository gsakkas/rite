
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in
        if (List.mem h r) = false
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(9,9)-(10,77)
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [(VarPatG,VarG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(11,28)
(3,19)-(10,77)
(4,5)-(10,77)
(5,13)-(5,17)
(7,9)-(10,77)
(8,9)-(10,77)
(8,21)-(8,30)
(8,26)-(8,30)
(9,9)-(10,77)
(10,14)-(10,77)
(10,26)-(10,35)
(10,39)-(10,77)
(10,56)-(10,62)
(10,56)-(10,77)
(10,63)-(10,77)
(10,64)-(10,69)
(10,77)-(10,77)
(11,3)-(11,11)
(11,3)-(11,28)
(11,12)-(11,28)
(11,13)-(11,19)
*)
