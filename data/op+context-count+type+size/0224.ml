
let _ =
  let removeDuplicates l =
    let rec helper (seen,rest) =
      match rest with
      | [] -> seen
      | h::t ->
          if (List.mem (h, seen)) = true
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
(8,14)-(8,15)
(8,24)-(8,25)
(8,26)-(8,27)
(8,32)-(8,41)
(9,16)-(9,23)
(10,16)-(10,25)
(10,56)-(10,57)
*)

(* type error slice
*)
