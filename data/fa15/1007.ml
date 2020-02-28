
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else (let seen' = [] @ h in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = seen @ [h] in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;

*)

(* changed spans
(10,27)-(10,29)
seen
VarG

(10,32)-(10,33)
[h]
ListG [VarG]

*)

(* type error slice
(7,17)-(7,25)
(7,17)-(7,32)
(7,26)-(7,27)
(7,28)-(7,32)
(9,14)-(9,20)
(9,14)-(9,30)
(9,21)-(9,30)
(9,22)-(9,26)
(10,14)-(10,76)
(10,27)-(10,33)
(10,30)-(10,31)
(10,32)-(10,33)
(10,54)-(10,60)
(10,54)-(10,75)
(10,61)-(10,75)
(10,62)-(10,67)
*)
