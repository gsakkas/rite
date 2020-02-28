
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h t) then true else false in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then [] :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,38)
List.mem h t
AppG [VarG,VarG]

(7,44)-(7,48)
[] :: seen
AppG [ListG [],VarG]

(7,54)-(7,59)
h :: seen
AppG [VarG,VarG]

(8,21)-(8,45)
t
VarG

*)

(* type error slice
(4,5)-(8,70)
(7,9)-(8,70)
(7,21)-(7,59)
(7,24)-(7,32)
(7,24)-(7,38)
(7,33)-(7,38)
(7,34)-(7,35)
(7,36)-(7,37)
(7,54)-(7,59)
(8,49)-(8,55)
(8,49)-(8,70)
(8,56)-(8,70)
(8,57)-(8,62)
(9,12)-(9,28)
(9,13)-(9,19)
(9,20)-(9,27)
(9,21)-(9,23)
*)
