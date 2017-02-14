
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem (h, seen) with
          | true  -> seen @ [h]
          | false  -> seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem h seen with | true  -> seen @ [h] | false  -> seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,17)-(8,34)
(8,27)-(8,34)
(11,9)-(11,46)
*)

(* type error slice
(8,11)-(10,27)
(8,11)-(10,27)
(8,11)-(10,27)
(8,11)-(10,27)
(8,17)-(8,25)
(8,17)-(8,34)
*)
