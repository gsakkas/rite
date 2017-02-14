
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem (h, seen) with | true  -> [] | false  -> [h] in
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
(8,11)-(8,70)
(8,17)-(8,25)
(8,17)-(8,34)
(8,27)-(8,28)
(8,27)-(8,34)
(8,30)-(8,34)
(8,52)-(8,54)
(9,9)-(9,46)
*)

(* type error slice
(8,11)-(8,70)
(8,11)-(8,70)
(8,11)-(8,70)
(8,11)-(8,70)
(8,17)-(8,25)
(8,17)-(8,34)
*)
