
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if not (List.mem seen h)
        then let seen' = h :: rest in let rest' = t in helper (seen', rest') in
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
(7,9)-(8,77)
(7,16)-(7,33)
(7,17)-(7,25)
(7,26)-(7,30)
(7,31)-(7,32)
(8,14)-(8,77)
(8,26)-(8,27)
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
