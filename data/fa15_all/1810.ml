
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let rest' = List.rev t in
        let seen' = seen in
        if (List.mem h rest') = false then seen' helper (seen', rest') in
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
(7,9)-(9,71)
let seen' = h :: seen in
let rest' = t in
helper (seen' , rest')
LetG NonRec [(VarPatG,AppG [EmptyG,EmptyG])] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(4,5)-(9,71)
(5,13)-(5,17)
(7,9)-(9,71)
(8,9)-(9,71)
(8,21)-(8,25)
(9,9)-(9,71)
(9,44)-(9,49)
(9,44)-(9,71)
(9,57)-(9,71)
(9,58)-(9,63)
(9,71)-(9,71)
*)
