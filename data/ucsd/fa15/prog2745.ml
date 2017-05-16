
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then h else h :: t in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;
