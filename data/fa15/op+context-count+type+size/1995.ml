
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
(8,16)-(8,34)
(8,25)-(8,34)
(11,8)-(11,46)
*)

(* type error slice
(8,10)-(10,26)
(8,10)-(10,26)
(8,10)-(10,26)
(8,10)-(10,26)
(8,16)-(8,24)
(8,16)-(8,34)
*)
