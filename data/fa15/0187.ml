
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = true then seen else seen @ h in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = true then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,71)-(7,72)
[h]
ListG [VarG]

*)

(* type error slice
(7,24)-(7,41)
(7,25)-(7,33)
(7,34)-(7,35)
(7,36)-(7,40)
(7,64)-(7,68)
(7,64)-(7,72)
(7,69)-(7,70)
(7,71)-(7,72)
*)
