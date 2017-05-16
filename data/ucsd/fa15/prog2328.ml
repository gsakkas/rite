
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        if List.mem h r
        then
          let seen' = h :: seen in
          let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;
