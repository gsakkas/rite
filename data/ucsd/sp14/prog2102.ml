
let assoc (d,k,l) =
  match l with
  | h::t ->
      let rec helper di ki li =
        let (name,age) = li in
        if name = ki
        then di
        else (match li with | h::t -> helper di ki t | _ -> di) in
      helper d k h;;
