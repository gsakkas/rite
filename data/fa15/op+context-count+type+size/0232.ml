
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem h with | true  -> seen | false  -> h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem h seen with | true  -> seen | false  -> h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,16)-(8,26)
(8,60)-(8,69)
*)

(* type error slice
(8,10)-(8,69)
(8,10)-(8,69)
(8,10)-(8,69)
(8,10)-(8,69)
(8,16)-(8,24)
(8,16)-(8,26)
*)
