
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        if List.mem h r
        then
          let seen' = h :: seen in
          let seen' = seen in let rest' = t in helper (seen', rest') in
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
(8,9)-(11,69)
let seen' = seen in
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [(VarPatG,VarG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(12,28)
(3,19)-(11,69)
(4,5)-(11,69)
(5,13)-(5,17)
(7,9)-(11,69)
(8,9)-(11,69)
(10,11)-(11,69)
(10,23)-(10,32)
(10,28)-(10,32)
(11,11)-(11,69)
(11,31)-(11,69)
(11,48)-(11,54)
(11,48)-(11,69)
(11,69)-(11,69)
(12,3)-(12,11)
(12,3)-(12,28)
(12,12)-(12,28)
(12,13)-(12,19)
*)
