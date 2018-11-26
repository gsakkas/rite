
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
(7,20)-(7,21)
seen
VarG

(8,22)-(8,23)
seen'
VarG

(9,18)-(9,23)
seen
VarG

*)
