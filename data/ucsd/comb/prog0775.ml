
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;
