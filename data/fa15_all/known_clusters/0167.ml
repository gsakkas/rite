LetG NonRec (fromList [LamG EmptyG]) (LetG Rec (fromList [EmptyG]) EmptyG)
let assignSeen =
  fun h ->
    fun r ->
      fun seen ->
        if List.mem h r
        then seen
        else h :: seen in
let rec helper =
  fun (seen , rest) ->
    match rest with
    | [] -> seen
    | h :: t -> (let r =
                   List.rev t in
                 let seen' =
                   assignSeen h r seen in
                 let rest' = t in
                 helper (seen' , rest')) in
List.rev (helper ([] , l))
let assignSeen =
  fun h ->
    fun r ->
      fun seen ->
        if List.mem h r
        then seen
        else h :: seen in
let rec helper =
  fun (seen , rest) ->
    match rest with
    | [] -> seen
    | h :: t -> (let r =
                   List.rev t in
                 let seen' =
                   assignSeen h r seen in
                 let rest' = t in
                 helper (seen' , rest')) in
List.rev (helper ([] , l))
