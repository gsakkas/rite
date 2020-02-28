
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        if List.mem h l
        then h :: seen'
        else (let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen in
        if List.mem h seen'
        then h :: seen
        else (let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,21)-(7,22)
seen
VarG

(8,23)-(8,24)
seen'
VarG

(9,19)-(9,24)
seen
VarG

*)

(* type error slice
(7,9)-(10,54)
(7,21)-(7,22)
(9,14)-(9,15)
(9,14)-(9,24)
(9,19)-(9,24)
*)
