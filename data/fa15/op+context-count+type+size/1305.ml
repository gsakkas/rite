
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h seen) then [] else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [] else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,40)
(7,32)-(7,40)
*)

(* type error slice
(7,20)-(7,63)
(7,23)-(7,31)
(7,23)-(7,40)
(7,32)-(7,40)
(7,33)-(7,34)
(7,35)-(7,39)
(7,54)-(7,55)
(7,54)-(7,63)
(7,54)-(7,63)
(7,59)-(7,63)
*)
