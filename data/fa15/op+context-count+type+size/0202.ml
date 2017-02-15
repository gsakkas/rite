
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem seen h with | true  -> seen | false  -> h :: seen in
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
(8,25)-(8,29)
(8,65)-(8,74)
*)

(* type error slice
(8,16)-(8,24)
(8,16)-(8,31)
(8,25)-(8,29)
(8,30)-(8,31)
(8,65)-(8,66)
(8,65)-(8,74)
(8,65)-(8,74)
(8,70)-(8,74)
*)
