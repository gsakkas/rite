
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
(8,20)-(8,21)
*)

(* type error slice
(3,2)-(9,27)
(3,18)-(8,46)
(4,4)-(8,46)
(4,4)-(8,46)
(4,10)-(4,14)
(8,8)-(8,46)
(8,20)-(8,21)
(8,25)-(8,31)
(8,25)-(8,46)
(8,32)-(8,46)
(8,40)-(8,45)
*)
