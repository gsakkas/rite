
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h @ [seen] in
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
(7,20)-(7,64)
(7,54)-(7,55)
(7,59)-(7,63)
*)

(* type error slice
(7,23)-(7,40)
(7,24)-(7,32)
(7,33)-(7,34)
(7,35)-(7,39)
(7,54)-(7,55)
(7,54)-(7,64)
(7,56)-(7,57)
(7,58)-(7,64)
(7,58)-(7,64)
(7,59)-(7,63)
*)
