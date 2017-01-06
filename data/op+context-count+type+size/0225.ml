
let _ =
  let removeDuplicates l =
    let rec helper (seen,rest) =
      match rest with
      | [] -> seen
      | h::t ->
          if List.mem (h, seen)
          then seen' = seen
          else seen' = (List.rev (h :: (List.rev seen))) in
    let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;



let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          if List.mem h seen then seen else List.rev (h :: (List.rev seen)) in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* changed spans
(2,5)-(3,6)
(8,23)-(8,24)
(8,25)-(8,26)
(8,31)-(8,32)
(9,16)-(9,23)
(10,16)-(10,25)
(10,56)-(10,57)
*)

(* type error slice
*)
