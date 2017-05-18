
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          let x = List.mem (h, seen) in
          if x = true
          then seen' = seen
          else seen' = (List.rev (h :: (List.rev seen))) in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;
