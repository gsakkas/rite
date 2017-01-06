
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [seen; h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;



let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* changed spans
(7,55)-(7,61)
(7,63)-(7,64)
*)

(* type error slice
(7,25)-(7,40)
*)
