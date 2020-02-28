
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h @ seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,55)-(7,56)
[h]
ListG [VarG]

(7,63)-(7,63)
seen
VarG

*)

(* type error slice
(7,24)-(7,41)
(7,25)-(7,33)
(7,34)-(7,35)
(7,36)-(7,40)
(7,55)-(7,56)
(7,55)-(7,63)
(7,57)-(7,58)
(7,59)-(7,63)
*)
