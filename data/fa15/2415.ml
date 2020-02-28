
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem seen h with | true  -> seen | false  -> h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem h seen with | true  -> seen | false  -> h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,26)-(8,30)
h
VarG

(8,31)-(8,32)
seen
VarG

*)

(* type error slice
(8,17)-(8,25)
(8,17)-(8,32)
(8,26)-(8,30)
(8,31)-(8,32)
(8,66)-(8,67)
(8,66)-(8,75)
(8,71)-(8,75)
*)
