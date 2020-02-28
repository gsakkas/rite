
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | _ ->
        let seen' = if List.mem 0 seen then seen else 0 :: seen in
        let rest' = 0 in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | _ ->
        let seen' = if List.mem 0 seen then seen else 0 :: seen in
        let rest' = [0] in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,21)-(8,22)
[0]
ListG [LitG]

*)

(* type error slice
(3,3)-(9,28)
(3,19)-(8,47)
(4,5)-(8,47)
(4,11)-(4,15)
(8,9)-(8,47)
(8,21)-(8,22)
(8,26)-(8,32)
(8,26)-(8,47)
(8,33)-(8,47)
(8,41)-(8,46)
*)
