
let _ =
  let removeDuplicates l =
    let rec helper (seen,rest) =
      match rest with
      | [] -> seen
      | h::t ->
          let x = List.mem (h, seen) in
          if x = true
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
(8,15)-(8,16)
(8,28)-(8,29)
(8,30)-(8,31)
(8,36)-(9,22)
(10,16)-(10,23)
(11,16)-(11,25)
(11,56)-(11,57)
*)

(* type error slice
*)
