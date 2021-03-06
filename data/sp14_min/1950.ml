
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if List.mem h seen
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
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
(7,9)-(8,77)
let seen' = h :: seen in
let rest' = t in
helper (seen' , rest')
LetG NonRec [(VarPatG,AppG [EmptyG,EmptyG])] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(3,3)-(9,28)
(3,19)-(8,77)
(4,5)-(8,77)
(5,13)-(5,17)
(7,9)-(8,77)
(7,12)-(7,20)
(7,12)-(7,27)
(7,23)-(7,27)
(8,14)-(8,77)
(8,26)-(8,35)
(8,39)-(8,77)
(8,56)-(8,62)
(8,56)-(8,77)
(8,63)-(8,77)
(8,64)-(8,69)
(8,77)-(8,77)
(9,3)-(9,11)
(9,3)-(9,28)
(9,12)-(9,28)
(9,13)-(9,19)
*)
