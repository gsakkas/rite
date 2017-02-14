
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
(8,10)-(8,69)
(8,16)-(8,24)
(8,16)-(8,34)
(8,25)-(8,34)
(8,26)-(8,27)
(8,29)-(8,33)
(8,51)-(8,53)
(9,8)-(9,46)
*)

(* type error slice
(8,10)-(8,69)
(8,10)-(8,69)
(8,10)-(8,69)
(8,10)-(8,69)
(8,16)-(8,24)
(8,16)-(8,34)
*)
