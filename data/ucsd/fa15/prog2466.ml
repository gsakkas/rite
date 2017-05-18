
let stringOfList f l =
  let l' = List.map f l in
  match l' with
  | [] -> []
  | _ ->
      let rec makeString res =
        match res with | [] -> "" | h::t -> h ^ (makeString t) in
      makeString l';;
