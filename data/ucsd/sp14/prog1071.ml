
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen cons [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;
