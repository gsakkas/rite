
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let rest' = List.rev t in
        let seen' = seen in
        if (List.mem h rest') = false then seen' helper (seen', rest') in
  List.rev (helper ([], l));;
