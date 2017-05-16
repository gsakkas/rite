
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not l.mem h then h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;
