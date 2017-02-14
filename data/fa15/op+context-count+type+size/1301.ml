
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, seen) then [] else [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if true then [] else [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,32)
(7,24)-(7,41)
(7,34)-(7,35)
(7,34)-(7,41)
(7,37)-(7,41)
*)

(* type error slice
(7,21)-(7,59)
(7,24)-(7,32)
(7,24)-(7,41)
*)
