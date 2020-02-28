
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h :: seen in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,64)-(7,64)
seen
VarG

(8,21)-(8,45)
t
VarG

*)

(* type error slice
(7,21)-(7,64)
(7,55)-(7,64)
(7,64)-(7,64)
*)
